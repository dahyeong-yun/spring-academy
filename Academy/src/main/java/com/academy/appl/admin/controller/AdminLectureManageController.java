package com.academy.appl.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/admin/lecManage/*")
public class AdminLectureManageController {
	
	// 강의 리스트 조회 화면
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getLecList(Model model) throws Exception {
		// model.addAttribute("lecList", empList);
		model.addAttribute("pageTitle","강의 리스트");
		return "admin/lecManage/list";
	}
	
	// 강의 등록 화면
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String getRegisterLec(Model model) throws Exception {
		model.addAttribute("pageTitle","강의 등록");
		return "admin/lecManage/register";
	}
	
	// 수강생 등록 화면
	@RequestMapping(value = "attendee", method = RequestMethod.GET)
	public String getRegisterAttendee(Model model) throws Exception {
		model.addAttribute("pageTitle","수강생 등록");
		return "admin/lecManage/attendee";
	}
	
	// 강의 등록
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String postRegister(Model model) {
		log.info("관리자 강의 관리 메뉴의 강의 등록 요청 (POST)");
		
		return "redirect:/admin/lecManage";
	}
}
