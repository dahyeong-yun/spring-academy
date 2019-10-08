package com.academy.appl.admin.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.academy.appl.admin.persistence.EmployeeDAO;
import com.academy.appl.admin.service.EmployeeService;
import com.academy.appl.admin.vo.EmployeeVO;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	@Inject
	private EmployeeDAO dao;
	
	// 전체 직원 리스트
	@Override
	public List<EmployeeVO> employeeList() throws Exception {
		return dao.employeeList();
	}
	
	// 직원 아이디 순번 받아오기
	@Override
	public String getIdOrder(String part) throws Exception {
		return dao.getIdOrder(part);
	}

}
