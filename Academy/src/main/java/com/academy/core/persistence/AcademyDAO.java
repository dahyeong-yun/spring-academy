package com.academy.core.persistence;

import com.academy.core.vo.UserVO;

public interface AcademyDAO {

	public UserVO login(UserVO vo) throws Exception;

}
