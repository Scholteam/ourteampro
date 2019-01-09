package com.niit.biz;

import java.util.List;

import com.niit.entity.Review;

public interface IReviewBiz {
	void save(Review u);
	void update(Review u);
	List<Review> findAll();
	Review findById(Integer id);
	List<Review> findByDesc();
}
