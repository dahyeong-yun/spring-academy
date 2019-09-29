package com.academy.appl.admin.persistence;

import java.util.List;

import com.academy.appl.admin.vo.AdminStudentVO;

public interface AdminStudentDAO {
	// 전체 학생 리스트
	public List<AdminStudentVO> studentList() throws Exception;
}
