package com.academy.appl.student.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.academy.appl.student.persistence.StudentInfoDAO;
import com.academy.appl.student.service.StudentInfoService;
import com.academy.core.vo.UserVO;
@Service
public class StudentInfoServiceImpl implements StudentInfoService {

	@Inject
	private StudentInfoDAO dao;
	
	// 회원 정보 수정
	@Override
	public int updateUserInfo(UserVO vo) throws Exception {
		return 0;
	}

	@Override
	public UserVO renewalUserSession(UserVO vo) {
		return null;
	}

	// 회원 탈퇴
	@Override
	public void suspendUser(String user_id) throws Exception {
		dao.suspendUser(user_id);
	}

}
