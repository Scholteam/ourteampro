package com.niit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.IStudentInfoBiz;
import com.niit.entity.StudentInfo;

@Controller
public class TeacherChangeStuInfoController {

	@Autowired
	private IStudentInfoBiz studentInfoBiz;

	@RequestMapping(value = "/TeacherChangeStuInfoController.mvc")
	public String search(HttpSession session) {
		List<StudentInfo> si = new ArrayList<StudentInfo>();
		si = studentInfoBiz.findAll();
		List<StudentInfo> realstu = new ArrayList<StudentInfo>();
		int a = 0;
		for (int i = 1; i < si.size(); i++) {
			realstu.add(si.get(i));
			a++;
		}
		if (a == 0) {
			session.setAttribute("reallyhavestutochange", a);
		} else {
			session.setAttribute("reallyhavestutochange", a);
			session.setAttribute("allofstudent", realstu);
		}

		return "teacherlookstu.jsp";
	}

	@RequestMapping(value = "/UpdateSpecialStuInfoController.mvc")
	@ResponseBody
	public String upda(String snum, HttpSession session) {
		session.setAttribute("specialsnum", snum);
		return "success";
	}

	@RequestMapping(value = "/UpdateThisSpecialStuController.mvc")
	@ResponseBody
	public String updatt(String siprovince, String sitown, String siaddress, String siidcard, HttpSession session) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		boolean real = false;
		real = pattern.matcher(siidcard).matches();
		if (real == true) {
			System.out.println("767676767676767");
			String snum = (String) session.getAttribute("specialsnum");
			int thissnum = Integer.valueOf(snum).intValue();
			System.out.println(thissnum);
			List<StudentInfo> silist = new ArrayList<StudentInfo>();
			System.out.println("1212");
			silist = studentInfoBiz.findAll();
			System.out.println("343434");
			System.out.println(silist.get(2).toString());
			StudentInfo si = new StudentInfo();
			System.out.println("565656");
			for (int i = 1; i < silist.size(); i++) {
				System.out.println("787878");
				if (thissnum==silist.get(i).getSInum()) {
					si = silist.get(i);
				}
			}
			si.setSIprovince(siprovince);
			si.setSItown(sitown);
			si.setSIaddress(siaddress);
			si.setSIidcard(siidcard);
			studentInfoBiz.update(si);
			return "success";
		}else{
			return "notrealcard";
		}
	}

}
