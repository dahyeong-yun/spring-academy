package com.test.academy.appl.student.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/student/lecture/*")
public class LectureController {
	
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	
	@RequestMapping(value = "{lectureName}", method=RequestMethod.GET)
	public String lectureHome(@PathVariable String lectureName, Model model) {
		logger.info(lectureName+"강의의 홈페이지 요청");
		model.addAttribute("depth1","수강 관리");
		model.addAttribute("depth2",lectureName);
		return "student/lecture/"+lectureName;
	}
	
	@RequestMapping("{lectureName}/{menuName}")
	public String lectureMenu(@PathVariable String lectureName, @PathVariable String menuName,Model model) {
		model.addAttribute("depth1","수강 관리");
		model.addAttribute("depth2",lectureName);
		return "student/lecture/"+lectureName+"/"+menuName;
	}
	
}
