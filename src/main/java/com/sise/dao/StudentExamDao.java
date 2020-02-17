package com.sise.dao;

import com.sise.domain.student.StudentExam;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "studentExamDao")
public interface StudentExamDao {
    //存储学生答案
    public void savaAnswer(StudentExam studentExam);

    //获取试卷的答案
    public List<String> correctAnswer(int tpId);

    //通过id获取到规定的考试时长
    public String tpTime(int tpId);
}
