package com.academy.appl.student.persistence.Impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.academy.appl.student.persistence.StudentInfoDAO;
import com.academy.core.vo.UserVO;
@Repository
public class StudentInfoDAOImpl implements StudentInfoDAO {
	
	@Inject
	private SqlSession session;
	
	private String namespace = "com.academy.mappers.student.studentInfoMapper";
	
	// 회원 정보 수정
	@Override
	public int updateUserInfo(UserVO vo) throws Exception {
		return session.update(namespace+".updateUserInfo", vo);
	}

	// 세션 정보 수정
	@Override
	public UserVO renewalUserSession(UserVO vo) {
		return null;
	}

	// 회원 탈퇴
	@Override
	public void suspendUser(String user_id) throws Exception {
		session.update(namespace+".suspendUser", user_id);
	}

}
