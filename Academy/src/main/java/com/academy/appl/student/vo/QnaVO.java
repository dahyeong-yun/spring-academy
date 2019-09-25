package com.academy.appl.student.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int qna_id;
	private int lec_id;
	private int user_id;
	private String user_name;
	private String qna_title;
	private String qna_content;
	private Date qna_created;
	private Date qna_updated;
}
