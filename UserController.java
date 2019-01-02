package com.niit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.entity.User;
import com.niit.model.Response;
import com.niit.model.enums.State;
import com.niit.model.viewModel.UserModel;
import com.niit.model.viewModel.UserPassword;
import com.niit.service.IUserBiz;


@Controller
public class UserController {
	
	@Resource(name="userBiz")
	private IUserBiz userBiz;

	@RequestMapping(value="/getUserInfo.mvc")
	@ResponseBody
	public Response<User> getUserInfo(HttpSession session)  {

		Response<User> result = new Response<User>();
		result.setState(State.NULL);

		// 判断登录信息
		if(session.getAttribute("userid") == null){
			result.setMessage("请先登录！");
		}
		else {
			int id = (int)session.getAttribute("userid");
			User user = userBiz.findById(id);
			if(user == null) {
				result.setMessage("请先登录！");
			}
			else {
				user.setPassword("别想偷看密码哦~");
				result.setData(user);
				result.setState(State.OK);
			}
		}
		
		return result;
		  
	}
	
	@RequestMapping(value="/saveUserInfo.mvc")
	@ResponseBody
	public Response<String> saveUserInfo(UserModel model, HttpSession session)  {

		Response<String> result = new Response<String>();
		result.setState(State.NULL);

		// 判断登录信息
		if(session.getAttribute("userid") == null){
			result.setMessage("请先登录！");
		}
		else {
			int id = (int)session.getAttribute("userid");
			User user = userBiz.findById(id);
			user.setName(model.getName());
			user.setObject(model.getObject());
			userBiz.update(user);
			result.setState(State.OK);
		}
		
		return result;
		  
	}

	@RequestMapping(value="/updatePwd.mvc")
	@ResponseBody
	public Response<String> updatePwd(UserPassword model, HttpSession session)  {

		Response<String> result = new Response<String>();
		result.setState(State.Error);

		if(session.getAttribute("userid") == null){
			result.setState(State.NULL);
			result.setMessage("请先登录！");
		}
		else {
			int id = (int)session.getAttribute("userid");
			User user = userBiz.findById(id);
			if(user == null){
				result.setState(State.NULL);
				result.setMessage("请先登录！");
			}
			else if(!user.getPassword().equals(model.getOldPassword())){
				result.setMessage("原密码输入不正确！请重新输入！");
			}
			else if(!model.getPassword().equals(model.getRepassword())){
				result.setMessage("两次密码输入不一致！请重新输入！");
			}
			else {
				user.setPassword(model.getPassword());
				userBiz.update(user);
				result.setState(State.OK);
			}
		}
		
		return result;
		  
	}
}

