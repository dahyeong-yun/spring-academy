<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 본문 컨텐츠 -->

<div class="row mt-4">

	<!-- 프로필 -->
	<div class="col">
		<div class="card shadow-sm ">
			<div class="card-body">
				<h4 class="card-title">내 프로필</h4>
				<p>${loginUser.user_login_id}님, 즐거운 하루 되세요 :)</p>
				<p>아이디 : </p>
				<p>이메일 : </p>
				<button class="btn btn-danger btn-sm">정보 변경</button>
				
			</div>
		</div>
	</div>
	<!-- 프로필 end -->
	
	<!-- 수강 강의 리스트 -->
	<div class="col">
		<div class="card shadow-sm">
			<div class="card-body">
				<h4 class="card-title">다가오는 강의</h4>
				
				<div class="card ">
					<div class="card-body">
						<h6>Java Framework 반</h6>
						<p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
						<button class="btn btn-primary btn-sm ml-auto">강의실 가기</button>
					</div>
				</div>
				<button class="btn btn-primary btn-sm">전체 강의 보기</button>
			</div>
		</div>
	</div>
	<!-- 수강 강의 리스트 end -->
</div>

<div class="row mt-4">
	<!-- 질문 리스트 -->
	<div class="col">
		<div class="card shadow-sm">
			
			<div class="card-body">
				<h4 class="card-title">내 상담 리스트</h4>
			</div>
		</div>
	</div>
	<!-- 질문 리스트 end -->
	
	<!-- 강의실 예약 -->
	<div class="col">
		<div class="card shadow-sm">
			<div class="card-body">
				<h4 class="card-title">무엇을 넣을까</h4>
				<p> 예약된 강의실이 없네요 :)</p>
				<p> 강의실 명 : A 강의실</p>
				<p> 자리 번호 : A-16</p>
				<p> 예약 시간 : 19/09/18 18:00 ~ 19:00</p>
			</div>
		</div>
	</div>
	<!-- 강의실 예약 end -->
</div>
