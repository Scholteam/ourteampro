package com.niit.dao;

import java.util.List;

import com.niit.entity.Review;


public interface IReviewDao {
	void save(Review u);
	public void update(Review u) ;
	List<Review> findAll() ;
	Review findById(Integer id);
	List<Review> findByDesc();
}
