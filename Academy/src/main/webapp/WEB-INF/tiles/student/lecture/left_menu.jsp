<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="btn-group-vertical btn-block">
	<a href="/student/lecture/${lecture.lec_id}/attend" class="btn btn-outline-primary w-100">출석현황</a>
	<a href="/student/lecture/${lecture.lec_id}/progress"  class="btn btn-outline-primary w-100">진도표</a>
	<a href="/student/lecture/${lecture.lec_id}/qna" class="btn btn-outline-primary w-100">QnA</a>
	<a href="/student/lecture/${lecture.lec_id}/term" class="btn btn-outline-primary w-100">과제물</a>
	<a href="/student/lecture/${lecture.lec_id}/test" class="btn btn-outline-primary w-100">시험</a>
</div>