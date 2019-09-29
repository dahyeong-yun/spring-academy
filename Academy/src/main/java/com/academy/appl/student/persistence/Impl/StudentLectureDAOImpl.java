package com.academy.appl.student.persistence.Impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.academy.appl.student.persistence.StudentLectureDAO;
import com.academy.appl.student.vo.AttendLectureVO;
import com.academy.appl.student.vo.LectureVO;
import com.academy.appl.student.vo.QnaVO;
import com.academy.appl.student.vo.SearchCriteria;

@Repository
public class StudentLectureDAOImpl implements StudentLectureDAO {

	@Inject
	private SqlSession session;
	
	private String namespace = "com.academy.mappers.student.lectureMapper";
	
	// 수강 강의 리스트
	@Override
	public List<AttendLectureVO> attendLectureList(int stu_id) throws Exception {
		return session.selectList(namespace+".attendLectureList", stu_id);
	}

	// 강의 정보 조회
	@Override
	public LectureVO lectureInfo(int lec_id) throws Exception {
		return session.selectOne(namespace+".lectureInfo", lec_id);
	}
	
	// 질문 게시물 리스트
	@Override
	public List<QnaVO> qnaList(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".qnaList", cri);
	}
	
	// 질문 게시물 전체 갯 수
	@Override
	public int qnalistSearchCount(SearchCriteria cri) throws Exception {
		return  session.selectOne(namespace+".qnalistSearchCount", cri);
	}

}
