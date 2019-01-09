package com.niit.dao;

import java.util.List;

import com.niit.entity.StudentExchange;

public interface IStudentExchangeDao {
	void save(StudentExchange u);
	public void update(StudentExchange u) ;
	List<StudentExchange> findAll() ;
	StudentExchange findById(Integer id);
	List<StudentExchange> findByDesc();
}
