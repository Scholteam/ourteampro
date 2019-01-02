package com.niit.dao;


import java.util.List;
import com.niit.entity.User;

public interface IUserDao {
	
	public void save(User u);
	public void update(User u);
	public void delete(Integer id);
	public List<User> findAll();
	public User findById(Integer id);
	/**
	 * 判断用户名是否存在
	 * @param username 用户名
	 * @return
	 */
	public boolean isExists(String username);
	/**
	 * 登陆
	 * @param username 用户名
	 * @param password 密码
	 * @return
	 */
	public User login(String username, String password);
}

