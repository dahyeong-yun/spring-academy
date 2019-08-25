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
	<div class="shadow-sm">
		<nav class="navbar navbar-expand-sm">
			<ul class="navbar-nav mx-auto">
				
				<li class="nav-item active">
					<a class="nav-link " href="#">
						<i class="far fa-comment-dots"></i><br>
						<p class="">상담 관리 </p>
					</a>
				</li>
				
				<li class="nav-item"><a class="nav-link" href="#">강의실 관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">증명 / 발급</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">하위 메뉴는 드롭다운</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>