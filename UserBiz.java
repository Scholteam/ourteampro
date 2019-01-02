package com.niit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.service.IUserBiz;
import com.niit.dao.IUserDao;
import com.niit.entity.User;

@Service
public class UserBiz implements IUserBiz {
	//注入dao对象
	@Autowired
	private IUserDao userDao;


	@Override
	public void save(User u) {
		userDao.save(u);
	}

	@Override
	public void update(User u) {
		userDao.update(u);
	}

	@Override
	public void delete(Integer id) {
		userDao.delete(id);
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public User findById(Integer id) {
		return userDao.findById(id);
	}

	/**
	 * 判断用户名是否存在
	 * @param username 用户名
	 * @return
	 */
	public boolean isExists(String username){
		return userDao.isExists(username);
	}

	/**
	 * 登陆
	 * @param username 用户名
	 * @param password 密码
	 * @return
	 */
	public User login(String username, String password){
		return userDao.login(username, password);
	}
}

