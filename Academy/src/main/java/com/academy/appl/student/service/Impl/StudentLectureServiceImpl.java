package com.academy.appl.student.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.academy.appl.student.persistence.StudentLectureDAO;
import com.academy.appl.student.service.StudentLectureService;
import com.academy.appl.student.vo.AttendLectureVO;
import com.academy.appl.student.vo.LectureVO;
import com.academy.appl.student.vo.QnaVO;
import com.academy.appl.student.vo.SearchCriteria;

@Service
public class StudentLectureServiceImpl implements StudentLectureService {
	
	@Inject
	private StudentLectureDAO dao;
	
	// 수강 강의 리스트
	@Override
	public List<AttendLectureVO> lectureList(String stu_id) throws Exception {
		return dao.attendLectureList(stu_id);
	}
	
	// 강의 정보 조회
	@Override
	public LectureVO lectureInfo(int lec_id) throws Exception {
		return dao.lectureInfo(lec_id);
	}
	
	// 질문 게시물 리스트
	@Override
	public List<QnaVO> qnaList(SearchCriteria cri) throws Exception {
		return dao.qnaList(cri);
	}
	
	// 질문 게시물 전체 갯 수
	@Override
	public int qnalistSearchCount(SearchCriteria cri) throws Exception {
		return dao.qnalistSearchCount(cri);
	}

}
