package com.academy.appl.student.persistence;

import java.util.List;

import com.academy.appl.student.vo.AttendLectureVO;
import com.academy.appl.student.vo.LectureVO;
import com.academy.appl.student.vo.QnaVO;
import com.academy.appl.student.vo.SearchCriteria;

/**
 * 메뉴별로 서비스,DAO 클래스 작성
 * */
public interface StudentLectureDAO {

	// 수강 강의 리스트
	public List<AttendLectureVO> attendLectureList(int stu_id) throws Exception;

	// 강의 정보 조회
	public LectureVO lectureInfo(int lec_id) throws Exception;

	// 질문 게시물 리스트
	public List<QnaVO> qnaList(SearchCriteria cri) throws Exception;
	
	// 질문 게시물 전체 갯 수
	public int qnalistSearchCount(SearchCriteria cri) throws Exception;
}
