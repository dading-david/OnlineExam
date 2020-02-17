package com.sise.controller.login;

import com.sise.domain.student.Student;
import com.sise.domain.teacher.Teacher;
import com.sise.service.StudentService;
import com.sise.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(path = "/login")
public class LoginController {

    @Resource(name = "studentService")
    private StudentService studentService;

    @Resource(name = "student")
    private Student student;

    @Resource(name = "teacherService")
    private TeacherService teacherService;

    @Resource(name = "teacher")
    private Teacher teacher;

    @RequestMapping(path = "/loginIdentity")
    public String loginIdentity(String username, String password, String identical, ModelMap modelMap, HttpServletRequest request){
        //先判断用户名或密码是否为空
        if (username == "" || password == ""){
            modelMap.addAttribute("msg","用户名或密码不能为空");
            return "../login";
        }else{
            //再进行是学生身份还是教师身份的登录
            if (identical.equals("学生登录")){
                student.setStuName(username);
                student.setStuPwd(password);
                int num = studentService.checkStudent(student);
                if (num != 0){
                    Student stu = studentService.findStudent(student);
                    HttpSession session = request.getSession();
                    session.setAttribute("student",stu);;
                    return "forward:/student/findAllPaper";
                }else {
                    modelMap.addAttribute("msg","用户名或密码错误");
                    return "../login";
                }
            }else {
                teacher.setTeacherName(username);
                teacher.setTeacherPwd(password);
                int num = teacherService.checkTeacher(teacher);
                if (num != 0){
                    Teacher teachers = teacherService.findTeacher(teacher);
                    modelMap.addAttribute("teacher",teachers);      //将这位登录老师的信息传到testpaper/findAllPaper方法中，有该方法传到页面上
                    HttpSession session = request.getSession();
                    session.setAttribute("teacher",teachers);;
                    //request.setAttribute("teacherName",teachers.getTeacherName());
                    return "forward:/testpaper/findAllPaper";
                }else {
                    modelMap.addAttribute("msg","用户名或密码错误");
                    return "../login";
                }
            }
        }
    }

    //检验用户注册时，用户名是否已经被使用
    @RequestMapping(path = "/checkName",method = RequestMethod.POST,produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String checkName(String username){
        System.out.println(username+"aaa");
        String msg;
        //判断用户名是否已经被使用
        int num = studentService.checkName(username);
        if(num != 0 || "" == username){
            msg =  "1";
        }else {
            msg = null;
        }
        return msg;
    }

    //注册用户
    @RequestMapping(path = "/register")
    public String register(String username,String password){
        student.setStuName(username);
        student.setStuPwd(password);
        studentService.register(student);
        return "../login";
    }

}
