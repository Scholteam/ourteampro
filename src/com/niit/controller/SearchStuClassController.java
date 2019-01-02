package com.niit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.IStudentClassBiz;
import com.niit.biz.IStudentInfoBiz;
import com.niit.biz.ITeacherBiz;
import com.niit.entity.StudentClass;
import com.niit.entity.StudentInfo;
import com.niit.entity.Teacher;
@Service
@Controller
public class SearchStuClassController {
	@Autowired
	private ITeacherBiz teacherBiz;

	@RequestMapping(value = "/SearchStuClassController.mvc")
	@ResponseBody
	public String search(String search, HttpSession session) {
		int real = (int) session.getAttribute("realexistclass");
		if(real==0){
			return "noclass";
		}else{
			StudentClass sc = new StudentClass();
			sc = (StudentClass) session.getAttribute("stuclass");
			String stuMon = sc.getCMonday();
			String timeMon = stuMon.substring(0,4);
			System.out.println(timeMon);
			System.out.println("!!!@@@@"+timeMon.equals("7,8:"));
			String numMon = stuMon.substring(4);
			System.out.println(numMon);
			String stuTue = sc.getCTuesday();
			String timeTue = stuTue.substring(0,4);
			String numTue = stuTue.substring(4);
			String stuWed = sc.getCWednesday();
			String timeWed = stuWed.substring(0,4);
			String numWed = stuWed.substring(4);
			String stuThu = sc.getCThursday();
			String timeThu = stuThu.substring(0,4);
			String numThu = stuThu.substring(4);
			String stuFri = sc.getCFriday();
			String timeFri = stuFri.substring(0,4);
			String numFri = stuFri.substring(4);
			List<Teacher> teacher = new ArrayList<Teacher>();
			teacher = teacherBiz.findAll();
			System.out.println("101010101010101010101");
			for(int i=0;i<teacher.size();i++){
				if(teacher.get(i).getTnum().equals(numMon)){
					session.setAttribute("MondayClass", teacher.get(i));
					System.out.println(teacher.get(i).getTname());
					System.out.println("+");
				}
			}
			for(int i=0;i<teacher.size();i++){
				if(teacher.get(i).getTnum().equals(numTue)){
					session.setAttribute("TuesdayClass", teacher.get(i));
					System.out.println(teacher.get(i).getTname());
					System.out.println("+");
				}
			}
			for(int i=0;i<teacher.size();i++){
				if(teacher.get(i).getTnum().equals(numWed)){
					session.setAttribute("WednesdayClass", teacher.get(i));
					System.out.println(teacher.get(i).getTname());
					System.out.println("+");
				}
			}
			for(int i=0;i<teacher.size();i++){
				if(teacher.get(i).getTnum().equals(numThu)){
					session.setAttribute("ThursdayClass", teacher.get(i));
					System.out.println(teacher.get(i).getTname());
					System.out.println("+");
				}
			}
			for(int i=0;i<teacher.size();i++){
				if(teacher.get(i).getTnum().equals(numFri)){
					session.setAttribute("FridayClass", teacher.get(i));
					System.out.println(teacher.get(i).getTname());
					System.out.println("+");
				}
			}
			
			if(timeMon.equals("1,2:")){
				session.setAttribute("Mon12", timeMon);
			}
			if(timeMon.equals("3,4:")){
				session.setAttribute("Mon34", timeMon);
			}
			if(timeMon.equals("5,6:")){
				session.setAttribute("Mon56", timeMon);
			}
			if(timeMon.equals("7,8:")){
				session.setAttribute("Mon78", timeMon);
				System.out.println("qqqqqqqqqqq");
			}
			if(timeMon.equals("9,0:")){
				session.setAttribute("Mon910", timeMon);
			}
			
			if(timeTue.equals("1,2:")){
				session.setAttribute("Tue12", timeTue);
			}
			if(timeTue.equals("3,4:")){
				session.setAttribute("Tue34", timeTue);
			}
			if(timeTue.equals("5,6:")){
				session.setAttribute("Tue56", timeTue);
			}
			if(timeTue.equals("7,8:")){
				session.setAttribute("Tue78", timeTue);
			}
			if(timeTue.equals("9,0:")){
				session.setAttribute("Tue910", timeTue);
			}
			
			if(timeWed.equals("1,2:")){
				session.setAttribute("Wed12", timeWed);
			}
			if(timeWed.equals("3,4:")){
				session.setAttribute("Wed34", timeWed);
			}
			if(timeWed.equals("5,6:")){
				session.setAttribute("Wed56", timeWed);
			}
			if(timeWed.equals("7,8:")){
				session.setAttribute("Wed78", timeWed);
			}
			if(timeWed.equals("9,0:")){
				session.setAttribute("Wed910", timeWed);
			}
			
			if(timeThu.equals("1,2:")){
				session.setAttribute("Thu12", timeThu);
			}
			if(timeThu.equals("3,4:")){
				session.setAttribute("Thu34", timeThu);
			}
			if(timeThu.equals("5,6:")){
				session.setAttribute("Thu56", timeThu);
			}
			if(timeThu.equals("7,8:")){
				session.setAttribute("Thu78", timeThu);
			}
			if(timeThu.equals("9,0:")){
				session.setAttribute("Thu910", timeThu);
			}
			
			if(timeFri.equals("1,2:")){
				session.setAttribute("Fri12", timeFri);
			}
			if(timeFri.equals("3,4:")){
				session.setAttribute("Fri34", timeFri);
			}
			if(timeFri.equals("5,6:")){
				session.setAttribute("Fri56", timeFri);
			}
			if(timeFri.equals("7,8:")){
				session.setAttribute("Fri78", timeFri);
			}
			if(timeFri.equals("9,0:")){
				session.setAttribute("Fri910", timeFri);
			}
			System.out.println("龙111111111111111111232323");
			return "success";
		}
	}
}
