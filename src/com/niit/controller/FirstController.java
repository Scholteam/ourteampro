package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.biz.IStudentBiz;
import com.niit.biz.IStudentInfoBiz;
import com.niit.biz.ITeacherBiz;
import com.niit.entity.Student;
import com.niit.entity.StudentInfo;
import com.niit.entity.Teacher;

@Service
@Controller
public class FirstController {
	@Autowired
	private IStudentBiz StudentBiz;
	@Autowired
	private IStudentInfoBiz StudentInfoBiz;
	@Autowired
	private ITeacherBiz TeacherBiz;
	
	@RequestMapping(value="/FirstController.mvc")
	public String search(HttpSession session) {
		List<Student> studentlist = new ArrayList<Student>();
		studentlist = StudentBiz.findAll();
		List<StudentInfo> studentinfolist = new ArrayList<StudentInfo>();
		studentinfolist = StudentInfoBiz.findAll();
		System.out.println(studentlist.get(0).getSId());
		List<Teacher> teacherlist = new ArrayList<Teacher>();
		teacherlist = TeacherBiz.findAll();
		session.setAttribute("studentlist", studentlist);
		session.setAttribute("studentinfolist", studentinfolist);
		session.setAttribute("teacherlist", teacherlist);
		return "mainpage.jsp";
	}
}
