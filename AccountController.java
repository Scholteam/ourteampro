package com.niit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.entity.User;
import com.niit.model.Response;
import com.niit.model.enums.State;
import com.niit.model.viewModel.LoginModel;
import com.niit.model.viewModel.Register;
import com.niit.service.IUserBiz;


@Controller
public class AccountController {
	
	@Resource(name="userBiz")
	private IUserBiz userBiz;
	
	/**
	 * 登陆
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login.mvc")
	@ResponseBody
	public Response<String> login(LoginModel model, HttpSession session) {
		
		Response<String> result = new Response<String>();
		result.setState(State.Error);
		
		// 判断登录信息是否正确
		User user = userBiz.login(model.getUsername(), model.getPassword());
		if(user == null) {
			result.setMessage("登陆失败！用户名或密码不正确！");
		}
		else {
			session.setAttribute("username", user.getName());
			session.setAttribute("loginname", user.getUsername());
			session.setAttribute("userid", user.getId());
			result.setState(State.OK);
			System.out.println("用户登陆成功了！" + session.getAttributeNames());
		}
		return result;  
	}
	
	/**
	 * 注销
	 */
	@RequestMapping(value="/logout.mvc")
	@ResponseBody
	public void logout(HttpSession session){
		session.removeAttribute("username");
		session.removeAttribute("loginname");
		session.removeAttribute("userid");
		System.out.println("用户注销了！" + session.getAttributeNames());
	}

	/**
	 * 注册
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/register.mvc")
	@ResponseBody
	public Response<String> register(Register model) {
		
		Response<String> result = new Response<String>();
		result.setState(State.Error);
		
		// 判断用户名是否存在
		if(userBiz.isExists(model.getUsername())) {
			result.setMessage("用户名已存在！");
		}
		else {
			// 保存用户信息
			User user = new User();
			user.setObject(model.getObject());
			user.setName(model.getName());
			user.setUsername(model.getUsername());
			user.setPassword(model.getPassword());
			userBiz.save(user);
			result.setState(State.OK);
		}
		return result;  
	}
}

