<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../menu_top.jsp"></jsp:include>
	<!-- 회원 분류별 메뉴 : 업무 메뉴 -->
	<!-- 네비 하위 그림자 설정 -->
	<nav class="navbar navbar-expand-sm">
		<ul class="navbar-nav mx-auto">
			<li class="nav-item" >
				<a class="nav-link" href="./lecture_list.jsp">
					<i class="far fa-bell"></i><br> 수강 관리
					<i class="dropdown-toggle" data-toggle="dropdown"></i>
				</a>
				<div class="dropdown-menu">
					<h5 class="dropdown-header">진행중인 강의r</h5>
					<a class="dropdown-item" href="./lecture_javaFramework.jsp">Java
						Framework</a> <a class="dropdown-item" href="#">Link 2</a> <a
						class="dropdown-item" href="#">Link 3</a>
					<h5 class="dropdown-header">완료된 강의</h5>
					<a class="dropdown-item" href="#">Another link</a>
				</div>
			</li>
			<li class="nav-item">
				<div class="dropdown">
					<a class="nav-link" href="#">강의실 예약</a>
					
				</div>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">증명 / 발급</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">하위 메뉴는 드롭다운</a></li>
		</ul>
	</nav>
</body>
</html>