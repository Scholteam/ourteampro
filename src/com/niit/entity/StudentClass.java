package com.niit.entity;

public class StudentClass{

	private Integer CId;
	private Integer CSnum;
	private String CMonday;
	private String CTuesday;
	private String CWednesday;
	private String CThursday;
	private String CFriday;
	public Integer getCId() {
		return CId;
	}
	public void setCId(Integer cId) {
		CId = cId;
	}
	public Integer getCSnum() {
		return CSnum;
	}
	public void setCSnum(Integer cSnum) {
		CSnum = cSnum;
	}
	public String getCMonday() {
		return CMonday;
	}
	public void setCMonday(String cMonday) {
		CMonday = cMonday;
	}
	public String getCTuesday() {
		return CTuesday;
	}
	public void setCTuesday(String cTuesday) {
		CTuesday = cTuesday;
	}
	public String getCWednesday() {
		return CWednesday;
	}
	public void setCWednesday(String cWednesday) {
		CWednesday = cWednesday;
	}
	public String getCThursday() {
		return CThursday;
	}
	public void setCThursday(String cThursday) {
		CThursday = cThursday;
	}
	public String getCFriday() {
		return CFriday;
	}
	public void setCFriday(String cFriday) {
		CFriday = cFriday;
	}
	@Override
	public String toString() {
		return "StudentClass [CId=" + CId + ", CSnum=" + CSnum + ", CMonday=" + CMonday + ", CTuesday=" + CTuesday
				+ ", CWednesday=" + CWednesday + ", CThursday=" + CThursday + ", CFriday=" + CFriday + "]";
	}
	

}
