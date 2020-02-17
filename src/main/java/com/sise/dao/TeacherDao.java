package com.sise.dao;


import com.sise.domain.teacher.Teacher;
import org.springframework.stereotype.Repository;

@Repository(value = "teacherDao")
public interface TeacherDao {
    //登录时，获取老师信息
    public Teacher findTeacher(Teacher teacher);

    //校验账号和密码是否正确
    public int checkTeacher(Teacher teacher);
}
