package com.academy.appl.student.service;

import java.util.List;

import com.academy.appl.student.vo.AttendLectureVO;
import com.academy.appl.student.vo.MenuCreate;

public interface StudentMenuService {

	// 메인 수강 강의 리스트 3개
	public List<AttendLectureVO> attendLectureList(String stu_id) throws Exception;
	
	// 메뉴 생성
	public MenuCreate menuInfo(String depth1, String depth2) throws Exception;

}
