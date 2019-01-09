package com.niit.entity;

public class StudentExchange {
	
	private Integer SXId;
	private Integer SXnum;
	private String SXname;
	private String SXword;
	public Integer getSXId() {
		return SXId;
	}
	public void setSXId(Integer sXId) {
		SXId = sXId;
	}
	public Integer getSXnum() {
		return SXnum;
	}
	public void setSXnum(Integer sXnum) {
		SXnum = sXnum;
	}
	public String getSXname() {
		return SXname;
	}
	public void setSXname(String sXname) {
		SXname = sXname;
	}
	public String getSXword() {
		return SXword;
	}
	public void setSXword(String sXword) {
		SXword = sXword;
	}
	@Override
	public String toString() {
		return "StudentExchange [SXId=" + SXId + ", SXnum=" + SXnum + ", SXname=" + SXname + ", SXword=" + SXword + "]";
	}
	
	

}
