package com.niit.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.IReviewBiz;
import com.niit.entity.Review;
import com.niit.entity.StudentInfo;

@Controller
public class ReviewController {
	@Autowired
	IReviewBiz irb;
	
	@RequestMapping(value = "/ReviewController.mvc")
	@ResponseBody
	public String search(String asa, HttpSession session) {
		Review u= new Review();
		int snum = (int) session.getAttribute("snum");
		u.setRsnum(snum);
		irb.save(u);
		return "success";
	}
	
	@RequestMapping(value = "/AddviseController.mvc")
	@ResponseBody
	public String addvise(String asa, HttpSession session) {
		List<Review> re = new ArrayList<Review>();
		int snum = (int) session.getAttribute("snum");
		re = irb.findAll();
		int a = 0;
		for (int i = 0; i < re.size(); i++) {
			if (re.get(i).getRsnum()==snum) {
				a++;
			}
			
		}
		if (a!=0) {
			return "success";
		}else{
			return "failure";
			
		}
		
		
	}
	
}
