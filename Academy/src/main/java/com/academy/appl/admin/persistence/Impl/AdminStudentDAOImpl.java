package com.academy.appl.admin.persistence.Impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.academy.appl.admin.persistence.AdminStudentDAO;
import com.academy.appl.admin.vo.AdminStudentVO;
import com.academy.appl.admin.vo.JqgridQueryString;

@Repository
public class AdminStudentDAOImpl implements AdminStudentDAO {
	@Inject
	private SqlSession session;
	
	private String namespace = "com.academy.mappers.admin.adminStudentMapper";

	// 전체 학생 리스트
	@Override
	public List<AdminStudentVO> studentList(JqgridQueryString jqQueryString) throws Exception {
		return session.selectList(namespace+".studentList", jqQueryString);
	}

	// 전체 학생 수 카운트
	@Override
	public int studentListCount() throws Exception {
		return session.selectOne(namespace+".studentListCount");
	}

	// 학생 정보 수정
	@Override
	public void updateStudent(AdminStudentVO vo) throws Exception {
		session.update(namespace+".updateStudent", vo);
	}

	// 학생 계정 정지
	@Override
	public void suspendStudent(String user_id) throws Exception {
		session.update(namespace+".suspendStudent", user_id);
	}

	@Override
	public String getIdOrder() throws Exception {
		return session.selectOne(namespace+".getIdOrder");
	}
}
