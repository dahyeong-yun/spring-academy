<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<jsp:include page="menu_student.jsp"></jsp:include>

	<!-- 본문 컨텐츠 -->
	<div class="container mt-4">
		<div class="container">
			수강 관리 > Java Framework > QnA
			<h1 class="display-6">질문 게시판</h1>
		</div>
		<div class="row mt-4">
			<div class="col-2">
				<jsp:include page="./lecture_left_menu.jsp"></jsp:include>
			</div>
			<div class="col-10">
				<table class="table" style="font-size:small;align-content:center;">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>날짜</th>
						<th>글쓴이</th>
					</tr>
					<tr>
						<td>3</td>
						<td>과제 관련 질문</td>
						<td>2019-09-03</td>
						<td>박요한</td>
					</tr>
					<tr>
						<td>2</td>
						<td>자바 버전이 궁금합니다.</td>
						<td>2019-09-01</td>
						<td>이정은</td>
					</tr>
					<tr>
						<td>1</td>
						<td>Spring 설치가 안돼요.</td>
						<td>2019-09-01</td>
						<td>강희정</td>
					</tr>
				</table>
				
				<div class="row">
					<input type="text" placeholder="검색어를 입력하세요">
					<button class="btn btn-primary ml-auto">글 쓰기</button>
				</div>
			</div>
		</div>
	</div>
