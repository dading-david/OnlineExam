package com.sise.service;

import com.sise.domain.student.Student;

public interface StudentService {
    //登录时，校验账号和密码是否正确
    public Student findStudent(Student student);

    //登录时，校验账号和密码是否正确
    public int checkStudent(Student student);

    //用户名是否已经被使用
    public int checkName(String username);

    //学生注册账户
    public void register(Student student);
}
