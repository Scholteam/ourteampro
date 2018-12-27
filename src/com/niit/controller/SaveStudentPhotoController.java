package com.niit.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.niit.biz.IStudentBiz;
import com.niit.biz.IStudentInfoBiz;
import com.niit.entity.StudentInfo;

@Controller
public class SaveStudentPhotoController {

	@Autowired
	private IStudentInfoBiz StudentInfoBiz;
	@RequestMapping(value="/SaveStudentPhotoController.mvc")
//	@ResponseBody
	public String saveimg(@RequestParam(value="itemImagers",required=false) MultipartFile itemImagers,HttpSession session) throws IllegalStateException, IOException{
		int pn = (int) session.getAttribute("snum");
		String pathRoot = session.getServletContext().getRealPath("");
		String  path = "/proimg/" + pn + ".jpg";
		System.out.println(pathRoot);
		itemImagers.transferTo(new File(pathRoot+path));
		StudentInfo si = new StudentInfo();
		si = (StudentInfo) session.getAttribute("writeinfo");
		StudentInfoBiz.save(si);
		session.setAttribute("stuinfo", si);
		int a = 1;
		session.setAttribute("realexistinfo", a);
		return "studentmainpage.jsp";
	}
	
}
