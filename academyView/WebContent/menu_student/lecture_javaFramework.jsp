<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="menu_student.jsp"></jsp:include>

	<!-- 본문 컨텐츠 -->
	<div class="container mt-4">
		<div class="container">
			수강 관리 > Java Framework
			<h1 class="display-6">Java Framework</h1>
		</div>
		<div class="row mt-4">
			<div class="col-2">
				<div class="btn-group-vertical btn-block">
  					<button type="button" class="btn btn-outline-primary w-100">출석현황</button>
  					<button type="button" class="btn btn-outline-primary w-100">진도표</button>
  					<button type="button" class="btn btn-outline-primary w-100">QnA</button>
  					<button type="button" class="btn btn-outline-primary w-100">과제물</button>
  					<button type="button" class="btn btn-outline-primary w-100">시험</button>
				</div>
			</div>
			<div class="col-10">
				기본 뷰<br> 출석 그냥 확인용 -> 이카운트 달력 형태 출석, 결석<br> 진도표 -> 원래 입력된
				커리큘럼 / 상태구분 완료, 진행 중(당일) 진행 예정<br> QnA는 계층형 게시판<br> 과제물은
				파일 업로드 게시판, 정해진 날짜까지만 가능<br> 시험, 정해진 날짜만 오픈
			</div>
		</div>
	</div>
</body>
</html>