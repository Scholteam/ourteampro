package com.niit.dao;

import java.util.List;

import com.niit.entity.TeacherExchange;

public interface ITeacherExchangeDao {
	void save(TeacherExchange u);
	public void update(TeacherExchange u) ;
	List<TeacherExchange> findAll() ;
	TeacherExchange findById(Integer id);
	List<TeacherExchange> findByDesc();
}
