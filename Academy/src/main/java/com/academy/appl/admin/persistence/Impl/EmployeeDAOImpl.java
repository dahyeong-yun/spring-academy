package com.academy.appl.admin.persistence.Impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.academy.appl.admin.persistence.EmployeeDAO;
import com.academy.appl.admin.vo.EmployeeVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	@Inject
	private SqlSession session;
	
	private String namespace = "com.academy.mappers.admin.employeeMapper";

	// 전체 직원 리스트
	@Override
	public List<EmployeeVO> employeeList() throws Exception {
		return session.selectList(namespace+".employeeList");
	}
}
