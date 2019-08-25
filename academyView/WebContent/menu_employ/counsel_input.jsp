<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu_employ.jsp"></jsp:include>

	<!-- 본문 컨텐츠 -->
	<div class="container mt-4">
		상담 관리 > 신규 상담
		<h1 class="display-6">신규 상담</h1>
		<div class="row mt-4">
			<div class="col-2">
				<div class="btn-group-vertical btn-block">
  					<button type="button" class="btn btn-outline-primary w-100">신규 상담</button>
  					<button type="button" class="btn btn-outline-primary w-100">상담 리스트</button>
				</div>
			</div>
			<div class="col-10">
				<form method="post" action="">
					<div class="form-row">
						<div class="form-group">
							<label for="counsel_date">상담 시간 </label>
							<input type="date" class="form-control" name="counsel_date" id="counsel_date">
						</div>
					</div>
	
					<div class="form-group">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="counsel_date_method" value="mail" id="counsel_date_method">
							<label class="form-check-label" for="counsel_date_method">메일</label>
							 
							<input class="form-check-input" type="checkbox" name="counsel_date_method" value="call" id="counsel_date_method">
							<label class="form-check-label" for="counsel_date_method">전화</label>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Email</label>
							<input type="email"	class="form-control" id="inputEmail4" placeholder="Email">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Password</label>
							<input type="password" class="form-control" id="inputPassword4" placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress">Address</label>
						<input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
					</div>
					<div class="form-group">
						<label for="inputAddress2">Address 2</label> <input type="text"
							class="form-control" id="inputAddress2"
							placeholder="Apartment, studio, or floor">
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">City</label> <input type="text"
								class="form-control" id="inputCity">
						</div>
						<div class="form-group col-md-4">
							<label for="inputState">State</label> <select id="inputState"
								class="form-control">
								<option selected>Choose...</option>
								<option>...</option>
							</select>
						</div>
						<div class="form-group col-md-2">
							<label for="inputZip">Zip</label> <input type="text"
								class="form-control" id="inputZip">
						</div>
					</div>
					<div class="form-group">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck"> Check me out </label>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">내역 등록</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>