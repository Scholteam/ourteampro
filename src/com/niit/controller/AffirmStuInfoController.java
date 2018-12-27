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
import com.niit.biz.IStudentInfoBiz;
import com.niit.entity.Student;
import com.niit.entity.StudentInfo;
@Service
@Controller
public class AffirmStuInfoController {

	@Autowired
	private IStudentInfoBiz studentinfoBiz;
	
	@RequestMapping(value = "/AffirmStuInfoController.mvc")
	public String search(HttpSession session) {
		StudentInfo si = new StudentInfo();
		List<StudentInfo> sio = new ArrayList<StudentInfo>();
		sio = (List<StudentInfo>) session.getAttribute("studentinfolist");
		int a = 0;
		int b = (int) session.getAttribute("snum");
		for(int i = 0;i<sio.size();i++){
			if(sio.get(i).getSInum()==b){
				a=1;
				session.setAttribute("stuinfo", sio.get(i));
			}
		}
		System.out.println(sio.get(0).getSIgender()+"7192478917491");
		session.setAttribute("realexistinfo", a);
		return "studentmainpage.jsp";
		
	}
}
