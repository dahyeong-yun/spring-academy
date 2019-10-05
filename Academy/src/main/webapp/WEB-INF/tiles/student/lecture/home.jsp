<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 본문 컨텐츠 -->
<h4 class="card-title mb-4">기본 정보</h4>
<div class="card-deck mb-3 text-center">

	<div class="card mb-4 shadow-sm">
		<div class="card-header">
			<h4 class="my-0 font-weight-normal">수강 중인 강의</h4>
		</div>
		<div class="card-body">
			<h1 class="card-title pricing-card-title">
				1 <small class="text-muted">개 강좌</small>
			</h1>
		</div>
	</div>
	
	<div class="card mb-4 shadow-sm">
		<div class="card-header">
			<h4 class="my-0 font-weight-normal">수강 완료 강의</h4>
		</div>
		<div class="card-body">
			<h1 class="card-title pricing-card-title">
				3 <small class="text-muted">개 강좌</small>
			</h1>
		</div>
	</div>
	
	<div class="card mb-4 shadow-sm">
		<div class="card-header">
			<h4 class="my-0 font-weight-normal">수강 예정 강의</h4>
		</div>
		<div class="card-body">
			<h1 class="card-title pricing-card-title">
				1 <small class="text-muted">개 강좌</small>
			</h1>
		</div>
	</div>
</div>

<h4 class="card-title">강의 전체 리스트</h4>
<div class="row">
	<c:forEach items="${lectureList}" var="lecture">
	<div class="col-6 mb-2">
		<div class="card shadow-sm ">
			<div class="card-body">
				<p>강의명 : ${lecture.lec_name}</p>
				<button class="btn btn-primary btn-sm btn-course" onclick="javascript:enterClassRoom(${lecture.lec_id})">강의실 가기</button>
			</div>
		</div>
	</div>
	</c:forEach>
</div>

<script>
	function enterClassRoom(lec_id) {
		location.href="/student/lecture/"+lec_id;
	}
</script>

기본 뷰<br>
출석 그냥 확인용 -> 이카운트 달력 형태 출석, 결석<br>
진도표 -> 원래 입력된
커리큘럼 / 상태구분 완료, 진행 중(당일) 진행 예정<br>
 QnA는 계층형 게시판<br>
 과제물은 파일 업로드 게시판, 정해진 날짜까지만 가능<br>
 시험, 정해진 날짜만 오픈
수강 관리 홈