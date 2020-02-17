package com.sise.service.impl;

import com.sise.dao.StudentDao;
import com.sise.domain.student.Student;
import com.sise.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "studentService")
public class StudentServiceImpl implements StudentService{
    @Resource(name = "studentDao")
    private StudentDao studentDao;

    @Override
    //登录时，校验账号和密码是否正确
    public Student findStudent(Student stu) {
        Student student = studentDao.findStudent(stu);
        return student;
    }

    @Override
    public int checkStudent(Student student) {
        int i = studentDao.checkStudent(student);
        return i;
    }

    @Override
    //用户名是否已经被使用
    public int checkName(String username) {
        int num = studentDao.checkName(username);
        return num;
    }

    @Override
    //学生注册账户
    public void register(Student student) {
        studentDao.register(student);
    }
}
