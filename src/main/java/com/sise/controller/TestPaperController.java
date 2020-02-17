package com.sise.controller;

import com.sise.dao.TestPaperDao;
import com.sise.domain.Page;
import com.sise.domain.Single;
import com.sise.domain.TestPaper;
import com.sise.domain.teacher.Teacher;
import com.sise.service.SingleService;
import com.sise.service.TestPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/testpaper")
@SessionAttributes(value = {"num","teacherId","tpId","teacherName"})
public class TestPaperController {
    @Resource(name = "testPaperService")
    private TestPaperService testPaperService;

    @Resource(name = "singleService")
    private SingleService singleService;

    //跳转到添加试卷页面
    @RequestMapping(path = "/addpaperjsp")
    public String addPaperjsp(ModelMap modelMap){
        int teacherId = (int) modelMap.get("teacherId");
        System.out.println(teacherId+"qqq");
        modelMap.addAttribute("teacherId",teacherId);
        return "admin/addPaper";
    }

    //添加试卷
    @RequestMapping(path = "/addpaper")
    /*public String addPaper(TestPaper testPaper,ModelMap model) throws Exception {*/
    public String addPaper(String tpName,String tpStartTime,String tpTimeLength,String tpType,ModelMap model) throws Exception {
        int teacherId = (int) model.get("teacherId");
        TestPaper testPaper = new TestPaper();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date parse = df.parse(tpStartTime);
        testPaper.setTeacherId(teacherId);
        testPaper.setTpName(tpName);
        testPaper.setTpStartTime(parse);
        testPaper.setTpTimeLength(tpTimeLength);
        testPaper.setTpType(tpType);

        testPaperService.addPaper(testPaper);
        int num = 1;
        model.addAttribute("num",num);
        System.out.println(testPaper.toString());
        return "admin/perfectPaper";
        /*request.getRequestDispatcher("/testpaper/findAllPaper").forward(request,response);*/
    }

    //遍历所有试卷，分页显示
    @RequestMapping(path = "/findAllPaper")
    public String findByPaper(String _currentPage ,ModelMap model,HttpServletRequest request){
        int rows = 5;
        if (_currentPage == null || "".equals(_currentPage)){
            _currentPage = "1";
            Page<TestPaper> pages= testPaperService.findByPaper(_currentPage,rows);
            model.addAttribute("pages",pages);

        }else {
            Page<TestPaper> pages= testPaperService.findByPaper(_currentPage,rows);
            model.addAttribute("pages",pages);
        }
        /*System.out.println(teacher.toString()+"我是");
        model.addAttribute("teacher",teacher);*/
        HttpSession session = request.getSession();
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        model.addAttribute("teacher",teacher);
        int teacherId = teacher.getTeacherId();
        String teacherName = teacher.getTeacherName();
        model.addAttribute("teacherName",teacherName);
        model.addAttribute("teacherId",teacherId);
        return "admin/listExam";
    }

    //完善试卷，给试卷添加题目,一直会出现下一题
    @RequestMapping(path = "/addQuestion")
    public String addQuestion(Single single, ModelMap model){
            //先获取最新试卷的id值
            int gainId = testPaperService.gainId();
            single.setTpId(gainId);
            singleService.addQuestion(single);
            //已经为试卷增加了"num"道题
            int num = (int) model.get("num");
            //页面跳转到下一题
            num = num + 1;
            model.addAttribute("num",num);
            return "admin/perfectPaper";

    }

    //完善试卷完毕，不会再出现下一题，提交试卷
    @RequestMapping(path = "/finish")
    public String finish(Single single,SessionStatus status){
        status.setComplete();
        int gainId = testPaperService.gainId();
        single.setTpId(gainId);
        singleService.addQuestion(single);
        return "forward:/testpaper/findAllPaper";
    }

    //查看试卷
    @RequestMapping(path = "/lookPaper")
    public String lookPaper(String tpId,String _currentPage,String tpName,ModelMap modelMap){
        Page<Single> byAPaper;
        int rows = 2;    //两题为一页
        if(_currentPage == null || "".equals(_currentPage)){
            _currentPage = "1";
        }
        if (null == tpId){
            int tId= (int) modelMap.get("tpId");
            modelMap.addAttribute("tpId",tId);
            modelMap.addAttribute("tpName",tpName);
            byAPaper = singleService.findByAPaper(tId, _currentPage, rows);
            modelMap.addAttribute("byAPaper",byAPaper);

            int totalCount = byAPaper.getTotalCount();
            int currentPage = Integer.parseInt(_currentPage);

        }
        //刚进入查看试卷
        if(null != tpId){
            int id = Integer.parseInt(tpId);
            modelMap.addAttribute("tpId",id);
            byAPaper = singleService.findByAPaper(id, _currentPage, rows);
            modelMap.addAttribute("tpName",tpName);
            modelMap.addAttribute("tpId",id);         //此id为该套试卷的id
            modelMap.addAttribute("byAPaper",byAPaper);
            int totalCount = byAPaper.getTotalCount();
            modelMap.addAttribute("totalCount",totalCount);

        }
        return "admin/lookPaper";
    }

    //点击删除按钮，删除试卷
    @RequestMapping(path = "/deletepaper")
    public String  deletePaper(String tpId,String _currentPage){
        int tpid = Integer.parseInt(tpId);
        //当点击删除按钮时，先删除single表中对应的试题
        singleService.deletePaper(tpid);
        //删完试题之后，再将该试卷删除
        testPaperService.deletePaper(tpid);
        return "forward:/testpaper/findAllPaper";
    }



}
