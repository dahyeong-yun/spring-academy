package com.academy.appl.student.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.appl.student.service.StudentLectureService;
import com.academy.appl.student.service.StudentMenuService;
import com.academy.appl.student.vo.AttendLectureVO;
import com.academy.appl.student.vo.MenuCreate;
import com.academy.core.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/*")
public class StudentController {
	
	@Inject
	private StudentMenuService studentMenuService;
	
	@Inject
	private StudentLectureService studentLectureService;
	
	@RequestMapping("dashboard")
	public String dashboardGet(Model model, HttpSession session) throws Exception {
		log.info("학생 메뉴의 대시보드 요청(GET)");
		MenuCreate menu = studentMenuService.menuInfo("student","dashboard");
		model.addAttribute("menu", menu);
		
		// 사용자의 전체 수강 강의 리스트 set => 상위 3개로 변경
		UserVO user = (UserVO) session.getAttribute("loginUser");
		int stu_id = user.getUser_id();
		List<AttendLectureVO> lectureList = studentMenuService.attendLectureList(stu_id);
		model.addAttribute("lectureList", lectureList);
		
		// 질문 리스트

		return "student/dashboard";
	}

	@RequestMapping("lecture")
	public String lectureGet(Model model, HttpSession session) throws Exception {
		log.info("학생 메뉴의 수강관리 요청(GET)");
		
		// 사용자의 전체 수강 강의 리스트 set
		UserVO user = (UserVO) session.getAttribute("loginUser");
		int stu_id = user.getUser_id();
		List<AttendLectureVO> lectureList = studentLectureService.lectureList(stu_id);
		model.addAttribute("lectureList", lectureList);
		
		return "student/lecture";
	}
	
	@RequestMapping("studyroom")
	public String studyroomGet(Model model) {
		log.info("학생 메뉴의 강의실예약 요청(GET)");
		return "student/studyroom";
	}
	
	@RequestMapping("issue")
	public String issueGet(Model model) {
		log.info("학생 메뉴의 증명/발급 요청(GET)");
		return "student/issue";
	}
	
	@RequestMapping("info")
	public String infoGet(Model model) {
		log.info("학생 메뉴의 내 정보 요청(GET)");
		return "student/info";
	}	
}
