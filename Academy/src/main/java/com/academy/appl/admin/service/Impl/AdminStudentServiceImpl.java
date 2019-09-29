package com.academy.appl.admin.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.academy.appl.admin.persistence.AdminStudentDAO;
import com.academy.appl.admin.service.AdminStudentService;
import com.academy.appl.admin.vo.AdminStudentVO;

@Service
public class AdminStudentServiceImpl implements AdminStudentService {
	
	@Inject
	private AdminStudentDAO dao;
	// 전체 학생 리스트
	@Override
	public List<AdminStudentVO> studentList() throws Exception {
		return dao.studentList();
	}

}
