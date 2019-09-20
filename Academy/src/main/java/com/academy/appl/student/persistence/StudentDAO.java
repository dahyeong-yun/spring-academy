package com.academy.appl.student.persistence;

import java.util.List;

import com.academy.appl.student.vo.AttendCourseVO;
import com.academy.appl.student.vo.StudentVO;

public interface StudentDAO {

	// 수강 강의 리스트
	public List<AttendCourseVO> attendCourseList(StudentVO vo) throws Exception;

}
