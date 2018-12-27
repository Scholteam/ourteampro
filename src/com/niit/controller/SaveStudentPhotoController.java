package com.niit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.biz.IStudentInfoBiz;
import com.niit.entity.StudentInfo;

@Controller
public class SaveStudentPhotoController {

	@Autowired
	private IStudentInfoBiz StudentInfoBiz;

	@RequestMapping(value = "/SaveStudentPhotoController.mvc")
	// @ResponseBody
	public String saveimg(@RequestParam(value = "itemImagers", required = false) MultipartFile itemImagers,
			HttpSession session) throws IllegalStateException, IOException {
		int pn = (int) session.getAttribute("snum");
		String pathRoot = session.getServletContext().getRealPath("");
		String newPath = "D:/jspring/ourteampro/webapp/proimg/" + pn + ".jpg";
		String oldPath = pathRoot + "proimg/" + pn + ".jpg";
		String path = "/proimg/" + pn + ".jpg";
		System.out.println(pathRoot);
		itemImagers.transferTo(new File(pathRoot + path));
		StudentInfo si = new StudentInfo();
		si = (StudentInfo) session.getAttribute("writeinfo");
		StudentInfoBiz.save(si);
		session.setAttribute("stuinfo", si);
		int a = 1;
		session.setAttribute("realexistinfo", a);

		FileInputStream fis = null;
		// 输出流
		FileOutputStream fos = null;
		// 用路径 “d:/a.jpg” 代替f   File f=new File( “d:/a.jpg”)
		try {
			fis = new FileInputStream(oldPath);
			fos = new FileOutputStream(newPath);
			byte bytes[] = new byte[1024];
			int n = 0;
			while ((n = fis.read(bytes)) != -1) {
				// 输出到指定文件
				fos.write(bytes);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭流
			try {
				fis.close();
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "studentmainpage.jsp";
	}

}
