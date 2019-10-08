package com.academy.appl.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/admin/lecture/*")
public class AdminLectureController {
	
	// 강의 관리 메뉴 대시보드 조회
	@RequestMapping("home")
	public String getHome(Model model) {
		log.info("직원 강의 관리 메뉴 요청 (GET)");
		// 진행 중 강의 수
		// 종강한 강의 수
		// 개강 예정 강의 수
		// 강의 리스트
		model.addAttribute("pageTitle", "강의 관리");
		return "admin/lecture/home";
	}	
	
	// 각 강의 홈 화면 조회
	@RequestMapping(value = "{lectureId}", method=RequestMethod.GET)
	public String getLectureHome(@PathVariable int lectureId, Model model) throws Exception {
		log.info(lectureId+" : 직원 강의 관리의 홈페이지 요청(GET)");
		
		// 강의 정보 조회
		// LectureVO lectureVO = studentLectureService.lectureInfo(lectureId);
		
		// 강의 정보 set
		// model.addAttribute("lecture", lectureVO);

		// 페이지 정보 set
		model.addAttribute("pageTitle", "강의 관리");
		// model.addAttribute("pageTitle",lectureVO.getLec_name());
		
		return "admin/lecture/"+lectureId;
	}
	
	@RequestMapping("list")
	public String getLectureList(Model model) {
		log.info("관리자 메뉴의 강의 리스트 메뉴 요청 (GET)");
		return "/admin/lecture/list";
	}

	
}
