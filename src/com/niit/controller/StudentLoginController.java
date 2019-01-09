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
import com.niit.biz.IStudentClassBiz;
import com.niit.biz.impl.StudentBiz;
import com.niit.entity.Student;
import com.niit.entity.Teacher;

@Service
@Controller
public class StudentLoginController {
	@Autowired
	private IStudentBiz studentBiz;

	@RequestMapping(value = "/StudentLoginController.mvc")
	@ResponseBody
	public String login(String snum, String spassword, String scheck, HttpSession session) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		boolean dig = false;
		List<Student> student = new ArrayList<Student>();
		student = studentBiz.findAll();
		int num = snum.length();
		if (snum.equals("")||num<2||num>10) {
			return "snumerror";
		} else {
			dig = pattern.matcher(snum).matches();
			if (spassword.equals("")) {
				return "spassworderror";
			} else if (scheck.equals("")) {
				return "scheckerror";
			} else if (dig == false) {
				return "nodig";
			} else {
				System.out.println(snum + "+" + spassword + "+" + scheck);
				int a = 1;// 学号
				int b = 1;// 密码
				int c = 1;// 验证码
				String sname = "";
				System.out.println(student.get(0).getSname());
				for (int i = 0; i < student.size(); i++) {
					if (student.get(i).getSnum() == Integer.valueOf(snum).intValue()
							&& student.get(i).getSpassword().equals(spassword)) {
						a = 0;
						b = 0;
						sname = student.get(i).getSname();
					}

				}
				String truestr = (String) session.getAttribute("equals_pin");
				if (truestr.equals(scheck)) {
					c = 0;
				}
				System.out.println(a + "+" + b + "+" + c);
				if (a == 1 || b == 1) {
					return "snumorspassworderror";
				} else if (c == 1) {
					return "scheckerror";
				} else {
					session.setAttribute("snum", Integer.valueOf(snum).intValue());
					session.setAttribute("sname", sname);
					return "success";
				}

			}
		}
	}
}
