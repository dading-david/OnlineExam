package com.sise.controller;

import com.sise.domain.Page;
import com.sise.domain.QuestionBank;
import com.sise.domain.Single;
import com.sise.service.QuestionBankService;
import com.sise.service.SingleService;
import com.sise.service.TestPaperService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(path = "/questionbank")
public class QuestionBankController {

    @Resource(name = "singleService")
    private SingleService singleService;

    @Resource(name = "questionBankService")
    private QuestionBankService questionBankService;

    @Resource(name = "testPaperService")
    private TestPaperService testPaperService;

    //将试卷中的题目放入到题库中
    @RequestMapping(path = "/addquestionBank")
    public String addquestionBank(String tpId, String _currentPage, Model model){
        //通过试卷的id查询关联的题
        int tpid = Integer.parseInt(tpId);
        List<Single> singles = singleService.papersingles(tpid);
        //将题目存到题库中
        for (Single single : singles) {
            questionBankService.addquestionBank(single);
        }
        //当single表中相关试题存入到题库中，删除single表中对应的试题
        singleService.deletePaper(tpid);
        //删完试题之后，再将该试卷删除
        testPaperService.deletePaper(tpid);
        //记录当前页
        model.addAttribute("cPage",_currentPage);
        return "forward:/testpaper/findAllPaper";
    }

    //显示题库，分页显示
    @RequestMapping(path = "/showQuestionBank")
    public String showQuestionBank(String _currentPage,String teacherName,ModelMap model){
        if(_currentPage == null || "".equals(_currentPage)){
            _currentPage = "1";
        }
        int rows = 3;//以5道题为一页
        Page<QuestionBank> pages = questionBankService.findByquestionBank(_currentPage, rows);
        model.addAttribute("pages",pages);
        model.addAttribute("teacherName",teacherName);
        return "admin/questionBank";
    }

    //删除题库中的单条试题
    @RequestMapping(path = "/deleteId")
    public String deleteId(String id , String _currentPage, Model model){
        int quId = Integer.parseInt(id);
        questionBankService.deleteId(quId);
        return "forward:/questionbank/showQuestionBank";
    }
}
