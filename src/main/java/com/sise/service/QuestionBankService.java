package com.sise.service;

import com.sise.domain.Page;
import com.sise.domain.QuestionBank;
import com.sise.domain.Single;

import java.util.List;

public interface QuestionBankService {
    //将查询出来的所有题放入到题库中
    public void addquestionBank(Single singles);

    //显示题库中所有的题
    public List<QuestionBank> findAllquestionBank();

    //统计题库共有多少题
    public int totalquestionBank();

    //根据指定的页数，来显示题库中的题
    public Page<QuestionBank> findByquestionBank(String _currentPage, int rows);

    //删除题库中的单条试题
    public void deleteId(int qbId);
}
