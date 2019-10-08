package com.academy.appl.admin.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.academy.appl.admin.service.AdminStudentService;
import com.academy.appl.admin.vo.AdminStudentVO;
import com.academy.appl.admin.vo.JqgridQueryString;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/admin/student/*")
public class AdminStudentController {
	
	@Inject
	private AdminStudentService adminStudentService;
	
	// 학생 리스트 화면
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getStuList(Model model) throws Exception {
		model.addAttribute("pageTitle","학생 리스트");
		return "admin/student/home";
	}
	
	// 학생 등록 화면
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String getRegisterStu(Model model) throws Exception {
		model.addAttribute("pageTitle","학생 등록");
		return "admin/student/register";
	}
		
	// 전체 학생 리스트
	@ResponseBody
	@RequestMapping(value = "getList", method = RequestMethod.GET)
	public  Map<String, Object> getList(JqgridQueryString jqQueryString, Model model) throws Exception {
		log.info("POST 학생 관리 메뉴의 학생 리스트 요청");

		// 전체 학생 수
		double records = adminStudentService.studentListCount();
		// 쿼리 스트링 SET
		jqQueryString = adminStudentService.jqgridQuerySetting(jqQueryString, records);
		
		// 학생 페이징 검색 결과
		List<AdminStudentVO> stuList = adminStudentService.studentList(jqQueryString);

		// 반환값 설정
		Map<String, Object> result = adminStudentService.combineQueryAndStudentList(stuList, jqQueryString);
		
		return result;
	}
	
	// 학생 정보 수정 
	@ResponseBody
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void postUpdate(AdminStudentVO vo, Model model) throws Exception {
		log.info("POST 학생 관리 메뉴의 학생 정보 수정 요청");
		log.info("vo : "+vo.toString());
		adminStudentService.updateStudent(vo);
	}
	
	// 학생 계정 정지 
	@ResponseBody
	@RequestMapping(value = "suspend", method = RequestMethod.POST)
	public void postSuspend(String user_id, Model model) throws Exception {
		log.info("POST 학생 관리 메뉴의 학생 계정 정지 요청");
		log.info("user_id : "+user_id);
		adminStudentService.suspendStudent(user_id);
	}
	
	// 학생 아이디 순번 받아오기
	@ResponseBody
	@RequestMapping(value = "register/getIdOrder", method = RequestMethod.POST)
	public String postGetIdOrder() throws Exception {
		log.info("POST 학생 관리 메뉴의 학생 계정 받아오기 요청");
		String result = adminStudentService.getIdOrder();
		return result;
	}
}
