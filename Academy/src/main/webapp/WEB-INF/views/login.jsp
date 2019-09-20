<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--  bootstrap4  -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<!-- bootstrap icon -->
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">
	
	<!-- custom style.css -->
	<link rel="stylesheet" href="/build/css/style.css">
	
	<!--  font  -->
	<link
		href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
		rel="stylesheet">
	<style type="text/css">
		#login_form {
			margin : auto;
			padding : 15px;
			width:100%;
			max-width: 330px;
		}
		
		.login {
			height: 100vh;
			padding-top : 30vh;
			background-color: #f5f5f5;
		}
		#msg {
			color : red;
		}
	</style>	
</head>
<body class="text-center">
	<div class="container-fluid login">
		<form class="form-signin" action="login" method="post" id="login_form">
			<h2 class="form-signin-heading">로그인 해주세요</h2>
			<input type="text" class="form-control" name="user_login_id" placeholder="Email Address" required autofocus />
			<input type="password" class="form-control" name="user_password" placeholder="Password" required />
			
			<label class="checkbox">
				<input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
			</label>
			
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
			<c:if test="${msg eq 'fail'}">
				<div id="msg">아이디 또는 비밀번호를 다시 확인하세요. 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.</div>
			</c:if>
		</form>
		
	</div>
</body>
</html>