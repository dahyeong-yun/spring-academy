package com.academy.appl.admin.service;

import java.util.List;
import java.util.Map;

import com.academy.appl.admin.vo.AdminStudentVO;
import com.academy.appl.admin.vo.JqgridQueryString;

public interface AdminStudentService {
	// 전체 학생 수
	public int studentListCount() throws Exception;

	// 그리드 페이지 정보 set
	public JqgridQueryString jqgridQuerySetting(JqgridQueryString jqQueryString, int records);

	// 전체 학생 리스트
	public List<AdminStudentVO> studentList(JqgridQueryString jqQueryString) throws Exception;

	// 학생 리스트 페이징 결과 값
	public Map<String, Object> combineQueryAndStudentList(List<AdminStudentVO> stuList,
			JqgridQueryString jqQueryString);

}
