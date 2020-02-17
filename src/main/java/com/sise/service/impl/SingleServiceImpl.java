package com.sise.service.impl;

import com.sise.dao.SingleDao;
import com.sise.domain.Page;
import com.sise.domain.QuestionBank;
import com.sise.domain.Single;
import com.sise.service.SingleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "singleService")
public class SingleServiceImpl implements SingleService {
    @Autowired
    @Qualifier(value = "singleDao")
    private SingleDao singleDao;

    @Resource(name = "page")
    private Page<Single> pages;

    //完善试卷，向最新的试卷添加试题
    @Override
    public void addQuestion(Single single) {
        singleDao.addQuestion(single);
    }

    //获取这套试卷所关联的题目
    @Override
    public List<Single> papersingles(int tpid) {
        List<Single> singles = singleDao.papersingles(tpid);
        return singles;
    }

    //当single表中相关试题存入到题库中，删除single表中对应的试题
    @Override
    public void deletePaper(int tpId) {
        singleDao.deletePaper(tpId);
    }

    @Override
    public int totalCount(int tpid) {
        int totalCount = singleDao.totalCount(tpid);
        return totalCount;
    }

    @Override
    public Page<Single> findByAPaper(int tpid, String _currentPage , int rows) {
        int currentPage = Integer.parseInt(_currentPage);
        int totalCount = singleDao.totalCount(tpid);                //这套试卷有多少题目
        int totalPage = (totalCount % rows == 0) ? (totalCount / rows) : (totalCount / rows)+1; //总页数
        int start = (currentPage - 1) * rows;            //起始数据，从第几条开始，选取其后的5条
        List<Single> byAPaper = singleDao.findByAPaper(tpid, start, rows);

        pages.setCurrentPage(currentPage);
        pages.setTotalCount(totalCount);
        pages.setTotalPage(totalPage);
        pages.setList(byAPaper);
        pages.setRows(rows);
        return pages;
    }



}
