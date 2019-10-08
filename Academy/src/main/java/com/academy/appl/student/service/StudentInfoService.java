package com.academy.appl.student.service;

import com.academy.core.vo.UserVO;

public interface StudentInfoService {

	// 회원 정보 수정
	public int updateUserInfo(UserVO vo) throws Exception;

	// 회원 세션 정보 변경
	public UserVO renewalUserSession(UserVO vo);

	// 회원 탈퇴
	public void suspendUser(String user_id) throws Exception;

}
