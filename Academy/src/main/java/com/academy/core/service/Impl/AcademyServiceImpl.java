package com.academy.core.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.academy.core.persistence.AcademyDAO;
import com.academy.core.service.AcademyService;
import com.academy.core.vo.UserVO;

@Service
public class AcademyServiceImpl implements AcademyService {

	@Inject
	private AcademyDAO dao;
	
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}

}
