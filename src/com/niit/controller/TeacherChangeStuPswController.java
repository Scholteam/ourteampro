package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.biz.IStudentBiz;
import com.niit.entity.Student;

@Controller
public class TeacherChangeStuPswController {

	@Autowired
	private IStudentBiz studentBiz;
	
	
	@RequestMapping(value = "/TeacherChangeStuPswController.mvc")
	public String search( HttpSession session) {
		List<Student> stu = new ArrayList<Student>();
		stu = studentBiz.findAll();
		List<Student> realstu = new ArrayList<Student>();
		int a = 0;
		for(int i = 1;i<stu.size();i++){
			realstu.add(stu.get(i));
			a++;
		}
		if(a==0){
			session.setAttribute("reallyexiststu", a);
		}else{
			session.setAttribute("reallyexiststu", a);
			session.setAttribute("allstudent", realstu);
		}
		
		return "teachangestupsw.jsp";
	}
}
