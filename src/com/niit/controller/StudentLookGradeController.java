package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.biz.IStudentGradeBiz;
import com.niit.entity.StudentGrade;

@Controller
public class StudentLookGradeController {

	@Autowired
	private IStudentGradeBiz studentGradeBiz;
	@RequestMapping(value = "/StudentLookGradeController.mvc")
	public String search(HttpSession session) {
		List<StudentGrade> sg = new ArrayList<StudentGrade>();
		List<StudentGrade> thisstusg = new ArrayList<StudentGrade>();
		int snum = (int) session.getAttribute("snum");
		sg = studentGradeBiz.findAll();
		int a = 0;
		for(int i = 0;i<sg.size();i++){
			if(snum==sg.get(i).getGSnum()){
				thisstusg.add(sg.get(i));
				a++;
			}
		}
		if(a==0){
			session.setAttribute("reallyhavegrade", a);
			return "studentgrade.jsp";
		}else{
			session.setAttribute("reallyhavegrade", a);
			session.setAttribute("thisstugrade", thisstusg);
			return "studentgrade.jsp";
		}
	}
}
