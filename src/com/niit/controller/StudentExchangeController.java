package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.IStudentBiz;
import com.niit.biz.IStudentExchangeBiz;
import com.niit.entity.Student;
import com.niit.entity.StudentExchange;

@Controller
public class StudentExchangeController {

	@Autowired
	private IStudentBiz studentBiz;
	@Autowired
	private IStudentExchangeBiz studentExchangeBiz;

	@RequestMapping(value = "/StudentExchangeController.mvc")
	@ResponseBody
	public String SEC(HttpSession session, String sxword) {

		List<Student> student = new ArrayList<Student>();
		student = studentBiz.findAll();
		System.out.println("2222");
		int snum = (int) session.getAttribute("snum");
		String sxname = "";
		for (int i = 0; i < student.size(); i++) {
			if (snum==student.get(i).getSnum()) {
				sxname = student.get(i).getSname();
				System.out.println(sxname);
			}

		}
		System.out.println("1111");
		StudentExchange sexchange = new StudentExchange();
		sexchange.setSXnum(snum);
		sexchange.setSXname(sxname);
		sexchange.setSXword(sxword);
		studentExchangeBiz.save(sexchange);
		List<StudentExchange> studentex = new ArrayList<StudentExchange>();
		studentex = studentExchangeBiz.findAll();
		List<StudentExchange> studentex1 = new ArrayList<StudentExchange>();
		int a = 0;
		if (studentex.size()>1) {
			for (int i = 1; i < studentex.size(); i++) {
				studentex1.add(studentex.get(i));
				a++;
			}

		}
		
		session.setAttribute("astudent", a);
		session.setAttribute("studentex1", studentex1);
		return "success";
	}

	@RequestMapping(value = "/StudentEXController.mvc")
	public String search(HttpSession session, String sxword) {

		List<StudentExchange> studentex = new ArrayList<StudentExchange>();
		studentex = studentExchangeBiz.findAll();
		List<StudentExchange> studentex1 = new ArrayList<StudentExchange>();
		int a = 0;
		if (studentex.size()>1) {
			for (int i = 1; i < studentex.size(); i++) {
				studentex1.add(studentex.get(i));
				a++;
			}

		}
		
		session.setAttribute("astudent", a);
		session.setAttribute("studentex1", studentex1);
		
		return "studentexchange.jsp";
	}
}
