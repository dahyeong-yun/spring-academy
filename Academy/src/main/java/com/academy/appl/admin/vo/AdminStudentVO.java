package com.academy.appl.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminStudentVO {
	private String user_id;
	private String user_login_id;
	private String user_password;
	private String user_suspended;
	private String user_name;
	private String user_phone;
	private String user_email;
	private Date user_birth;
	private String user_address;
	private String user_gender;
	private Date user_join_date;
}
