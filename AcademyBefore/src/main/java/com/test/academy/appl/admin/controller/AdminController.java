package com.test.academy.appl.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("dashboard")
	public String dashboard(Model model) {
		logger.info("관리자 메뉴의 대시보드 요청");
		return "admin/dashboard";
	}

	@RequestMapping("lecture")
	public String lecture(Model model) {
		logger.info("관리자 메뉴의 수강관리 요청");
		return "admin/lecture";
	}
	
	@RequestMapping("studyroom")
	public String studyroom(Model model) {
		logger.info("관리자 메뉴의 강의실 예약 요청");
		return "admin/studyroom";
	}
	
	@RequestMapping("issue")
	public String issue(Model model) {
		logger.info("관리자 메뉴의 증명/발급 요청");
		return "admin/issue";
	}	
}
