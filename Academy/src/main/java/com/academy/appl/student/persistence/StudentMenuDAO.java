package com.academy.appl.student.persistence;

import java.util.List;

import com.academy.appl.student.vo.AttendLectureVO;

public interface StudentMenuDAO {
	// 메인 수강 강의 리스트 3개
	public List<AttendLectureVO> attendLectureList(int stu_id) throws Exception;


}
