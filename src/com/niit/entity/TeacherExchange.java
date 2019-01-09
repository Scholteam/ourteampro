package com.niit.entity;

public class TeacherExchange {
	
	private Integer TXId;
	private String TXnum;
	private String TXname;
	private String TXword;
	public Integer getTXId() {
		return TXId;
	}
	public void setTXId(Integer tXId) {
		TXId = tXId;
	}
	public String getTXnum() {
		return TXnum;
	}
	public void setTXnum(String tXnum) {
		TXnum = tXnum;
	}
	public String getTXname() {
		return TXname;
	}
	public void setTXname(String tXname) {
		TXname = tXname;
	}
	public String getTXword() {
		return TXword;
	}
	public void setTXword(String tXword) {
		TXword = tXword;
	}
	@Override
	public String toString() {
		return "TeacherExchange [TXId=" + TXId + ", TXnum=" + TXnum + ", TXname=" + TXname + ", TXword=" + TXword + "]";
	}
	
	
}
