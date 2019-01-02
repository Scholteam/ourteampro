package com.niit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.biz.IStudentClassBiz;
import com.niit.biz.IStudentGradeBiz;
import com.niit.biz.ITeacherBiz;
import com.niit.entity.StudentClass;
import com.niit.entity.StudentGrade;
import com.niit.entity.StudentInfo;
import com.niit.entity.Teacher;

@Controller
public class CreateStuClassController {
	@Autowired
	private IStudentClassBiz studentclassBiz;
	@Autowired
	private ITeacherBiz teacherBiz;
	@Autowired
	private IStudentGradeBiz studentGradeBiz;

	@RequestMapping(value = "/CreateStuClassController.mvc")
	@ResponseBody
	public String search(String check, HttpSession session) {
		int realinfo = 0;
		int realclass = 0;
		realinfo = (int) session.getAttribute("realexistinfo");
		realclass = (int) session.getAttribute("realexistclass");
		if(realinfo==0){
			return "noinfo";
		}else if(realclass==1){
			return "existclass";
		}else{
			//生成课表
			StudentClass sc = new StudentClass();
			StudentInfo si = new StudentInfo();
			si = (StudentInfo) session.getAttribute("stuinfo");
			List<Teacher> teacher = new ArrayList<Teacher>();
			List<Teacher> steacher = new ArrayList<Teacher>();
			teacher = teacherBiz.findAll();
			String smajor = si.getSImajor();
			Random rand = new Random();
			int randNum1 = rand.nextInt(5);
			int randNum2 = rand.nextInt(5);
			int randNum3 = rand.nextInt(5);
			int randNum4 = rand.nextInt(5);
			int randNum5 = rand.nextInt(5);
			System.out.println("+12111111111111111111"+teacher.get(0).getTclass());
			for(int j=0;j<teacher.size();j++){
				if(teacher.get(j).getTmajor().equals(smajor)){
					steacher.add(teacher.get(j));
				}
			}
			//0:上午12节           1:上午34节           2:下午56节               3：下午78节            4:晚上910节
			String CMonday;
			String CTuesday;
			String CWednesday;
			String CThursday;
			String CFriday;
			Teacher TeacherMon = new Teacher();
			Teacher TeacherTue = new Teacher();
			Teacher TeacherWed = new Teacher();
			Teacher TeacherThu = new Teacher();
			Teacher TeacherFri = new Teacher();
			//周一
			if(randNum1==0){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherMon = steacher.get(randNum6);
				CMonday = "1,2:"+tnum;
			}else if(randNum1==1){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherMon = steacher.get(randNum6);
				CMonday = "3,4:"+tnum;
			}else if(randNum1==2){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherMon = steacher.get(randNum6);
				CMonday = "5,6:"+tnum;
			}else if(randNum1==3){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherMon = steacher.get(randNum6);
				CMonday = "7,8:"+tnum;
			}else{
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherMon = steacher.get(randNum6);
				CMonday = "9,0:"+tnum;
			}
			//周二
			if(randNum2==0){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherTue = steacher.get(randNum6);
				CTuesday = "1,2:"+tnum;
			}else if(randNum2==1){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherTue = steacher.get(randNum6);
				CTuesday = "3,4:"+tnum;
			}else if(randNum2==2){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherTue = steacher.get(randNum6);
				CTuesday = "5,6:"+tnum;
			}else if(randNum2==3){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherTue = steacher.get(randNum6);
				CTuesday = "7,8:"+tnum;
			}else{
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherTue = steacher.get(randNum6);
				CTuesday = "9,0:"+tnum;
			}
			//周三
			if(randNum3==0){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherWed = steacher.get(randNum6);
				CWednesday = "1,2:"+tnum;
			}else if(randNum3==1){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherWed = steacher.get(randNum6);
				CWednesday = "3,4:"+tnum;
			}else if(randNum3==2){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherWed = steacher.get(randNum6);
				CWednesday = "5,6:"+tnum;
			}else if(randNum3==3){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherWed = steacher.get(randNum6);
				CWednesday = "7,8:"+tnum;
			}else{
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherWed = steacher.get(randNum6);
				CWednesday = "9,0:"+tnum;
			}
			//周四
			if(randNum4==0){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherThu = steacher.get(randNum6);
				CThursday = "1,2:"+tnum;
			}else if(randNum4==1){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherThu = steacher.get(randNum6);
				CThursday = "3,4:"+tnum;
			}else if(randNum4==2){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherThu = steacher.get(randNum6);
				CThursday = "5,6:"+tnum;
			}else if(randNum4==3){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherThu = steacher.get(randNum6);
				CThursday = "7,8:"+tnum;
			}else{
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherThu = steacher.get(randNum6);
				CThursday = "9,0:"+tnum;
			}
			//周五
			if(randNum5==0){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherFri = steacher.get(randNum6);
				CFriday = "1,2:"+tnum;
			}else if(randNum5==1){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherFri = steacher.get(randNum6);
				CFriday = "3,4:"+tnum;
			}else if(randNum5==2){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherFri = steacher.get(randNum6);
				CFriday = "5,6:"+tnum;
			}else if(randNum5==3){
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherFri = steacher.get(randNum6);
				CFriday = "7,8:"+tnum;
			}else{
				int randNum6 = rand.nextInt(steacher.size());
				String tnum = steacher.get(randNum6).getTnum();
				TeacherFri = steacher.get(randNum6);
				CFriday = "9,0:"+tnum;
			}
			int snum = (int) session.getAttribute("snum");
			sc.setCSnum(snum);
			sc.setCMonday(CMonday);
			sc.setCTuesday(CTuesday);
			sc.setCWednesday(CWednesday);
			sc.setCThursday(CThursday);
			sc.setCFriday(CFriday);
			studentclassBiz.save(sc);
			session.setAttribute("realexistclass", 1);
			session.setAttribute("stuclass", sc);
			//创建学生成绩
			List<Teacher> teacherli = new ArrayList<Teacher>();
			teacherli.add(TeacherMon);
			int tue = 0;
			int wed = 0;
			int thu = 0;
			int fri = 0;
			System.out.println(teacherli.get(0).getTclass());
			System.out.println(TeacherTue.getTclass());
			for(int i = 0;i<teacherli.size();i++){
				if(teacherli.get(i).getTnum().equals(TeacherTue.getTnum())){
					tue=1;
				}
			}
			if(tue==0){
				teacherli.add(TeacherTue);
			}
			for(int i = 0;i<teacherli.size();i++){
				if(teacherli.get(i).getTnum().equals(TeacherWed.getTnum())){
					wed=1;
				}
			}
			if(wed==0){
				teacherli.add(TeacherWed);
			}
			for(int i = 0;i<teacherli.size();i++){
				if(teacherli.get(i).getTnum().equals(TeacherThu.getTnum())){
					thu=1;
				}
			}
			if(thu==0){
				teacherli.add(TeacherThu);
			}
			for(int i = 0;i<teacherli.size();i++){
				if(teacherli.get(i).getTnum().equals(TeacherFri.getTnum())){
					fri=1;
				}
			}
			if(fri==0){
				teacherli.add(TeacherFri);
			}
			List<StudentGrade> stug = new ArrayList<StudentGrade>();
			for(int i = 0;i<teacherli.size();i++){
				StudentGrade sg = new StudentGrade();
				sg.setGSnum(snum);
				sg.setGTclass(teacherli.get(i).getTclass());
				sg.setGTname(teacherli.get(i).getTname());
				sg.setGTnum(teacherli.get(i).getTnum());
				sg.setGSgrade("a");
				stug.add(sg);
			}
			for(int i = 0;i<stug.size();i++){
				studentGradeBiz.save(stug.get(i));
			}
			return "success";
			
		}
	}
}
