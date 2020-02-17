package com.sise.service.impl;

import com.sise.dao.TestPaperDao;
import com.sise.domain.Page;
import com.sise.domain.TestPaper;
import com.sise.service.TestPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "testPaperService")
public class TestPaperServiceImpl implements TestPaperService{

    @Autowired()
    @Qualifier(value = "testPaperDao")
    private TestPaperDao testPaperDao;

    @Autowired()
    private Page<TestPaper> page;

    ////添加试卷
    @Override
    public void addPaper(TestPaper testPaper) {
        testPaperDao.addPaper(testPaper);
    }

    ////将所有试卷遍历出来
    @Override
    public List<TestPaper> findAllPaper() {
        List<TestPaper> allPaper = testPaperDao.findAllPaper();
        return allPaper;
    }

    //试卷的总数
    @Override
    public int findTotalPaper() {
        int totalCount = testPaperDao.findTotalPaper();
        return totalCount;
    }

    //分页显示试卷
    @Override
    public Page<TestPaper> findByPaper(String _currentPage , int rows) {
        int currentPage = Integer.parseInt(_currentPage);    //获取到当前页
        int totalCount = testPaperDao.findTotalPaper();    //试卷总数
        int totalPage = (totalCount % rows == 0) ? (totalCount / rows) : (totalCount / rows)+1; //总页数
        int start = (currentPage - 1) * rows;           //起始位置，从第几条开始，拿取10条数据
        List<TestPaper> list = testPaperDao.findByPaper(start, rows);       //当前页的10条数据，用list集合封装

        page.setRows(rows);
        page.setCurrentPage(currentPage);
        page.setTotalCount(totalCount);
        page.setTotalPage(totalPage);
        page.setList(list);
        return page;
    }

    @Override
    public int gainId() {
        int gainId = testPaperDao.gainId();
        return gainId;
    }

    @Override
    public void deletePaper(int tpId) {
        testPaperDao.deletePaper(tpId);
    }


}
