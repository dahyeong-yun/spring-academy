package com.academy.appl.student.service;

import com.academy.appl.student.vo.MenuDepth;

public interface StudentMenuService {

	public MenuDepth menuInfo(String depth1, String depth2) throws Exception;

}