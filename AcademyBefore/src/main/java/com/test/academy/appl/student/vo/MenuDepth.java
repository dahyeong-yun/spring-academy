package com.test.academy.appl.student.vo;

import org.springframework.stereotype.Component;

@Component
public class MenuDepth {
	private String depth1;
	private String depth2;
	private String depth3;
	
	public String getDepth1() {
		return depth1;
	}
	public void setDepth1(String depth1) {
		this.depth1 = depth1;
	}
	public String getDepth2() {
		return depth2;
	}
	public void setDepth2(String depth2) {
		this.depth2 = depth2;
	}
	public String getDepth3() {
		return depth3;
	}
	public void setDepth3(String depth3) {
		this.depth3 = depth3;
	}
	
	@Override
	public String toString() {
		return "MenuDepth [depth1=" + depth1 + ", depth2=" + depth2 + ", depth3=" + depth3 + "]";
	}
}
