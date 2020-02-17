package com.sise.service;

import java.util.List;

public interface StudentExamService {
    //存储学生答案
    public void savaAnswer(com.sise.domain.student.StudentExam studentExam);

    //获取试卷的答案
    public List<String> correctAnswer(int tpId);

    //通过id获取到规定的考试时长
    public String tpTime(int tpId);
}
