package com.sise.service.impl;

import com.sise.dao.QusetionBankDao;
import com.sise.domain.Page;
import com.sise.domain.QuestionBank;
import com.sise.domain.Single;
import com.sise.service.QuestionBankService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "questionBankService")
public class QuestionBankServiceImpl implements QuestionBankService{

    @Resource(name = "page")
    private Page<QuestionBank> pages;

    @Resource(name = "questionBankDao")
    private QusetionBankDao qusetionBankDao;

    @Override
    //将查询出来的所有题放入到题库中
    public void addquestionBank(Single single) {
        qusetionBankDao.addquestionBank(single);
    }

    @Override
    //显示题库中所有的题
    public List<QuestionBank> findAllquestionBank() {
        List<QuestionBank> allquestionBank = qusetionBankDao.findAllquestionBank();
        return allquestionBank;
    }

    @Override
    //统计题库共有多少题
    public int totalquestionBank() {
        int i = qusetionBankDao.totalquestionBank();
        return i;
    }

    @Override
    //根据指定的页数，来显示题库中的题
    public Page<QuestionBank> findByquestionBank(String _curentPage, int rows) {
        //刚进入页面时，显示在第一页
        if(_curentPage == null || "".equals(_curentPage)){
            _curentPage = "1";
        }
        //记录当前页
        int currentage = Integer.parseInt(_curentPage);
        int totalCount = qusetionBankDao.totalquestionBank();  //题库中试题的总数
        int totalPage = (totalCount % rows == 0) ? (totalCount / rows) : (totalCount / rows)+1; //总页数
        int start = (currentage - 1) * rows;            //起始数据，从第几条开始，选取其后的5条
        List<QuestionBank> byquestionBank = qusetionBankDao.findByquestionBank(start, rows);
        pages.setList(byquestionBank);
        pages.setTotalPage(totalPage);
        pages.setTotalCount(totalCount);
        pages.setCurrentPage(currentage);
        return pages;
    }

    @Override
    //删除题库中的单条试题
    public void deleteId(int qbId) {
        qusetionBankDao.deleteId(qbId);
    }
}
