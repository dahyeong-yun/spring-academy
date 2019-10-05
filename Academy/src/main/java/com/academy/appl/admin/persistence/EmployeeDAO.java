package com.academy.appl.admin.persistence;

import java.util.List;

import com.academy.appl.admin.vo.EmployeeVO;

public interface EmployeeDAO {
	// 전체 직원 리스트
	public List<EmployeeVO> employeeList() throws Exception;
}
