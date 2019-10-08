package com.academy.appl.admin.service;

import com.academy.core.vo.UserVO;

public interface AdminLectureService {
	// 진행중인 강의 카운트
	public int countOngoingLeture(UserVO vo) throws Exception;
	
	// 종강한 강의 카운트
	public int countEndLeture(UserVO vo) throws Exception;
		
	// 개강 예정인 강의 카운트
	public int countScheduledLeture(UserVO vo) throws Exception;
}
