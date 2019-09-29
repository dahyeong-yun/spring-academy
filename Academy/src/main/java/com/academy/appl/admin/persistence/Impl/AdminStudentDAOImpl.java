package com.academy.appl.admin.persistence.Impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.academy.appl.admin.persistence.AdminStudentDAO;
import com.academy.appl.admin.vo.AdminStudentVO;

@Repository
public class AdminStudentDAOImpl implements AdminStudentDAO {

	@Inject
	private SqlSession session;
	
	private String namespace = "com.academy.mappers.admin.adminStudentMapper";

	@Override
	public List<AdminStudentVO> studentList() throws Exception {
		return session.selectList(namespace+"studentList");
	}
}
