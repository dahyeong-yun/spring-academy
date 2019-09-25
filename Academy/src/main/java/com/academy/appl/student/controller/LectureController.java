package com.academy.appl.student.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.academy.appl.student.service.StudentLectureService;
import com.academy.appl.student.vo.LectureVO;
import com.academy.appl.student.vo.MenuCreate;
import com.academy.appl.student.vo.PageMaker;
import com.academy.appl.student.vo.QnaVO;
import com.academy.appl.student.vo.SearchCriteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/lecture/*")
public class LectureController {
	@Inject
	private StudentLectureService studentLectureService;
	
	@Inject
	private MenuCreate menuCreate;
	
	/**
	 * 수강 관리 홈
	 * 
	 * @param lectureId
	 * */
	@RequestMapping(value = "{lectureId}", method=RequestMethod.GET)
	public String lectureHomeGet(@PathVariable int lectureId, Model model) throws Exception {
		log.info(lectureId+"수강 관리의 홈페이지 요청(GET)");
		
		// 강의 정보 조회
		LectureVO lectureVO = studentLectureService.lectureInfo(lectureId);
		
		// 강의 정보 set
		model.addAttribute("lecture", lectureVO);

		// 페이지 정보 set
		model.addAttribute("depth1", "수강 관리");
		model.addAttribute("pageTitle",lectureVO.getLec_name());
		
		return "student/lecture/"+lectureId;
	}
	/**
	 * 진도표
	 * 
	 * @param lectureId
	 * */
	@RequestMapping("{lectureId}/progress")
	public String progressGet(@PathVariable int lectureId, Model model) throws Exception {
		log.info(lectureId+"수강 관리의 진도표 요청(GET)");
		
		// 강의 정보 조회
		LectureVO lectureVO = studentLectureService.lectureInfo(lectureId);
		
		// 강의 정보 set
		model.addAttribute("lecture", lectureVO);
				
		// 페이지 정보 set
		model.addAttribute("depth1", "수강 관리");
		model.addAttribute("pageTitle", menuCreate.lectureMenu("progress"));
		
		return "student/lecture/"+lectureId+"/progress";
	}
	
	/**
	 * 질문 게시판 리스트
	 * 
	 * @param lectureId
	 * */
	@RequestMapping("{lectureId}/qna")
	public String qnaGet(@PathVariable int lectureId, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		log.info(lectureId+"수강 관리의 질문 게시판 요청(GET)");
		
		// 질문 게시물 리스트 add
		cri.setLec_id(lectureId);
		List<QnaVO> qnaList = studentLectureService.qnaList(cri);
		model.addAttribute("qnaList", qnaList);
		
		// 게시판 페이징 정보 add
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(studentLectureService.qnalistSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		// 강의 정보 조회
		LectureVO lectureVO = studentLectureService.lectureInfo(lectureId);
		
		// 강의 정보 add
		model.addAttribute("lecture", lectureVO);
				
		// 페이지 정보 add
		model.addAttribute("depth1", "수강 관리");
		model.addAttribute("pageTitle", menuCreate.lectureMenu("qna"));
		
		return "student/lecture/"+lectureId+"/qna";
	}
	/**
	 * 과제물 게시판
	 * 
	 * @param lectureId
	 * */
	@RequestMapping("{lectureId}/term")
	public String termGet(@PathVariable int lectureId, Model model) throws Exception {
		log.info(lectureId+"강의의  과제물 게시판 요청(GET)");
		
		// 강의 정보 조회
		LectureVO lectureVO = studentLectureService.lectureInfo(lectureId);
		
		// 강의 정보 set
		model.addAttribute("lecture", lectureVO);
				
		// 페이지 정보 set
		model.addAttribute("depth1", "수강 관리");
		model.addAttribute("pageTitle", menuCreate.lectureMenu("term"));
		
		return "student/lecture/"+lectureId+"/term";
	}
	
	/**
	 * 시험 게시판
	 * 
	 * @param lectureId
	 * */
	@RequestMapping("{lectureId}/test")
	public String testGet(@PathVariable int lectureId, Model model) throws Exception {
		log.info(lectureId+"강의의  시험 게시판 리스트 요청(GET)");
		
		// 강의 정보 조회
		LectureVO lectureVO = studentLectureService.lectureInfo(lectureId);
		
		// 강의 정보 set
		model.addAttribute("lecture", lectureVO);
				
		// 페이지 정보 set
		model.addAttribute("depth1", "수강 관리");
		model.addAttribute("pageTitle", menuCreate.lectureMenu("test"));
		
		return "student/lecture/"+lectureId+"/test";
	}
	
	/**
	 * 강의실 각 메뉴 홈
	 * 
	 * @param lectureId
	 * */
	@RequestMapping("{lectureId}/{menuName}")
	public String lectureMenu(@PathVariable int lectureId, @PathVariable String menuName, Model model) throws Exception {
		log.info(lectureId+"강의의 " + menuName + " 페이지 요청(GET)");
		
		// 강의 정보 조회
		LectureVO lectureVO = studentLectureService.lectureInfo(lectureId);
		
		// 강의 정보 set
		model.addAttribute("lecture", lectureVO);
				
		// 페이지 정보 set
		model.addAttribute("depth1", "수강 관리");
		model.addAttribute("pageTitle", menuCreate.lectureMenu(menuName));
		
		return "student/lecture/"+lectureId+"/"+menuName;
	}
}
