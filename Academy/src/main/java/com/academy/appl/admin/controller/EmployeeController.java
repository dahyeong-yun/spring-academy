package com.academy.appl.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.academy.appl.admin.service.EmployeeService;
import com.academy.appl.admin.vo.EmployeeVO;
import com.academy.appl.admin.vo.SearchEmp;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/employee/*")
public class EmployeeController {
	// 직원 서비스 주입
	@Inject
	private EmployeeService employeeService;
	
	// 직원 리스트 조회 화면
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getEmpList(Model model) throws Exception {
		List<EmployeeVO> empList = employeeService.employeeList();
		model.addAttribute("empList", empList);
		model.addAttribute("pageTitle","직원 리스트");
		return "admin/employee/list";
	}
	
	// 직원 등록 화면
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String getRegisterEmp(Model model) throws Exception {
		model.addAttribute("pageTitle","직원 등록");
		return "admin/employee/register";
	}
	
	// 아이디 순번 받아오기
	@ResponseBody
	@RequestMapping(value = "register/getIdOrder", method = RequestMethod.POST)
	public String postGetIdOrder(String part) throws Exception {
		log.info("순번 검색 담당 업무 번호 : "+part);
		String result = employeeService.getIdOrder(part);
		return result;
	}
	
	// 직원 등록
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String postRegisterEmp(EmployeeVO vo, Model model) throws Exception {
		model.addAttribute("pageTitle","직원 등록");
		return "admin/employee/register";
	}
	
	@ResponseBody
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
