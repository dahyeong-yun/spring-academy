package com.academy.appl.student.vo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MenuCreate {
	private String depth1;
	private String depth2;
	private String depth3;
	
	// 메뉴 이름 맵 생성
	public String lectureMenu(String menuName) {
		Map<String, String> lectureMenu = new HashMap<>();
		lectureMenu.put("attend", "출석현황");
		lectureMenu.put("progress", "진도표");
		lectureMenu.put("qna", "질문 게시판");
		lectureMenu.put("term", "과제물");
		lectureMenu.put("test", "시험");
		
		return lectureMenu.get(menuName);
	}
}
