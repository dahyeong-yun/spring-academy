package com.academy.core.service.Impl;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.academy.core.persistence.AcademyDAO;
import com.academy.core.service.AcademyService;
import com.academy.core.vo.UserVO;

@Service
public class AcademyServiceImpl implements AcademyService {

	@Inject
	private AcademyDAO dao;
	
	// 로그인
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}

	// 로그아웃
	@Override
	public void logout(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.removeAttribute("loginUser");
	}

}
