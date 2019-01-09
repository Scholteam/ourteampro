package com.niit.biz.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.biz.IReviewBiz;
import com.niit.dao.IReviewDao;
import com.niit.entity.Review;


@Repository
public class ReviewBiz implements IReviewBiz{

	@Autowired
	private IReviewDao reviewDao;
	
	@Override
	public void save(Review u) {
		reviewDao.save(u);
	}
	@Override
	public void update(Review u) {
		reviewDao.update(u);
	}
	@Override
	public List<Review> findAll() {
		return reviewDao.findAll();
	}
	@Override
	public List<Review> findByDesc() {
		return reviewDao.findByDesc();
	}
	@Override
	public Review findById(Integer id) {
		return reviewDao.findById(id);
	}
	
}
