package com.academy.appl.student.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.academy.appl.student.vo.MenuCreate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/studyroom/*")
public class StudyroomController {
	
	@Inject
	private MenuCreate menuCreate;
	
	/**
	 * 강의실 예약 페이지
	 * 
	 * @param lectureId
	 * */
	@RequestMapping(value = "reservation", method=RequestMethod.GET)
	public void reservationGet(Model model) throws Exception {
		log.info("강의실 예약 페이지 요청(GET)");
		model.addAttribute("depth1", "강의실 예약");
		model.addAttribute("pageTitle","강의실 예약");
	}
	
	/**
	 * 강의실 예약 현황 페이지
	 * 
	 * @param lectureId
	 * */
	@RequestMapping(value = "status", method=RequestMethod.GET)
	public void statusGet(Model model) throws Exception {
		log.info("강의실 예약 현황 페이지 요청(GET)");
		model.addAttribute("depth1", "강의실 예약");
		model.addAttribute("pageTitle","강의실 예약 현황");
	}
}
