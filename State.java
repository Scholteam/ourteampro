package com.niit.model.enums;

public enum State {

	NULL(-1),
	Error(0),
	OK(1);
	
	private int index;
	
	private State(int index) {  
        this.index = index;  
    }

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
}
