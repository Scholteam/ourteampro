package com.niit.entity;

public class Teacher{

	private Integer TId;
	private String Tnum;
	private String Tname;
	private String Tmajor;
	private String Tclass;
	private String Tpassword;
	public Integer getTId() {
		return TId;
	}
	public void setTId(Integer tId) {
		TId = tId;
	}
	public String getTnum() {
		return Tnum;
	}
	public void setTnum(String tnum) {
		Tnum = tnum;
	}
	public String getTname() {
		return Tname;
	}
	public void setTname(String tname) {
		Tname = tname;
	}
	public String getTmajor() {
		return Tmajor;
	}
	public void setTmajor(String tmajor) {
		Tmajor = tmajor;
	}
	public String getTclass() {
		return Tclass;
	}
	public void setTclass(String tclass) {
		Tclass = tclass;
	}
	public String getTpassword() {
		return Tpassword;
	}
	public void setTpassword(String tpassword) {
		Tpassword = tpassword;
	}
	@Override
	public String toString() {
		return "Teacher [TId=" + TId + ", Tnum=" + Tnum + ", Tname=" + Tname + ", Tmajor=" + Tmajor + ", Tclass="
				+ Tclass + ", Tpassword=" + Tpassword + "]";
	}
	

}
