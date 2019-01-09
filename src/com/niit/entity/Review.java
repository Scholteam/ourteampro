package com.niit.entity;

public class Review {

	Integer RId;
	Integer Rsnum;
	public Integer getRId() {
		return RId;
	}
	public void setRId(Integer rId) {
		RId = rId;
	}
	public Integer getRsnum() {
		return Rsnum;
	}
	public void setRsnum(Integer rsnum) {
		Rsnum = rsnum;
	}
	@Override
	public String toString() {
		return "Review [RId=" + RId + ", Rsnum=" + Rsnum + "]";
	}
	
}
