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
import com.niit.entity.Teacher;

@Controller
public class TeacherLoginController {

	@RequestMapping(value = "/TeacherLoginController.mvc")
	@ResponseBody
	public String search(String tnum,String tpassword,String tcheck, HttpSession session) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		boolean dig = false;
		List<Teacher> tc = new ArrayList<Teacher>();
		Teacher teacher = new Teacher();
		tc = (List<Teacher>) session.getAttribute("teacherlist");
		System.out.println(tc.get(0).getTnum());
		dig = pattern.matcher(tnum).matches();
		if (dig == false) {
			return "notdig";
		} else {
			String check = (String) session.getAttribute("equals_pin");
			if(check.equals(tcheck)){
				int a = 0;
				for(int i = 0;i<tc.size();i++){
					if(tnum.equals(tc.get(i).getTnum())&&tpassword.equals(tc.get(i).getTpassword())){
						a = 1;
						teacher = tc.get(i);
					}
				}
				if(a==1){
					session.setAttribute("tnum", tnum);
					session.setAttribute("teacherinfo", teacher);
					return "success";
				}else{
					return "poterror";
				}
			}else{
				return "codeerror";
			}
		}
	}
}
