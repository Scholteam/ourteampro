package com.niit.biz;

import java.util.List;

import com.niit.entity.TeacherExchange;

public interface ITeacherExchangeBiz {
	void save(TeacherExchange u);
	void update(TeacherExchange u) ;
	List<TeacherExchange> findAll();
	List<TeacherExchange> findByDesc();
	TeacherExchange findById(Integer id);
}
