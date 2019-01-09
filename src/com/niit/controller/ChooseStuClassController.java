package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.IStudentChooseClassBiz;
import com.niit.biz.IStudentGradeBiz;
import com.niit.entity.StudentChooseClass;
import com.niit.entity.StudentGrade;

@Controller
public class ChooseStuClassController {

	@Autowired
	private IStudentChooseClassBiz studentchooseclassBiz;

	@Autowired
	private IStudentGradeBiz studentgradeBiz;
	
	@RequestMapping(value = "/ChooseStuClassController.mvc")
	@ResponseBody
	public String search(String choosecl, String chooseday, String choosetime, HttpSession session) {
		List<StudentChooseClass> scclist = new ArrayList<StudentChooseClass>();// 表,存若干个StudentChooseClass类型的数据
		StudentChooseClass scc = new StudentChooseClass();
		StudentChooseClass prescc = new StudentChooseClass();
		scclist = studentchooseclassBiz.findAll();
		int snum = (int) session.getAttribute("snum");
		int a = 0;
		for (int i = 0; i < scclist.size(); i++) {
			if (scclist.get(i).getCCSnum() == snum) {
				a++;
				prescc = scclist.get(i);
			}
		}
		if (a == 1) {
			if (prescc.getCChooseday().equals(chooseday) && prescc.getCChoosetime().equals(choosetime)) {
				return "errortime";
			}
		} 
		if (a != 2) {
			System.out.println("qqqqqqqqqqqqqqqqqqqqq");
			// 分开课程和老师
			String findclass = "a";
			String findteacher = "a";
			for (int i = 0; i < choosecl.length(); i++) {
				if (choosecl.substring(i, i + 1).equals(",")) {
					findclass = choosecl.substring(0, i );
					findteacher = choosecl.substring(i + 1);
				}
			}
			int b = 0;
			for (int i = 0; i < scclist.size(); i++) {
				if (scclist.get(i).getCCSnum() == snum && scclist.get(i).getCChooseclass().equals(findclass)) {
					b++;
					System.out.println("oooooooooo"+scclist.get(i).getCChooseclass());
					System.out.println("a123"+findclass);
				}
			}
			// b = 0/1判断
			if (b == 0) {
				System.out.println("1111111111111111111111111");
				scc.setCChooseclass(findclass);
				scc.setCChooseteacher(findteacher);
				scc.setCChooseday(chooseday);
				scc.setCChoosetime(choosetime);
				scc.setCCSnum(snum);
				studentchooseclassBiz.save(scc);
				StudentGrade sg = new StudentGrade();
				sg.setGSgrade("a");
				sg.setGSnum(snum);
				sg.setGTclass(findclass);
				sg.setGTname(findteacher);
				sg.setGTnum("qwe");
				studentgradeBiz.save(sg);
				return "success";
			} else {
				return "haveclass";
			}
		} else {
			System.out.println("eeeeeeeeeeeeeee");
			return "fullclass";
		}
	}
}
