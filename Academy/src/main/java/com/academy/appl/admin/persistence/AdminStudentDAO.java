package com.academy.appl.admin.persistence;

import java.util.List;

import com.academy.appl.admin.vo.AdminStudentVO;
import com.academy.appl.admin.vo.JqgridQueryString;

public interface AdminStudentDAO {
	// 전체 학생 리스트
	public List<AdminStudentVO> studentList(JqgridQueryString jqQueryString) throws Exception;
	
	// 전체 학생 수
	public int studentListCount() throws Exception;
}
