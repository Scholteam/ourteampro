package com.niit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.biz.IStudentBiz;
import com.niit.entity.Student;

@Service
@Controller
public class RegisterController {
	@Autowired
	private IStudentBiz StudentBiz;
	
	@RequestMapping(value="/RegisterController1.mvc")
	public void register(String sname,String spassword,String repassword,String snum,HttpServletResponse response,HttpSession session) throws IOException {
		Student student = new Student(); 
		List<Student> stu = new ArrayList<Student>();
		stu = StudentBiz.findAll();
		int a = 0;
		for(int i = 0;i<stu.size();i++){
			if(stu.get(i).getSnum()==Integer.valueOf(snum).intValue()) {
				a = 1;
			}
			System.out.println("——+——+——+——"+a);
		}
		System.out.println("()()()"+a);
		if(sname.length()<10&&sname.length()>4&&spassword.equals(repassword)&&sname!=null&&spassword!=null&&repassword!=null&&a==0){
					student.setSname(sname);
					student.setSpassword(spassword);
					student.setSnum(Integer.valueOf(snum).intValue());
					StudentBiz.save(student);
					response.sendRedirect("studentlogin.jsp");
		}else{
			System.out.println("22222222222");
			response.sendRedirect("error.jsp");
		}
	}
}
