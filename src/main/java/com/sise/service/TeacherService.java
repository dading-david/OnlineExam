package com.sise.service;

import com.sise.domain.teacher.Teacher;

public interface TeacherService {
    //登录时，校验账号和密码是否正确
    public Teacher findTeacher(Teacher teacher);

    //校验账号和密码是否正确
    public int checkTeacher(Teacher teacher);
}
