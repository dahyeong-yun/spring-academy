package com.academy.appl.admin.service;

import java.util.List;

import com.academy.appl.admin.vo.AdminStudentVO;

public interface AdminStudentService {
	// 전체 학생 리스트
	public List<AdminStudentVO> studentList() throws Exception;
	
}
