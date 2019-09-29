package com.academy.appl.admin.persistence;

import java.util.List;

import com.academy.core.vo.UserVO;

public interface CounselDAO {
	// 전체 사용자 리스트
	public List<UserVO> userList() throws Exception;
}
