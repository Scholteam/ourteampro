package com.niit.entity;

public class StudentChooseClass {

	private Integer CCId;
	private Integer CCSnum;
	private String CChooseclass;
	private String CChooseday;
	private String CChoosetime;
	private String CChooseteacher;
	public Integer getCCId() {
		return CCId;
	}
	public void setCCId(Integer cCId) {
		CCId = cCId;
	}
	public Integer getCCSnum() {
		return CCSnum;
	}
	public void setCCSnum(Integer cCSnum) {
		CCSnum = cCSnum;
	}
	public String getCChooseclass() {
		return CChooseclass;
	}
	public void setCChooseclass(String cChooseclass) {
		CChooseclass = cChooseclass;
	}
	public String getCChooseday() {
		return CChooseday;
	}
	public void setCChooseday(String cChooseday) {
		CChooseday = cChooseday;
	}
	public String getCChoosetime() {
		return CChoosetime;
	}
	public void setCChoosetime(String cChoosetime) {
		CChoosetime = cChoosetime;
	}
	public String getCChooseteacher() {
		return CChooseteacher;
	}
	public void setCChooseteacher(String cChooseteacher) {
		CChooseteacher = cChooseteacher;
	}
	@Override
	public String toString() {
		return "StudentChooseClass [CCId=" + CCId + ", CCSnum=" + CCSnum + ", CChooseclass=" + CChooseclass
				+ ", CChooseday=" + CChooseday + ", CChoosetime=" + CChoosetime + ", CChooseteacher=" + CChooseteacher
				+ "]";
	}

}
