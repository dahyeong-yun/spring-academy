package com.test.academy.core.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.academy.core.persistence.AcademyDAO;
import com.test.academy.core.vo.UserVO;

@Service
public class AcademyServiceImpl implements AcademyService {

	@Inject
	private AcademyDAO dao;
	
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}

}
