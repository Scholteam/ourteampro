package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.biz.IReviewBiz;
import com.niit.biz.IStudentGradeBiz;
import com.niit.entity.Review;
import com.niit.entity.StudentGrade;

@Controller
public class StudentLookGradeController {

	@Autowired
	private IStudentGradeBiz studentGradeBiz;
	@Autowired
	private IReviewBiz reviewBiz;
	@RequestMapping(value = "/StudentLookGradeController.mvc")
	public String search(HttpSession session) {
		List<StudentGrade> sg = new ArrayList<StudentGrade>();
		List<Review> re = new ArrayList<Review>();
		List<StudentGrade> thisstusg = new ArrayList<StudentGrade>();
		int snum = (int) session.getAttribute("snum");
		sg = studentGradeBiz.findAll();
		int a = 0;
		int b = 0;
		for(int i = 0;i<sg.size();i++){
			if(snum==sg.get(i).getGSnum()){
				thisstusg.add(sg.get(i));
				a++;
			}
		}
		re = reviewBiz.findAll();
		for (int i = 0; i < re.size(); i++) {
			if(re.get(i).getRsnum()==snum){
				b++;
			}
		}
		if(b!=0){
			if(a==0){
				session.setAttribute("reallyhavegrade", a);
				return "studentgrade.jsp";
			}else{
				session.setAttribute("reallyhavegrade", a);
				session.setAttribute("thisstugrade", thisstusg);
				return "studentgrade.jsp";
			}
		}else{
			return "noaddvise.jsp";
		}
	}
}
