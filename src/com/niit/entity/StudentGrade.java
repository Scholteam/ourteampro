package com.niit.entity;

public class StudentGrade {

	Integer GId;
	Integer GSnum;
	String GTnum;
	String GTname;
	String GTclass;
	String GSgrade;
	public Integer getGId() {
		return GId;
	}
	public void setGId(Integer gId) {
		GId = gId;
	}
	public Integer getGSnum() {
		return GSnum;
	}
	public void setGSnum(Integer gSnum) {
		GSnum = gSnum;
	}
	public String getGTnum() {
		return GTnum;
	}
	public void setGTnum(String gTnum) {
		GTnum = gTnum;
	}
	public String getGTname() {
		return GTname;
	}
	public void setGTname(String gTname) {
		GTname = gTname;
	}
	public String getGTclass() {
		return GTclass;
	}
	public void setGTclass(String gTclass) {
		GTclass = gTclass;
	}
	public String getGSgrade() {
		return GSgrade;
	}
	public void setGSgrade(String gSgrade) {
		GSgrade = gSgrade;
	}
	@Override
	public String toString() {
		return "StudentGrade [GId=" + GId + ", GSnum=" + GSnum + ", GTnum=" + GTnum + ", GTname=" + GTname
				+ ", GTclass=" + GTclass + ", GSgrade=" + GSgrade + "]";
	}
	
}
