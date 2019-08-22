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
	<div class="container-fulid">
		<div class="container mt-4">
			<h1 class="display-6">수강 중인 강의</h1>
			<div class="row">
				<div class="card col-5">
					<img class="card-img-top" src="img_avatar1.png" alt="Card image"
						style="width: 100%">
					<div class="card-img-overlay">
						<h4 class="card-title">Java Framework</h4>
						<a href="./student_leture_room.html" class="btn btn-primary">강의실
							입장</a>
					</div>
				</div>
				<div class="col-1"></div>
				<div class="col-1"></div>
				<div class="card col-5">
					<img class="card-img-top" src="img_avatar1.png" alt="Card image"
						style="width: 100%">
					<div class="card-img-overlay">
						<h4 class="card-title">빅데이터 분석</h4>
						<a href="#" class="btn btn-primary">강의실 입장</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>