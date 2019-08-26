<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<jsp:include page="menu_student.jsp"></jsp:include>

	<!-- 본문 컨텐츠 -->
	<div class="container mt-4">
		<div class="container">
			수강 관리 > Java Framework > 출석 현황
			<h1 class="display-6">출석 현황</h1>
		</div>
		<div class="row mt-4">
			<div class="col-2">
				<jsp:include page="./lecture_left_menu.jsp"></jsp:include>
			</div>
			<div class="col-10">
				수업 일수 : 1일<br>
				출석 일수 : 1일<br>
				출석률 : 85%<br>
				남은 수업일 수 : 16일<br>
				위에 네 가지를 박스 아이콘 형태로 만들면 될 듯
				<table class="table" style="font-size:small;align-content:center;">
					<tr>
						<th>수업 일자</th>
						<th>주차(진도)</th>
						<th>상태</th>
						<th>강의실</th>
						<th>보강일자</th>
						<th>보강사유</th>
						<th>보강 강의실</th>
					</tr>
					<tr>
						<td>2019-12-01</td>
						<td>1 / 16</td>
						<td>출석</td>
						<td>B 강의실</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2019-12-08</td>
						<td>2 / 16</td>
						<td></td>
						<td>B 강의실</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2019-12-15</td>
						<td>3 / 16</td>
						<td></td>
						<td>B 강의실</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
