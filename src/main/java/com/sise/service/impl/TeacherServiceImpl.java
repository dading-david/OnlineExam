package com.sise.service.impl;

import com.sise.dao.TeacherDao;
import com.sise.domain.teacher.Teacher;
import com.sise.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "teacherService")
public class TeacherServiceImpl implements TeacherService{

    @Resource(name = "teacherDao")
    private TeacherDao teacherDao;

    @Override
    public Teacher findTeacher(Teacher teacher) {
        return teacherDao.findTeacher(teacher);
    }

    @Override
    public int checkTeacher(Teacher teacher) {
        int i = teacherDao.checkTeacher(teacher);
        return i;
    }


}
