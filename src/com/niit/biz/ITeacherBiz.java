package com.niit.biz;

import java.util.List;

import com.niit.entity.Teacher;

public interface ITeacherBiz {
	void save(Teacher u);
	void update(Teacher u) ;
	List<Teacher> findAll();
	List<Teacher> findByDesc();
	Teacher findById(Integer id);
}
