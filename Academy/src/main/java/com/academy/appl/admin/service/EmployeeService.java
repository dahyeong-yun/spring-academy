package com.academy.appl.admin.service;

import java.util.List;

import com.academy.appl.admin.vo.EmployeeVO;

public interface EmployeeService {
	// 전체 직원 리스트
	public List<EmployeeVO> employeeList() throws Exception;

	// 직원 아이디 순번 받아오기
	public String getIdOrder(String part) throws Exception;
}
