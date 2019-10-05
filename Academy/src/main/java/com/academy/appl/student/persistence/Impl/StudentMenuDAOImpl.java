package com.academy.appl.student.persistence.Impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.academy.appl.student.persistence.StudentMenuDAO;
import com.academy.appl.student.vo.AttendLectureVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class StudentMenuDAOImpl implements StudentMenuDAO {
	
	@Inject
	private SqlSession session;
	
	private String namespace = "com.academy.mappers.student.studentMapper";
	
	// 메인 수강 강의 리스트 3개
	@Override
	public List<AttendLectureVO> attendLectureList(String stu_id) throws Exception {
		return session.selectList(namespace+".attendLectureList", stu_id);
	}

}
