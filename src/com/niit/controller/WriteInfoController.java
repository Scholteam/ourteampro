package com.niit.controller;

import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.entity.StudentInfo;

@Controller
public class WriteInfoController {

	@RequestMapping(value = "/WriteInfoController.mvc")
	@ResponseBody
	public String search(String sigender, String sination, String siacademy, String simajor, String sitel,
			String sitelcheck, String siprovince, String sitown, String siaddress, String siidcard,
			HttpSession session) {
		int code = (int) session.getAttribute("code");
		String codes = String.valueOf(code);
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		boolean real = false;
		real = pattern.matcher(siidcard).matches();
		
		if (sitelcheck.equals(codes)&&real == true) {
			StudentInfo si = new StudentInfo();
			int snum = (int) session.getAttribute("snum");
			si.setSInum(snum);
			si.setSIgender(sigender);
			si.setSInation(sination);
			si.setSIacademy(siacademy);
			si.setSImajor(simajor);
			si.setSItel(sitel);
			si.setSIprovince(siprovince);
			si.setSItown(sitown);
			si.setSIaddress(siaddress);
			si.setSIidcard(siidcard);
			session.setAttribute("writeinfo", si);
			return "success";
		} else if(real==false) {
			return "carderror";
		} else{
			return "codeerror";
		}
	}

}
