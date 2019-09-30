package com.academy.core.service;

import javax.servlet.http.HttpServletRequest;

import com.academy.core.vo.UserVO;

public interface AcademyService {
	// 로그인
	public UserVO login(UserVO vo) throws Exception;

	// 로그 아웃
	public void logout(HttpServletRequest req) throws Exception;
}
