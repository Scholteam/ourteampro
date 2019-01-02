package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.IStudentBiz;
import com.niit.entity.Student;

@Controller
public class UpdateSpecialStuPswController {

	@Autowired
	private IStudentBiz studentBiz;
	@RequestMapping(value = "/UpdateSpecialStuPswController.mvc")
	@ResponseBody
	public String search(String snum,String psw, HttpSession session) {
		List<Student> stulist = new ArrayList<Student>();
		stulist = studentBiz.findAll();
		Student stu = new Student();
		int realsnum = Integer.valueOf(snum).intValue();
		for(int i = 0;i<stulist.size();i++){
			if(realsnum==stulist.get(i).getSnum()){
				stu = stulist.get(i);
			}
		}
		stu.setSpassword(psw);
		studentBiz.update(stu);
		return "success";
	}
}
