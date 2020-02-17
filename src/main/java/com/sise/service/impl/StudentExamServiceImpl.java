package com.sise.service.impl;

import com.sise.dao.StudentExamDao;
import com.sise.domain.student.StudentExam;
import com.sise.service.StudentExamService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "studentExamService")
public class StudentExamServiceImpl implements StudentExamService{
    @Resource(name = "studentExamDao")
    private StudentExamDao studentExamDao;

    @Override
    public void savaAnswer(StudentExam studentExam) {
        studentExamDao.savaAnswer(studentExam);
    }

    @Override
    //获取试卷的答案
    public List<String> correctAnswer(int tpId) {
        return studentExamDao.correctAnswer(tpId);
    }

    @Override
    public String tpTime(int tpId) {
        return studentExamDao.tpTime(tpId);
    }

}
