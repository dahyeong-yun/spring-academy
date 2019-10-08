package com.academy.appl.admin.persistence;

import java.util.List;

import com.academy.appl.admin.vo.AdminStudentVO;
import com.academy.appl.admin.vo.JqgridQueryString;

public interface AdminStudentDAO {
	// 전체 학생 리스트
	public List<AdminStudentVO> studentList(JqgridQueryString jqQueryString) throws Exception;
	
	// 전체 학생 수
	public int studentListCount() throws Exception;
	
	// 학생 계정 정보 업데이트
	public void updateStudent(AdminStudentVO vo) throws Exception;
	
	// 학생 계정 정지
	public void suspendStudent(String user_id) throws Exception;

	// 학생 아이디 순번 받아오기
	public String getIdOrder() throws Exception;
}
