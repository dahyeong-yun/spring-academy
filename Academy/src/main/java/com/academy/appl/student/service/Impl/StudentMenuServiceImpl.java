package com.academy.appl.student.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.academy.appl.student.service.StudentMenuService;
import com.academy.appl.student.vo.MenuDepth;

@Service
public class StudentMenuServiceImpl implements StudentMenuService {

	@Inject
	private MenuDepth menu;
	
	@Override
	public MenuDepth menuInfo(String depth1, String depth2) throws Exception {
		menu.setDepth1(depth1);
		menu.setDepth2(depth2);
		return menu;
	}

}
