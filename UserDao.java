package com.niit.dao.impl;


import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.IUserDao;
import com.niit.entity.User;
import com.niit.model.HibernateUtils;

/**
 * 持久层
 * @author Kris
 *
 */

@Repository
public class UserDao implements IUserDao {
	//注入HibernateTemplate
	@Autowired
	private HibernateTemplate ht;
	

	@Override
	public void save(User u) {
		ht.save(u);
	}

	@Override
	public void update(User u) {
		ht.update(u);
	}

	@Override
	public void delete(Integer id) {
		ht.delete(findById(id));
	}

	@Override
	public List<User> findAll() {
		return ht.loadAll(User.class);
	}

	@Override
	public User findById(Integer id) {
		return ht.get(User.class, id);
	}

	/**
	 * 判断用户名是否存在
	 * @param username 用户名
	 * @return
	 */
	@Override
	public boolean isExists(String username){
		Session session = HibernateUtils.openSession();
		SQLQuery query = session.createSQLQuery("select name from t_user where username = :username");
		query.setParameter("username", username);
		try{
			String name = (String)query.uniqueResult();
			return name != null;
		}
		catch (Exception e) {
			return false;
		}
	}

	/**
	 * 判断用户是否存在
	 * @param username 用户名
	 * @param password 密码
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public User login(String username, String password){
		Session session = HibernateUtils.openSession();
		SQLQuery query = session.createSQLQuery("select id, name from t_user where username = :username and password = :password");
		query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		query.setParameter("username", username);
		query.setParameter("password", password);
		try{
			List<Map<String, Object>> result = query.list();
			User user = new User();
			user.setId((int)result.get(0).get("id"));
			user.setName((String)result.get(0).get("name"));
			return user;
		}
		catch (Exception e) {
			System.out.println("报错了：" + e.getMessage());
			return null;
		}
	}
}


