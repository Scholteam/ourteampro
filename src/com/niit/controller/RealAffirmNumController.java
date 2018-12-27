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

@Controller
public class RealAffirmNumController {

	@RequestMapping(value = "/RealAffirmNumController.mvc")
	@ResponseBody
	public String search(String a, HttpSession session) {
		a = (String) session.getAttribute("check");
		System.out.println(a);
		if(a!=null){
			if(a.equals("truea")){
				return "success";
			}else{
				return "failed";
			}
		}else{
			return "no";
		}
	}
}
