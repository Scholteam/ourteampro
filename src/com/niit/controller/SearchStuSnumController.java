package com.niit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.IStudentBiz;
import com.niit.biz.IStudentClassBiz;
import com.niit.biz.IStudentInfoBiz;
import com.niit.biz.ITeacherBiz;
import com.niit.entity.Student;
import com.niit.entity.StudentClass;
import com.niit.entity.StudentInfo;
import com.niit.entity.Teacher;
@Service
@Controller
public class SearchStuSnumController {
	@Autowired
	private IStudentBiz studentBiz;

	@RequestMapping(value = "/SearchStuSnumController.mvc")
	@ResponseBody
	public String search(String snum, HttpSession session) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		boolean dig = false;
		dig = pattern.matcher(snum).matches();
		if(dig == false){
			return "notdig";
		}else{
			Student student = new Student();
			List<Student> stu = new ArrayList<Student>();
			stu = studentBiz.findAll();
			int a = 0;
			int realsnum = Integer.valueOf(snum).intValue();
			for(int i = 0;i<stu.size();i++){
				if(realsnum==stu.get(i).getSnum()){
					a++;
					student = stu.get(i);
				}
			}
			if(a==0){
				return "notreal";
			}else{
				session.setAttribute("needtochange", student);
				return "success";
			}
		}
	}
}
