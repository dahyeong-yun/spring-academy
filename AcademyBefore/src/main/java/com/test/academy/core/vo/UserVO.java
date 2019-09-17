package com.test.academy.core.vo;

public class UserVO {
	private String user_login_id;
	private String user_password;
	private String user_type;
	
	public UserVO() {}
	
	public String getUser_login_id() {
		return user_login_id;
	}
	public void setUser_login_id(String user_login_id) {
		this.user_login_id = user_login_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	@Override
	public String toString() {
		return "UserVO [user_login_id=" + user_login_id + ", user_password=" + user_password + ", user_type=" + user_type + "]";
	}
	
	
}

