package com.academy.appl.admin.persistence.Impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.academy.appl.admin.persistence.AdminLectureDAO;
import com.academy.core.vo.UserVO;

@Repository
public class AdminLectureDAOImpl implements AdminLectureDAO {
	@Inject
	private SqlSession session;
	
	private String namespace = "com.academy.mappers.admin.adminLectureMapper";

	// 진행중인 강의 숫자
	@Override
	public int countOngoingLeture(UserVO vo) throws Exception {
		return session.selectOne(namespace+".countOngoingLeture", vo);
	}

	// 종강한 강의 숫자
	@Override
	public int countEndLeture(UserVO vo) throws Exception {
		return session.selectOne(namespace+".countEndLeture", vo);
	}

	// 개강 예정 강의 숫자
	@Override
	public int countScheduledLeture(UserVO vo) throws Exception {
		return session.selectOne(namespace+".countScheduledLeture", vo);
	}

}
