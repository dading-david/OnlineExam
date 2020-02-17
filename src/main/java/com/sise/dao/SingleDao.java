package com.sise.dao;

import com.sise.domain.Single;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository(value = "singleDao")
public interface SingleDao {
    //完善试卷，向最新的试卷添加试题
    public void addQuestion(Single single);

    //获取这套试卷所关联的题目
    public List<Single> papersingles(int tpid);

    //当single表中相关试题存入到题库中，删除single表中的试题
    public void deletePaper(int tpId);

    //分页功能
    public List<Single> findByAPaper(int tpid ,int start , int rows);

    //统计一套试卷中有多少题目
    public int totalCount(int tpid);
}
