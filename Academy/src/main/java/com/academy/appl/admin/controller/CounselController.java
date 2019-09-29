package com.academy.appl.admin.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
@RequestMapping("/admin/counsel/*")
public class CounselController {
	
	@RequestMapping("list")
	public String listGet(Model model) {
		log.info("상담 관리의 신규 상담 리스트  요청(GET)");
		return "admin/counsel/list";
	}
	
	@RequestMapping("register")
	public String registerGet(Model model) {
		log.info("상담 관리의 신규 상담 등록 메뉴 요청(GET)");
		return "admin/counsel/register";
	}
	
}
