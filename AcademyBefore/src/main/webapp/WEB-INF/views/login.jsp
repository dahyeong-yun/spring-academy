<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		
	<style>
		@import "bourbon";

		body {
			background: #eee !important;	
		}
		
		.wrapper {	
			margin-top: 80px;
			margin-bottom: 80px;
		}
		
		.form-signin {
			max-width: 380px;
			padding: 15px 35px 45px;
			margin: 0 auto;
			background-color: #fff;
			border: 1px solid rgba(0,0,0,0.1);  
		
			.form-signin-heading, .checkbox {
				  margin-bottom: 30px;
			}
		
			.checkbox {
			  font-weight: normal;
			}
		
			.form-control {
			  position: relative;
			  font-size: 16px;
			  height: auto;
			  padding: 10px;
				@include box-sizing(border-box);
		
				&:focus {
				  z-index: 2;
				}
			}
		
			input[type="text"] {
			  margin-bottom: -1px;
			  border-bottom-left-radius: 0;
			  border-bottom-right-radius: 0;
			}
		
			input[type="password"] {
			  margin-bottom: 20px;
			  border-top-left-radius: 0;
			  border-top-right-radius: 0;
			}
		}
	</style>
<!-- 	<script>
		$(document).ready(function() {
			var loginForm = $("form-signin");
            
            $("btn-primary").on("click", function(){
                loginForm.attr("action","/login")
                loginForm.attr("method","post")
                loginForm.submit;	
            })
		})
	</script> -->
</head>
<body>
	<div class="wrapper">
		<form class="form-signin" action="login" method="post">
			<h2 class="form-signin-heading">Please login</h2>
			<input type="text" class="form-control" name="user_id" placeholder="Email Address" required autofocus />
			<input type="password" class="form-control" name="user_password"	placeholder="Password" required />
			<label class="radio">
				<input type="radio" value="1" name="user_type"> 학생
				<input type="radio" value="2" name="user_type"> 매니저
				<input type="radio" value="3" name="user_type"> 관리자
			</label>
			<label class="checkbox">
				<input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
			</label>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>
	</div>
</body>
</html>