package com.academy.appl.student.persistence.Impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.academy.appl.student.persistence.StudentDAO;
import com.academy.appl.student.vo.AttendCourseVO;
import com.academy.appl.student.vo.StudentVO;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Inject
	private SqlSession session;
	
	private String namespace = "com.academy.mappers.student.studentMapper";
	
	// 수강 강의 리스트
	@Override
	public List<AttendCourseVO> attendCourseList(StudentVO vo) throws Exception {
		return session.selectList(namespace+".attendCourseList", vo);
	}

}
