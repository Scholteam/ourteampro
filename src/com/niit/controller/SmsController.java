package com.niit.controller;

import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.http.HTTPException;
import java.io.IOException;
import java.util.regex.Pattern;

@Controller
public class SmsController {

	@RequestMapping(value = "SendSms.mvc", method = RequestMethod.POST)
	@ResponseBody
	protected String SmsServlet(String sitel, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws ServletException, IOException, com.github.qcloudsms.httpclient.HTTPException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		boolean real = false;
		real = pattern.matcher(sitel).matches();
		if (real == true) {
			int appid = 1400086573;
			String appkey = "8251f605677bef6805bca1df9c4a4d63";
			String smsSign = "本校教务";
			int code = (int) (Math.random() * 9000 + 1000);

			System.err.println(code);

			session.setAttribute("code", code);
			System.out.println("code = " + code);

			int snum = (int) session.getAttribute("snum");
			String msg = snum + ",您的验证码为" + code + "，请于30分钟内填写。如非本人操作，请忽略本短信。";

			try {
				// 指定模板单发短信；
				SmsSingleSender ssender = new SmsSingleSender(appid, appkey);
				SmsSingleSenderResult result = ssender.send(0, "86", sitel, msg, "", "");
				System.out.print(result);
				return "success";
			} catch (HTTPException e) {
				System.out.println("HTTP响应码错误");
			} catch (JSONException e) {
				System.out.println("json解析错误");
			} catch (IOException e) {
				System.out.println("网络IO错误");
			}
			return "false";

			// //测试完后删掉
			// return "success";
		} else {
			return "failure";
		}
	}
}
