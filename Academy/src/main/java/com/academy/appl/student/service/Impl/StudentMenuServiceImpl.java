package com.academy.appl.student.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.academy.appl.student.persistence.StudentMenuDAO;
import com.academy.appl.student.service.StudentMenuService;
import com.academy.appl.student.vo.AttendLectureVO;
import com.academy.appl.student.vo.MenuCreate;

@Service
public class StudentMenuServiceImpl implements StudentMenuService {

	@Inject
	private MenuCreate menu;
	
	// DAO
	@Inject
	private StudentMenuDAO dao;
	
	// 메인 수강 강의 리스트 3개
	@Override
	public List<AttendLectureVO> attendLectureList(String stu_id) throws Exception {
		return dao.attendLectureList(stu_id);
	}

	// 메뉴 생성
	@Override
	public MenuCreate menuInfo(String depth1, String depth2) throws Exception {
		menu.setDepth1(depth1);
		menu.setDepth2(depth2);
		return menu;
	}
	

}
