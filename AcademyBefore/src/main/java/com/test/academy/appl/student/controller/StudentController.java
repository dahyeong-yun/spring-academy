package com.test.academy.appl.student.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);
	
	@RequestMapping("/student/dashboard")
	public String dashboard(Model model) {
		logger.info("학생 메뉴의 대시보드 요청");
		return "student/dashboard";
	}

	@RequestMapping("/student/lecture")
	public String lecture(Model model) {
		logger.info("학생 메뉴의 수강관리 요청");
		return "student/lecture";
	}
	
	@RequestMapping("/student/studyroom")
	public String studyroom(Model model) {
		logger.info("학생 메뉴의 강의실예약 요청");
		return "student/studyroom";
	}
	
	@RequestMapping("/student/issue")
	public String issue(Model model) {
		logger.info("학생 메뉴의 증명/발급 요청");
		return "student/issue";
	}	
}
