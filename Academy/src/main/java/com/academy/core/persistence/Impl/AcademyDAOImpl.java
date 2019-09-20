package com.academy.core.persistence.Impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.academy.core.persistence.AcademyDAO;
import com.academy.core.vo.UserVO;

@Repository
public class AcademyDAOImpl implements AcademyDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(AcademyDAOImpl.class);
	
	@Inject
	private SqlSession session;
	
	private final String namespace = "com.academy.mappers.academyMapper";
	/**
	 * 사용자 로그인 */
	@Override
	public UserVO login(UserVO vo) throws Exception {
		logger.info("DAO login");
		return session.selectOne(namespace+".login", vo);
	}

}
