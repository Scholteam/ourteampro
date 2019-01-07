package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.ITeacherBiz;
import com.niit.biz.ITeacherExchangeBiz;
import com.niit.entity.StudentExchange;
import com.niit.entity.Teacher;
import com.niit.entity.TeacherExchange;

@Controller
public class TeacherExchangeController {
	
	@Autowired
	private ITeacherBiz teacherBiz;
	
	@Autowired
	private ITeacherExchangeBiz teacherExchangeBiZ;
	
	@RequestMapping(value="/TeacherExchangeController.mvc")
	@ResponseBody
	public String TEC(HttpSession session, String txword){
		
		List<Teacher> teacher = new ArrayList<Teacher>();
		teacher = teacherBiz.findAll();
		System.out.println("2222");
		String tnum = (String) session.getAttribute("tnum");
		String txname = "";
		for (int i = 0; i < teacher.size(); i++) {
			if (teacher.get(i).getTnum().equals(tnum)) {
				txname = teacher.get(i).getTname();
				tnum = teacher.get(i).getTnum();
				System.out.println(txname);
			}

		}
		
		System.out.println("1111");
		TeacherExchange texchange = new TeacherExchange();
		texchange.setTXnum(tnum);
		texchange.setTXname(txname);
		texchange.setTXword(txword);
		teacherExchangeBiZ.save(texchange);
		
		List<TeacherExchange> teacherex = new ArrayList<TeacherExchange>();
		teacherex = teacherExchangeBiZ.findAll();
		List<TeacherExchange> teacherex1 = new ArrayList<TeacherExchange>();
		int a = 0;
		if (teacherex.size()>1) {
			for (int i = 1; i < teacherex.size(); i++) {
				teacherex1.add(teacherex.get(i));
				a++;
			}

		}
		
		session.setAttribute("ateacher", a);
		session.setAttribute("teacherex1", teacherex1);
		
		return "success";
	}
	
	@RequestMapping(value = "/TeacherEXController.mvc")
	public String search(HttpSession session, String sxword) {

		List<TeacherExchange> teacherex = new ArrayList<TeacherExchange>();
		teacherex = teacherExchangeBiZ.findAll();
		List<TeacherExchange> teacherex1 = new ArrayList<TeacherExchange>();
		int a = 0;
		if (teacherex.size()>1) {
			for (int i = 1; i < teacherex.size(); i++) {
				teacherex1.add(teacherex.get(i));
				a++;
			}

		}
		
		session.setAttribute("ateacher", a);
		session.setAttribute("teacherex1", teacherex1);
		
		return "teacherexchange.jsp";
	}
}
