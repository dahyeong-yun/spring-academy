<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="post">
	<div class="form-group">
		<h4>강의실 선택</h4>
		<select	class="form-control" id="studyroom" name="clr_id">
			<option value="0">---</option>
			<option value="1">1 강의실</option>
			<option value="2">2 강의실</option>
			<option value="3">프로젝트 실</option>
		</select>
	</div>
	
	<div class="form-group">
		<h4>좌석 배치도</h4>
		<div id="seatMap1" class="d-none text-center">
			<span class="d-block p-2 bg-dark text-white text-center">칠판</span>
			
			<div class="row mt-4">
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A1</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A2</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A3</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A4</span>
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A5</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A6</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A7</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A8</span>
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A9</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A10</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A11</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">A12</span>
				</div>
			</div>
		</div>
		<div id="seatMap2" class="d-none text-center">
			<span class="d-block p-2 bg-dark text-white text-center">칠판</span>
			
			<div class="row mt-4">
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B1</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B2</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B3</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B4</span>
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B5</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B6</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B7</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B8</span>
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B9</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B10</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B11</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">B12</span>
				</div>
			</div>
		</div>
		<div id="seatMap3" class="d-none text-center">
			<span class="d-block p-2 bg-dark text-white text-center">칠판</span>
			
			<div class="row mt-4">
				<div class="col">
					<span class="d-block p-2 bg-white border seat">P1</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">P3</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">P5</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">P7</span>
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col">
					<span class="d-block p-2 bg-white border seat">P2</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">P4</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">P6</span>
				</div>
				<div class="col">
					<span class="d-block p-2 bg-white border seat">P8</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<h4>선택 강의실 정보</h4>
		<label for="choosenStudyroom">선택한 강의실</label>
		<input class="form-control" type="text" value="---" id="choosenStudyroom" disabled="disabled" />
		
		<label for="choosenSeat">선택한 좌석</label>
		<input class="form-control" type="text" value="A3" id="choosenSeat" disabled="disabled" />
		
		<label for="studyroomUser">이용자 이름</label>
		<input class="form-control" type="text" value="${loginUser.user_name}" id="studyroomUser" disabled="disabled" />
	</div>
	
</form>

<script>
	$(function(){
		// select 값 선택 시, 좌석 표시 변경
		$("#studyroom").change(function(){
			var std_room = $("#studyroom").val();
			if(std_room==0) {	
				$("#choosenStudyroom").val("---");
			} else if(std_room==1) {
				seatVisionControl("#seatMap2");
				seatVisionControl("#seatMap3");
				$("#seatMap1").removeClass("d-none");
				$("#choosenStudyroom").val("1 강의실");
			} else if(std_room==2) {
				seatVisionControl("#seatMap1");
				seatVisionControl("#seatMap3");
				$("#seatMap2").removeClass("d-none");
				$("#choosenStudyroom").val("2 강의실");
			} else if(std_room==3) {
				seatVisionControl("#seatMap1");
				seatVisionControl("#seatMap2");
				$("#seatMap3").removeClass("d-none");
				$("#choosenStudyroom").val("프로젝트 실");

			}		
		})
		
		// d-none 클래스 검증 후 제거
		function seatVisionControl(className) {
			if($(className).hasClass("d-none")==0) {
				$(className).addClass("d-none")
			}
		}
		
		// 좌석 클릭 시, 음영 처리 및 선택한 좌석 정보 표시
		var selectSeadConfirm = false;
		var selectedSeat = null;
		$(".seat").click(function(){
			// 하나만 선택할 수 있게끔
			if(!selectSeadConfirm) {
				if($(this).hasClass("bg-white")==1) {
					$(this).removeClass("bg-white");
					$(this).addClass("bg-primary");
					$(this).addClass("text-white");	
					selectedSeat = $(this);
					selectSeadConfirm = true;
				} else {
					$(this).removeClass("bg-primary");
					$(this).removeClass("text-white");
					$(this).addClass("bg-white");
					seletedSeat = $(this);
					selectSeadConfirm = true;
				}
			} else {
				selectedSeat.removeClass("bg-primary");
				selectedSeat.removeClass("text-white");
				selectedSeat.addClass("bg-white");
				$(this).removeClass("bg-white");
				$(this).addClass("bg-primary");
				$(this).addClass("text-white");
				selectedSeat = $(this);
			}
		});
	});
</script>