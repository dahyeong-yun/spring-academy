package com.academy.appl.admin.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.academy.appl.admin.service.AdminStudentService;
import com.academy.appl.admin.vo.AdminStudentVO;
import com.academy.appl.admin.vo.JqgridQueryString;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
@RequestMapping("/admin/student/*")
public class AdminStudentController {
	
	@Inject
	private AdminStudentService adminStudentService;
	
	// 전체 학생 리스트
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public  Map<String, Object> getList(JqgridQueryString jqQueryString, Model model) throws Exception {
		log.info("POST 학생 관리 메뉴의 학생 리스트 요청");

		// 전체 학생 수
		int records = adminStudentService.studentListCount();
		// 쿼리 스트링 SET
		jqQueryString = adminStudentService.jqgridQuerySetting(jqQueryString, records);
		// 학생 페이징 검색 결과
		List<AdminStudentVO> stuList = adminStudentService.studentList(jqQueryString);

		// 반환값 설정
		Map<String, Object> result = adminStudentService.combineQueryAndStudentList(stuList, jqQueryString);
		
		return result;
	}
	
	// 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void postList(JqgridQueryString jqQueryString, Model model) throws Exception {
		log.info("POST 학생 관리 메뉴의 학생 정보 수정 요청");
	}
}
