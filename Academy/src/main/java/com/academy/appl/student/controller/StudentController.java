package com.academy.appl.student.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.appl.student.service.StudentLectureService;
import com.academy.appl.student.service.StudentMenuService;
import com.academy.appl.student.vo.AttendLectureVO;
import com.academy.appl.student.vo.MenuCreate;
import com.academy.core.vo.UserVO;


@Controller
@RequestMapping("/student/*")
public class StudentController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);
	
	@Inject
	private StudentMenuService studentMenuService;
	
	@Inject
	private StudentLectureService studentLectureService;
	
	@RequestMapping("dashboard")
	public String dashboard(Model model) throws Exception {
		logger.info("학생 메뉴의 대시보드 요청(GET)");
		MenuCreate menu = studentMenuService.menuInfo("student","dashboard");
		model.addAttribute("menu", menu);
		return "student/dashboard";
	}

	@RequestMapping("lecture")
	public String lecture(Model model, HttpSession session) throws Exception {
		logger.info("학생 메뉴의 수강관리 요청(GET)");
		UserVO user = (UserVO) session.getAttribute("loginUser");
		int stu_id = user.getUser_id();
		List<AttendLectureVO> lectureList = studentLectureService.lectureList(stu_id);
		model.addAttribute("lectureList", lectureList);
		return "student/lecture";
	}
	
	@RequestMapping("studyroom")
	public String studyroom(Model model) {
		logger.info("학생 메뉴의 강의실예약 요청(GET)");
		return "student/studyroom";
	}
	
	@RequestMapping("issue")
	public String issue(Model model) {
		logger.info("학생 메뉴의 증명/발급 요청(GET)");
		return "student/issue";
	}	
}
