<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 본문 컨텐츠 -->
<div class="row mt-4">
	<!-- 프로필 -->
	<div class="col-6">
		<div class="card shadow-sm ">
			<div class="card-body">
				<h4 class="card-title">내 프로필</h4>
				<p>${loginUser.user_name} 님, 즐거운 하루 되세요 :)</p>
				<p>아이디 : ${loginUser.user_id}</p>
				<p>이메일 : ${loginUser.user_email}</p>
				<a href="/student/info" class="btn btn-danger btn-sm">정보 변경</a>
			</div>
		</div>
	</div>
	<!-- 프로필 end -->
	
	<!-- 수강 강의 리스트 -->
	<div class="col">
		<div class="card shadow-sm">
			<div class="card-body">
				<h4 class="card-title">최근 등록 강의	</h4>
				<c:forEach items="${lectureList}" var="lecture">
					<div class="card ">
						<div class="card-body">
							<h6>${lecture.lec_name}</h6>
							<p class="card-text">${lecture.lec_dis}</p>
							<a href="/student/lecture/${lecture.lec_id}" class="btn btn-primary btn-sm ml-auto">강의실 가기</a>
						</div>
					</div>
				</c:forEach>
				<a href="/student/lecture" class="link">전체 강의 보기</a>
			</div>
		</div>
	</div>
	<!-- 수강 강의 리스트 end -->
	
	<!-- 질문 리스트 -->
	<div class="col-6">
		<div class="card shadow-sm">
			<div class="card-body">
				<h4 class="card-title">내 질문 리스트</h4>
				
				<!-- 삭제예정 : 양식 -->
				<div class="card shadow-sm">
					<div class="card-body">
						<h4 class="card-title">질문 제목</h4>
						<p>강의명</p>
						<p>댓글 수, 좋아요 수</p>
					</div>
				</div>
				
				<c:forEach items="${qnaList}" var="qna">
				<div class="card shadow-sm">
					<div class="card-body">
						<h4 class="card-title">질문 제목</h4>
						<p>강의명</p>
						<p>댓글 수, 좋아요 수</p>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 질문 리스트 end -->
	
	<!-- 강의실 예약 -->
	<div class="col-6">
		<div class="card shadow-sm">
			<div class="card-body">
				<h4 class="card-title">내 강의실 예약 현황</h4>
				<p> 예약된 강의실이 없네요 :)</p>
				<p> 강의실 명 : A 강의실</p>
				<p> 자리 번호 : A-16</p>
				<p> 예약 시간 : 19/09/18 18:00 ~ 19:00</p>
			</div>
		</div>
	</div>
	<!-- 강의실 예약 end -->
</div>
