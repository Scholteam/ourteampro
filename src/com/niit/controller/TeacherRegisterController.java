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
import com.niit.biz.ITeacherBiz;
import com.niit.entity.Student;
import com.niit.entity.Teacher;

@Controller
public class TeacherRegisterController {

	@Autowired
	private ITeacherBiz TeacherBiz;
	@RequestMapping(value = "/TeacherRegisterController.mvc")
	@ResponseBody
	public String search(String tnum,String tpassword,String retpassword,String tname,String tmajor,String tclass, HttpSession session) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		boolean real = false;
		boolean dig = false;
		List<Teacher> te = new ArrayList<Teacher>();
		Teacher teacher = new Teacher();
		te = (List<Teacher>) session.getAttribute("teacherlist");
		dig = pattern.matcher(tnum).matches();
		if (dig == false) {
			return "notdig";
		} else {
			int a = 0;
			for(int i = 0;i<te.size();i++){
				if(te.get(i).getTnum().equals(tnum)){
					a=1;
				}
			}
			if(a==1){
				return "exist";
			}else if(retpassword.equals(tpassword)){
				teacher.setTnum(tnum);
				teacher.setTname(tname);
				teacher.setTmajor(tmajor);
				teacher.setTclass(tclass);
				teacher.setTpassword(retpassword);
				TeacherBiz.save(teacher);
				return "success";
			}else{
				return "pwderror";
			}
		}
	}
}
