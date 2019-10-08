<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 본문 컨텐츠 -->
<form  role="form" class="needs-validation" novalidate>
	<strong>사용자 정보</strong>
		<div class="row">
		
		<div class="col">
			<label for="user_id">아이디</label>
			<input class="form-control form-control-sm" type="text" name="user_id" id="user_id" value="${loginUser.user_id}" readonly="readonly">
		</div>
	
		<div class="col">
			<label for="user_name">이름</label>
			<input class="form-control form-control-sm" type="text" name="user_name" id="user_name" value="${loginUser.user_name}" placeholder="이름을 입력하세요.">
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
			<input class="form-control form-control-sm" type="text" name="user_phone" id="user_phone" value="${loginUser.user_phone}" placeholder="'-' 빼고 숫자만 입력하세요.">
			<small id="user_phone_help" class="form-text text-muted">수정하고자 하는 연락처를 입력하세요.</small>
			<div class="valid-feedback">Valid.</div>
      		<div class="invalid-feedback">Please fill out this field.</div>
		</div>
		
		<div class="col">
			<label for="user_email">이메일</label>
			<input class="form-control form-control-sm" type="email" name="user_email" id="user_email" value="${loginUser.user_email}" placeholder="이메일을 입력하세요.">
			<small id="user_email_help" class="form-text text-muted">수정하고자 하는 이메일을 입력하세요.</small>
			<div class="valid-feedback">Valid.</div>
      		<div class="invalid-feedback">Please fill out this field.</div>
		</div>
	
	</div>
	
	<div class="row">
		<div class="col">
			<label for="user_address">주소</label>
			<input class="form-control form-control-sm" type="text" name="user_address" id="user_address" value="${loginUser.user_address}" placeholder="주소를 입력하세요.">
			<small id="user_address_help" class="form-text text-muted">수정하고자 하는 주소를 입력하세요.</small>
			<div class="valid-feedback">Valid.</div>
      		<div class="invalid-feedback">Please fill out this field.</div>
		</div>
	</div>	
	<hr class="my-3">

	<button class="btn btn-primary btn-sm" id="submitBtn">정보 수정</button>
	<button class="btn btn-secondary btn-sm">다시 쓰기</button>
</form>

<script>
	$(function(){
		// 초기 남녀값 set
		var user_gender = "${loginUser.user_gender}";
		if(user_gender==1) {
			$("#user_gender").val('1');
		} else if(user_gender==0) {
			$("#user_gender").val('0');
		}

		
		// 초기 생일값 set
		
		
		// 검증
		var formCheck = true;
		// input 값 변경 시 검증
		// 1) 이름
		// - 글자 수 제한
		// - 한글만
		// 2) 연락처
		// - 숫자만
		// - 글자 수 제한 11자리
		// 3) 이메일
		// - 글자 수 제한
		// 4) 생일
		// - 오늘 이전 값만 허용
		
		// 제출
		
		$("#submitBtn").click(function() {
			if(formCheck) {
				var formObj = $("form[role='form']");
				formObj.attr("action","/admin/info/update");
				formObj.attr("method","POST");
				formObj.submit;
			} else {
				alert("정확한 값을 입력하세요.");
			}
		});
	});
</script>