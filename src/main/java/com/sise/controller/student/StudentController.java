package com.sise.controller.student;

import com.sise.domain.Page;
import com.sise.domain.Single;
import com.sise.domain.TestPaper;
import com.sise.domain.student.Answer;
import com.sise.domain.student.Student;
import com.sise.domain.student.StudentExam;
import com.sise.domain.teacher.Teacher;
import com.sise.service.SingleService;
import com.sise.service.StudentExamService;
import com.sise.service.TestPaperService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
@Controller
@RequestMapping(path = "/student")
@SessionAttributes(value = {"stuId","tpId","tpName","totalCount","TorF","totalscore"})
public class StudentController {
    @Resource(name = "testPaperService")
    private TestPaperService testPaperService;

    @Resource(name = "singleService")
    private SingleService singleService;

    @Resource(name = "answer")
    private Answer answer;

    @Resource(name = "studentExamService")
    private StudentExamService studentExamService;

    @Resource(name = "studentExam")
    private StudentExam studentExam;

    private Map<Integer,String> maps = new HashMap<>(); //存储学生的试卷选项

    private List<String> lists = new ArrayList<>();

    private List<String> currentAnswer;       //将试卷的正确答案保存到该字符串中

    private int id;         //用来存放试卷id

    private long firstTime;       //保存刚开始做题时的当前毫秒值

    //遍历所有试卷，显示在试卷列表页面上，分页显示
    @RequestMapping(path = "/findAllPaper")
    public String findAllPaper(String _currentPage , ModelMap modelMap,HttpServletRequest request){
        int rows = 6; //6张试卷为1页
        if (_currentPage == null || "".equals(_currentPage)){
            _currentPage = "1";
        }
        Page<TestPaper> pages = testPaperService.findByPaper(_currentPage, rows);   //分页显示
        modelMap.addAttribute("pages",pages);
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        String stuName = student.getStuName();
        int stuId = student.getStuId();
        modelMap.addAttribute("stuId",stuId);
        modelMap.addAttribute("stuName",stuName);
        return "student/studentListPaper";
    }

    //点击考试考试，根据tpid来显示试卷
    /*@RequestMapping(path = "/findAPaper")
    public String showAPaper(String id , String tpName , ModelMap modelMap){
        //获取学生要考试的试卷的id
        System.out.println(id+tpName+"aaaaaa");
        int tpId = Integer.parseInt(id);
        //根据id到single表中找出该试卷所包含的题目
        List<Single> singles = singleService.papersingles(tpId);
        modelMap.addAttribute("tpName",tpName);
        modelMap.addAttribute("singles",singles);
        return "student/studentDoPaper";
    }*/

    //分页显示试卷题目
    @RequestMapping(path = "/findByAPaper")
    public String findByAPaper(String _currentPage , String tpId , String tpName , ModelMap modelMap){

        Page<Single> byAPaper;
        int rows = 2;    //两题为一页
        if(_currentPage == null || "".equals(_currentPage)){
            _currentPage = "1";
        }
        if (null == tpId){
            int tId= (int) modelMap.get("tpId");
            modelMap.addAttribute("tpId",tId);
            byAPaper = singleService.findByAPaper(tId, _currentPage, rows);
            modelMap.addAttribute("byAPaper",byAPaper);

            int totalCount = byAPaper.getTotalCount();
            int currentPage = Integer.parseInt(_currentPage);
            //String option0 = lists.get(0 + currentPage * 2 - 1);
            //判断是否数组越界
            String option1;
            String option0;
            if (totalCount< (0 + currentPage * 2 - 1)){
                option0 = null;
            }else{
                option0 = lists.get(0 + currentPage * 2 - 1);
            }

            if (totalCount< (1 + currentPage * 2 - 1)){
                option1 = null;
            }else{
                option1 = lists.get(1 + currentPage * 2 - 1);
            }
            Map<String,String> torF = (Map<String, String>) modelMap.get("TorF");
            modelMap.addAttribute("TF",torF);

            modelMap.addAttribute("option0",option0);
            modelMap.addAttribute("option1",option1);
            Object totalscore = modelMap.get("totalscore");
            if(null == totalscore){
            }else{
                modelMap.addAttribute("totalscore",totalscore);
            }
        }
        if(null != tpId){
            //点击考试时，先获取试卷的答案
            int tp_id = Integer.parseInt(tpId);
            currentAnswer = studentExamService.correctAnswer(tp_id);
            //System.out.println(currentAnswer.get(1));

            int id = Integer.parseInt(tpId);
            byAPaper = singleService.findByAPaper(id, _currentPage, rows);
            modelMap.addAttribute("tpName",tpName);
            modelMap.addAttribute("tpId",id);         //此id为该套试卷的id
            modelMap.addAttribute("byAPaper",byAPaper);
            int totalCount = byAPaper.getTotalCount();
            modelMap.addAttribute("totalCount",totalCount);


            firstTime = System.currentTimeMillis();      //开始做题的当前时间

            lists = answer.lists(totalCount);
        }
        return "student/studentDoPaper";
    }

    @RequestMapping(path = "/doPaper")
    public String doPaper(String tnum0,String tnum1,String select0, String select1,String _currentPage,ModelMap modelMap){

        if(_currentPage == null || "".equals(_currentPage)){
            _currentPage = "1";
        }
        int currentPage = Integer.parseInt(_currentPage);
        if (null != tnum0){
            int tNum0 = Integer.parseInt(tnum0);
            //maps.put(tNum0,select0);
            lists.set(tNum0,select0);
        }
        if (null != tnum1){
            int tNum1 = Integer.parseInt(tnum1);
            //maps.put(tNum1,select1);
            lists.set(tNum1,select1);
        }
        int totalCount = (int) modelMap.get("totalCount");


        return "forward:/student/findByAPaper";
    }

    @RequestMapping(path = "/submitanswer")
    public String submitanswer(String tnum0,String tnum1,String select0, String select1,ModelMap modelMap){
        //解决的是，就算没有点击分页导航，而是点击完成试卷，还是可以保存学生的选项
        if (null != tnum0){
            int tNum0 = Integer.parseInt(tnum0);
            lists.set(tNum0,select0);
        }
        if (null != tnum1){
            int tNum1 = Integer.parseInt(tnum1);
            lists.set(tNum1,select1);
        }

        //将答案进行存储
        int tpid = (int) modelMap.get("tpId");
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i<lists.size();i++){
            sb.append(lists.get(i)+",");
        }
        System.out.println(sb.toString());

        /*比较试卷的正确答案和学生选的，结算成绩*/
        int totalCount = singleService.totalCount(tpid);        //总题数
        double avgscore = 100/totalCount;
        double totalscore = 0.0;
        String s1;
        String s2;
        Map<String,String> TorFMap  = new LinkedHashMap<>();
        for (int i = 0 ; i < totalCount ;i++){
            s1 = lists.get(i+1);
            s2 = currentAnswer.get(i);
            if (s2.equals(s1)){
                totalscore += avgscore;

                TorFMap.put(""+(i+1),"回答正确");
            }else {
                TorFMap.put(""+(i+1),"回答错误");
            }
        }
        modelMap.addAttribute("TorF",TorFMap);

        modelMap.addAttribute("totalscore",totalscore);
        studentExam.setStuId((Integer) modelMap.get("stuId"));
        studentExam.setTpId(tpid);
        studentExam.setExamScore(totalscore);
        studentExam.setExamTime("80分钟");        //模拟一个学生考试用时
        studentExam.setExamAnswer(sb.toString());
        studentExamService.savaAnswer(studentExam);
        return "forward:/student/doPaper";
    }

    //倒计时功能
    @RequestMapping(path = "/countDown",method = RequestMethod.POST,produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String countDown(ModelMap modelMap, HttpServletResponse response){
        String remainTime;
        id = (int) modelMap.get("tpId");
        String tpTime = studentExamService.tpTime(id);
        int time = Integer.parseInt(tpTime);

        long endTime = firstTime + (time * 60 * 1000);     //结束时间
        long currentTime = System.currentTimeMillis();      //ajax每隔一秒刷新一次时，所获取的当前毫秒值
        long intervalTime = endTime - currentTime;          //剩余的时间毫秒值
        int second = (int) (intervalTime /1000);            //将毫秒转为秒
        System.out.println(second+"秒");
        int s = second % 60;    //剩余的秒
        int m = second  / 60;     //剩余的分钟

        //判断考试时间是否已经为0
        if(m < 0 || s <=0){
            remainTime = null;
            System.out.println("时间到");
        }else {
            remainTime = m + "分" + s + "秒";
            System.out.println(remainTime);
        }
        return remainTime;
    }

    //清空缓存
    @RequestMapping(path = "/deletesession")
    public String deletesession(HttpSession session, SessionStatus status){
        status.setComplete();
        return "forward:/student/findAllPaper";
    }
}
