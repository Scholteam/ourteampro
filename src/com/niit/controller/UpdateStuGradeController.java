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
import com.niit.biz.IStudentGradeBiz;
import com.niit.entity.Student;
import com.niit.entity.StudentClass;
import com.niit.entity.StudentGrade;

@Controller
public class UpdateStuGradeController {

	@Autowired
	private IStudentGradeBiz studentGradeBiz;
	@RequestMapping(value = "/UpdateStuGradeController.mvc")
	@ResponseBody
	public String search(String snum,String grade, HttpSession session) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		boolean dig = false;
		dig = pattern.matcher(grade).matches();
		if(dig==false){
			return "notdig";
		}else{
			String tnum = (String) session.getAttribute("tnum");
			int stunum = Integer.valueOf(snum).intValue();
			List<StudentGrade> stugrade = new ArrayList<StudentGrade>();
			stugrade = studentGradeBiz.findAll();
			StudentGrade sg = new StudentGrade();
			for(int i = 0;i<stugrade.size();i++){
				if(stugrade.get(i).getGSnum()==stunum&&stugrade.get(i).getGTnum().equals(tnum)){
					sg = stugrade.get(i);
				}
			}
			sg.setGSgrade(grade);
			studentGradeBiz.update(sg);
			return "success";
			
		}
	}
}
