package com.academy.appl.admin.service.Impl;

import javax.inject.Inject;

import com.academy.appl.admin.persistence.AdminLectureDAO;
import com.academy.appl.admin.service.AdminLectureService;
import com.academy.core.vo.UserVO;

public class AdminLectureServiceImpl implements AdminLectureService {
	
	@Inject
	private AdminLectureDAO dao;
	
	// 진행중인 강의 숫자
	@Override
	public int countOngoingLeture(UserVO vo) throws Exception {
		return dao.countOngoingLeture(vo);
	}

	// 종강한 강의 숫자
	@Override
	public int countEndLeture(UserVO vo) throws Exception {
		return dao.countEndLeture(vo);
	}
	
	// 개강 예정 강의 숫자
	@Override
	public int countScheduledLeture(UserVO vo) throws Exception {
		return dao.countScheduledLeture(vo);
	}

}
