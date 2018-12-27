package com.niit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.IStudentBiz;
import com.niit.entity.Student;

@Controller
public class AffirmNumController {

	@RequestMapping(value = "/AffirmNumController.mvc")
	@ResponseBody
	public String search(String snum, HttpSession session) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		System.out.println("11111" + ":" + snum);
		boolean real = false;
		boolean dig = false;
		List<Student> sl = new ArrayList<Student>();
		Student student = new Student();
		sl = (List<Student>) session.getAttribute("studentlist");
		System.out.println(sl.get(0).getSnum());
		dig = pattern.matcher(snum).matches();
		if (dig == false) {
			session.setAttribute("check", "trueb");
			return "notdig";
		} else {
			int num = Integer.valueOf(snum).intValue();
			for (int i = 0; i < sl.size(); i++) {
				if (sl.get(i).getSnum() == num) {
					real = true;
				}
			}
			if (snum.length() <= 5 || snum.length() > 10) {
				session.setAttribute("check", "trueb");
				return "notreal";
			} else {
				if (real == true) {
					session.setAttribute("check", "trueb");
					return "success";
				} else {
					session.setAttribute("check", "truea");
					return "failed";
				}
			}
		}
	}
}
