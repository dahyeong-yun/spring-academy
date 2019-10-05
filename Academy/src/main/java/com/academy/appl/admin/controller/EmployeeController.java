package com.academy.appl.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.academy.appl.admin.service.EmployeeService;
import com.academy.appl.admin.vo.EmployeeVO;
import com.academy.appl.admin.vo.SearchEmp;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/admin/employee/*")
public class EmployeeController {
	// 직원 서비스 주입
	@Inject
	private EmployeeService employeeService;
	
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public List<EmployeeVO> postList(Model model) throws Exception {
		log.info("POST 직원 관리 메뉴의 직원 리스트 요청");
		List<EmployeeVO> empList = employeeService.employeeList();
		return empList;
	}
	
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public List<EmployeeVO> postSearch(SearchEmp search, Model model) throws Exception {
		log.info("POST 직원 관리 메뉴의 직원 검색 요청");
		List<EmployeeVO> empList = employeeService.employeeList();
		return empList;
	}
}
