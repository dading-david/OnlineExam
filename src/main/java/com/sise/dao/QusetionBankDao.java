package com.sise.dao;

import com.sise.domain.QuestionBank;
import com.sise.domain.Single;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository(value = "questionBankDao")
public interface QusetionBankDao {
    //将查询出来的所有题放入到题库中
    public void addquestionBank(Single single);

    //显示题库中所有的题
    public List<QuestionBank> findAllquestionBank();

    //统计题库公有多少题
    public int totalquestionBank();

    //根据指定的页数，来显示题库中的题
    public List<QuestionBank> findByquestionBank(int start,int rows);

    //删除题库中的单条试题
    public void deleteId(int qbId);
}
