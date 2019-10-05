package com.academy.appl.admin.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.academy.appl.admin.persistence.AdminStudentDAO;
import com.academy.appl.admin.service.AdminStudentService;
import com.academy.appl.admin.vo.AdminStudentVO;
import com.academy.appl.admin.vo.JqgridQueryString;

@Service
public class AdminStudentServiceImpl implements AdminStudentService {

	@Inject
	private AdminStudentDAO dao;
	
	// 전체 학생 수 카운트
	@Override
	public int studentListCount() throws Exception {
		return dao.studentListCount();
	}
	
	// 그리드 페이지 정보 set
	@Override
	public JqgridQueryString jqgridQuerySetting(JqgridQueryString jqQueryString, int records) {
		// 페이징 정보에 따라 쿼리 스트링 정보 수정
		int page = jqQueryString.getPage(); // 요청한 페이지
		int rows = jqQueryString.getRows(); // 페이지 당 게시물 수
		
		if(page<=0) {
			page=1;
		}
		
		if(rows==0) {
			rows=10;
		}
		
		int total = (int) Math.ceil(records/rows); // 전체 페이지
		jqQueryString.setTotal(total);
		jqQueryString.setRecords(records);
		
		int rowStart = ((page-1)*rows) + 1; // 페이지 별 시작 게시물 번호
		int rowEnd = rowStart + rows; // 페이지 별 끝 게시물 번호
		jqQueryString.setRowStart(rowStart);
		jqQueryString.setRowEnd(rowEnd);
		return jqQueryString;
	}
	
	// 전체 학생 리스트
	@Override
	public List<AdminStudentVO> studentList(JqgridQueryString jqQueryString) throws Exception {
		// 쿼리 스트링 정보와 학생 정보를 합쳐서 반환
		return dao.studentList(jqQueryString);
	}

	@Override
	public Map<String, Object> combineQueryAndStudentList(List<AdminStudentVO> stuList,
			JqgridQueryString jqQueryString) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("rows", stuList);
		result.put("total", jqQueryString.getTotal());
		result.put("records", jqQueryString.getRecords());
		result.put("page", jqQueryString.getPage());
		
		return result;
	}
	
}
