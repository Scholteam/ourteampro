package com.niit.biz;

import java.util.List;

import com.niit.entity.StudentExchange;

public interface IStudentExchangeBiz {
	void save(StudentExchange u);
	void update(StudentExchange u);
	List<StudentExchange> findAll();
	StudentExchange findById(Integer id);
	List<StudentExchange> findByDesc();
}
