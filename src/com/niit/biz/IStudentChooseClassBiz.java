package com.niit.biz;

import java.util.List;

import com.niit.entity.StudentChooseClass;

public interface IStudentChooseClassBiz {
	void save(StudentChooseClass u);
	void update(StudentChooseClass u);
	List<StudentChooseClass> findAll() ;
	List<StudentChooseClass> findByDesc();
	StudentChooseClass findById(Integer id);
}
