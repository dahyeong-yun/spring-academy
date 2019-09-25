package com.academy.appl.student.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.academy.appl.student.service.StudentLectureService;
import com.academy.appl.student.vo.LectureVO;
import com.academy.appl.student.vo.MenuCreate;
import com.academy.appl.student.vo.QnaVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/issue/*")
public class IssueController {
	@Inject
	private StudentLectureService studentLectureService;
	
	@Inject
	private MenuCreate menuCreate;
	
	/**
	 * 강의실 홈
	 * 
	 * @param lectureId
	 * */
	@RequestMapping(value = "{lectureId}", method=RequestMethod.GET)
	public String lectureHome(@PathVariable int lectureId, Model model) throws Exception {
		log.info(lectureId+"강의의 홈페이지 요청(GET)");
		model.addAttribute("depth1", "수강 관리");
		
		// 강의 정보 조회
		LectureVO lectureVO = studentLectureService.lectureInfo(lectureId);
		model.addAttribute("lecture", lectureVO);
		model.addAttribute("pageTitle",lectureVO.getLec_name());
		
		return "student/lecture/"+lectureId;
	}
	/**
	 * 강의실 각 메뉴 홈
	 * 
	 * @param lectureId
	 * */
	@RequestMapping("{lectureId}/{menuName}")
	public String lectureMenu(@PathVariable int lectureId, @PathVariable String menuName, Model model) throws Exception {
		log.info(lectureId+"강의의 " + menuName + " 페이지 요청(GET)");
		model.addAttribute("depth1", "수강 관리");
		
		LectureVO lectureVO = studentLectureService.lectureInfo(lectureId);
		model.addAttribute("lecture", lectureVO);
		model.addAttribute("pageTitle", menuCreate.lectureMenu(menuName));
		
		return "student/lecture/"+lectureId+"/"+menuName;
	}
}
