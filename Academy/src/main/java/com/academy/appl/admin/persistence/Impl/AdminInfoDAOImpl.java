package com.academy.appl.admin.persistence.Impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.academy.appl.admin.persistence.AdminInfoDAO;
import com.academy.core.vo.UserVO;

@Repository
public class AdminInfoDAOImpl implements AdminInfoDAO {
	@Inject
	private SqlSession session;
	
	private String namespace = "com.academy.mappers.admin.adminInfoMapper";

	// 회원 정보 수정
	@Override
	public int updateUserInfo(UserVO vo) throws Exception {
		return session.update(namespace+".updateUserInfo", vo);
	}
	
	// 세션 갱신을 위한 사용자 정보 조회
	@Override
	public UserVO renewalUserSession(UserVO vo) {
		return session.selectOne(namespace+".renewalUserSession", vo);
	}

}
