package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.biz.IStudentGradeBiz;
import com.niit.entity.Student;
import com.niit.entity.StudentGrade;

@Controller
public class TeacherSeeStuGradeController {

	@Autowired
	private IStudentGradeBiz studentGradeBiz;
	
	
	@RequestMapping(value = "/TeacherSeeStuGradeController.mvc")
	public String search( HttpSession session) {
		List<StudentGrade> stg = new ArrayList<StudentGrade>();
		List<StudentGrade> stugad = new ArrayList<StudentGrade>();
		stg = studentGradeBiz.findAll();
		String tnum = (String) session.getAttribute("tnum");
		int a = 0;
		for(int i = 0;i<stg.size();i++){
			if(stg.get(i).getGTnum().equals(tnum)){
				stugad.add(stg.get(i));
				a++;
			}
		}
		session.setAttribute("thisteastu", stugad);
		session.setAttribute("realthisteastu", a);
		return "teacherseestugrade.jsp";
	}
}
