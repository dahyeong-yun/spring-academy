package com.academy.appl.admin.service;

import java.util.List;
import java.util.Map;

import com.academy.appl.admin.vo.AdminStudentVO;
import com.academy.appl.admin.vo.JqgridQueryString;

public interface AdminStudentService {
	// 전체 학생 수
	public int studentListCount() throws Exception;

	// 그리드 페이지 정보 set
	public JqgridQueryString jqgridQuerySetting(JqgridQueryString jqQueryString, double records);

	// 전체 학생 리스트
	public List<AdminStudentVO> studentList(JqgridQueryString jqQueryString) throws Exception;

	// 학생 리스트 페이징 결과 값
	public Map<String, Object> combineQueryAndStudentList(List<AdminStudentVO> stuList,	JqgridQueryString jqQueryString);
	
	// 학생 정보 수정
	public void updateStudent(AdminStudentVO vo) throws Exception;

	// 학생 계정 정지
	public void suspendStudent(String user_id) throws Exception;

	// 학생 아이디 순번 받아오기
	public String getIdOrder() throws Exception;

}
