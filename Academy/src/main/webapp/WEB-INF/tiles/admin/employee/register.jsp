<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- employee/register -->
<form  role="form" class="needs-validation" novalidate>
	<strong>사용자 정보</strong>
	
	<!-- 등록일자 자동 계산 -->
	<input type="hidden" name="user_join" id="user_join">
	
	<div class="row">
		<div class="col">
			<label for="user_id">아이디</label>
			<input class="form-control form-control-sm" type="text" name="user_id" id="user_id" readonly="readonly">
			<small id="user_id_help" class="form-text text-muted">아이디는 담당 업무 선택 후 발급 버튼을 통해 발급 받을 수 있습니다.</small>
		</div>
		
		<!-- 입사년월 자동 계산 후 입력 -->
		
		<div class="col">
			<label for="user_part">담당 업무 설정</label>
			<select class="form-control form-control-sm" name="user_part" id="user_part">
				<option value="--">---</option>
				<option value="10">관리</option>
				<option value="11">교수</option>
				<option value="12">상담</option>
			</select>
			<small id="user_part_help" class="form-text text-muted">직원의 담당 업무를 선택하세요.</small>
		</div>
		
		<div class="col">
			<label for="user_password">비밀번호</label>
			<input class="form-control form-control-sm" type="text" name="user_password" id="user_password" readonly="readonly">
			<small id="user_password_help" class="form-text text-muted">초기 비밀번호는 전화번호 끝자리 4자리로 구성됩니다.</small>
		</div>
	</div>
		<!-- 순번 계산 후 입력 -->
		<div class="col">
			<label for="user_part">직원 아이디 발급</label>
			<button type="button" class="btn btn-primary btn-sm" id="makeId">아이디 발급</button>
		</div>
	<div class="row">
		<div class="col">
			<label for="user_name">이름</label>
			<input class="form-control form-control-sm" type="text" name="user_name" id="user_name" placeholder="이름을 입력하세요.">
			<small id="user_name_help" class="form-text text-muted">수정하고자 하는 이름을 입력하세요.</small>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>
	
		<div class="col">
			<label for="user_gender">성별</label>
			<select class="form-control form-control-sm" name="user_gender" id="user_gender">
				<option value="0">남자</option>
				<option value="1">여자</option>
			</select>
			<small id="user_gender_help" class="form-text text-muted">수정하고자 하는 성별을 선택하세요.</small>
		</div>
	</div>	
	
	<div class="row">
		<div class="col">
			<label for="user_phone">연락처</label>
			<input class="form-control form-control-sm" type="text" name="user_phone" id="user_phone" placeholder="'-' 빼고 숫자만 입력하세요.">
			<small id="user_phone_help" class="form-text text-muted">수정하고자 하는 연락처를 입력하세요.</small>
			<div class="valid-feedback">Valid.</div>
      		<div class="invalid-feedback">Please fill out this field.</div>
		</div>
		
		<div class="col">
			<label for="user_email">이메일</label>
			<input class="form-control form-control-sm" type="email" name="user_email" id="user_email" placeholder="이메일을 입력하세요.">
			<small id="user_email_help" class="form-text text-muted">수정하고자 하는 이메일을 입력하세요. 도메인 선택할 수 있고 직접 입력 가능하도록</small>
			<div class="valid-feedback">Valid.</div>
      		<div class="invalid-feedback">Please fill out this field.</div>
		</div>
	
	</div>
	
	<div class="row">
		<div class="col">
			<label for="user_address">주소</label>
			<input class="form-control form-control-sm" type="text" name="user_address" id="user_address" placeholder="주소를 입력하세요.">
			<small id="user_address_help" class="form-text text-muted">수정하고자 하는 주소를 입력하세요. 200 byte 제한</small>
			<div class="valid-feedback">Valid.</div>
      		<div class="invalid-feedback">Please fill out this field.</div>
		</div>
	</div>
	<hr class="my-3">

	<button class="btn btn-primary btn-sm" id="submitBtn">직원 등록</button>
	<button class="btn btn-secondary btn-sm">다시 쓰기</button>
</form>

<script>
	$(function(){
		// 오늘 날짜 계산
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth();
		month = zeroCheck(month);
		var day = today.getDate();
		day = zeroCheck(day);
		function zeroCheck(num) {
			if(num<10) {
				num = "0" + num;
			}
			return num;
		}
		
		// 입사일 설정
		var user_join = year + "-" + month + "-" + day;
		$("#user_join").val(user_join);
		
		// 버튼 클릭 시, 아이디 발급
		var check_user_id = false;
		$("#makeId").click(function(){
			// 담당 업무 번호 설정
			var part = $("#user_part").val();
			// 담당 업무를 선택 안했다면, 다시 선택하게끔.
			if("--"==part){
				alert("담당 업무를 선택해주세요.");
				return;
			}
			var orderNum;
			
			// 순번 가져오기  ajax 동기식
			$.ajax({
				url : "/admin/employee/register/getIdOrder",
				type : "POST",
				data : {"part" : part },
				async : false,
				success : function(data) {
					if(data==0) {
						data = "000";
					}
					orderNum = data;
				} 
			})
			
			$("#user_id").val(year+""+month+part+orderNum);
			check_user_id = true;
		});
		
		
		// 검증
		var check_form = true;
		// input 값 변경 시 검증
		// 1) 이름
		// - 글자 수 제한
		// - 한글만
		$("#user_name").on('keyup', function() {
			// 길이
			if($(this).val().length > 30) {
				$(this).val($(this).val().substring(0, 30));
			}
		})
		// 2) 연락처
		// - 숫자만
		// - 글자 수 제한 11자리
		
		// 3) 이메일
		// - 글자 수 제한
		
		// 4) 주소
		// 200 byte 제한
		
		// 제출
		
		
		
		 $("#submitBtn").click(function() {
			if(check_form) {
				var formObj = $("form[role='form']");
				formObj.attr("action","/admin/employee/register");
				formObj.attr("method","POST");
				formObj.submit;
			} else {
				alert("정확한 값을 입력하세요.");
			}
		});
	});
</script>