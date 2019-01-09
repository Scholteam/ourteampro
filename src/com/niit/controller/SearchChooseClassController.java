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
import com.niit.biz.IStudentChooseClassBiz;
import com.niit.biz.IStudentClassBiz;
import com.niit.biz.IStudentInfoBiz;
import com.niit.biz.ITeacherBiz;
import com.niit.entity.Student;
import com.niit.entity.StudentChooseClass;
import com.niit.entity.StudentClass;
import com.niit.entity.StudentGrade;
import com.niit.entity.StudentInfo;
import com.niit.entity.Teacher;

@Controller
public class SearchChooseClassController {

	@Autowired
	private IStudentChooseClassBiz studentChooseClassBiz;
	@Autowired
	private IStudentInfoBiz StudentInfoBiz;
	@Autowired
	private IStudentClassBiz StudentClassBiz;
	
	
	@RequestMapping(value = "/SearchChooseClassController.mvc")
	@ResponseBody
	public String search(String asa,HttpSession session) {
		List<StudentClass> sc = new ArrayList<StudentClass>();
		List<StudentInfo> si = new ArrayList<StudentInfo>();
		List<StudentChooseClass> scc = new ArrayList<StudentChooseClass>();
		sc = StudentClassBiz.findAll();
		si = StudentInfoBiz.findAll();
		scc = studentChooseClassBiz.findAll();
		int a = 0;
		int b = 0;
		int c = 0;
		int snum = (int) session.getAttribute("snum");
		for(int i = 0;i<sc.size();i++){
			if(sc.get(i).getCSnum()==snum){
				a++;
			}
		}
		for(int i = 0;i<si.size();i++){
			if(si.get(i).getSInum()==snum){
				b++;
			}
		}
		for(int i = 0;i<scc.size();i++){
			if(scc.get(i).getCCSnum()==snum){
				c++;
			}
		}
		if(b==0){
			return "noinfo";
		}else if(a==0){
			return "noclass";
		}else if(c==2){
			return "fullcclass";
		}else{
			return "success";
		}
		
	}
}
