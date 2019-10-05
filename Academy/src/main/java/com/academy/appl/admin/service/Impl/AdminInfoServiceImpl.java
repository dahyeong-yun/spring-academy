package com.academy.appl.admin.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.academy.appl.admin.persistence.AdminInfoDAO;
import com.academy.appl.admin.service.AdminInfoService;
import com.academy.core.vo.UserVO;

@Service
public class AdminInfoServiceImpl implements AdminInfoService {
	@Inject
	private AdminInfoDAO dao;

	// 회원 정보 수정
	@Override
	public int updateUserInfo(UserVO vo) throws Exception {
		return dao.updateUserInfo(vo);
	}

	@Override
	public UserVO renewalUserSession(UserVO vo) {
		return null;
	}
	
	
}
