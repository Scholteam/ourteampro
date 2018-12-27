package com.niit.entity;

public class Student{

	private Integer SId;
	private Integer Snum;
	private String Sname;
	private String Spassword;
	public Integer getSId() {
		return SId;
	}
	public void setSId(Integer sId) {
		SId = sId;
	}
	public Integer getSnum() {
		return Snum;
	}
	public void setSnum(Integer snum) {
		Snum = snum;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public String getSpassword() {
		return Spassword;
	}
	public void setSpassword(String spassword) {
		Spassword = spassword;
	}
	@Override
	public String toString() {
		return "Student [SId=" + SId + ", Snum=" + Snum + ", Sname=" + Sname + ", Spassword=" + Spassword + "]";
	}

}
