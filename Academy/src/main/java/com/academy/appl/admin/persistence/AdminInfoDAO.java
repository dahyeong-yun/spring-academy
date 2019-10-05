package com.academy.appl.admin.persistence;

import com.academy.core.vo.UserVO;

public interface AdminInfoDAO {
	// 회원 정보 수정
	public int updateUserInfo(UserVO vo) throws Exception;
	
	// 세션 갱신을 위한 사용자 정보 조회
	public UserVO renewalUserSession(UserVO vo);
}
