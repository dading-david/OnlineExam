package com.sise.service;

import com.sise.domain.Page;
import com.sise.domain.TestPaper;

import java.util.List;

public interface TestPaperService {
    //添加试卷
    public void addPaper(TestPaper testPaper);

    //遍历试卷
    public List<TestPaper> findAllPaper();

    //试卷的总数
    public int findTotalPaper();

    //分页显示试卷
    public Page<TestPaper> findByPaper(String currentPage , int rows);

    //获取最新插入的试卷的id
    public int gainId();

    //将试卷加入题库之后，删除试卷
    public void deletePaper(int tpId);
}
