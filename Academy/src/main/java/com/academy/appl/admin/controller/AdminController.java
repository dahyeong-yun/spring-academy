package com.academy.appl.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@RequestMapping("dashboard")
	public String GETdashboard(Model model) {
		log.info("GET 관리자 메뉴의 대시보드 메뉴 요청");
		return "admin/dashboard";
	}
	
	@RequestMapping("counsel")
	public String GETcounsel(Model model) {
		log.info("GET 관리자 메뉴의 상담 관리 메뉴 요청");
		return "admin/counsel";
	}
	
	@RequestMapping("lecture")
	public String GETlecture(Model model) {
		log.info("GET 관리자 메뉴의 강의 관리 메뉴 요청");
		return "admin/lecture";
	}
	
	@RequestMapping("studyroom")
	public String GETstudyroom(Model model) {
		log.info("GET 관리자 메뉴의 강의실 관리 메뉴 요청");
		return "admin/studyroom";
	}
	
	@RequestMapping("info")
	public String GETinfo(Model model) {
		log.info("GET 관리자 메뉴의 직원 관리 메뉴 요청");
		return "admin/employee";
	}	
	
	@RequestMapping("employee")
	public String GETemployee(Model model) {
		log.info("GET 관리자 메뉴의 직원 관리 메뉴 요청");
		return "admin/employee";
	}	
	
	@RequestMapping("student")
	public String GETstudent(Model model) {
		log.info("GET 관리자 메뉴의 학생 관리 메뉴 요청");
		return "admin/student";
	}	
}
