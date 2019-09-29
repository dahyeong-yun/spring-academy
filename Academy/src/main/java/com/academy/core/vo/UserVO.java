package com.academy.core.vo;

import lombok.Data;

@Data
public class UserVO {
	private int user_id;
	private String user_login_id;
	private String user_password;
	private String user_type;
	private String user_name;
	private String user_email;
}
