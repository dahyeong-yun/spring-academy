package com.test.academy.core.persistence;

import com.test.academy.core.vo.UserVO;

public interface AcademyDAO {

	public UserVO login(UserVO vo) throws Exception;

}
