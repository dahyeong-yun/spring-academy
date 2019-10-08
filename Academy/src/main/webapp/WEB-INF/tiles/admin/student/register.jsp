<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- employee/register -->
<form  role="form" class="needs-validation" novalidate>
	<strong>사용자 정보</strong>
	
	<!-- 등록 일자 자동 계산 -->
	<input type="hidden" name="user_join" id="user_join">
	
	<div class="row">
		<div class="col">
			<label for="user_id">아이디</label>
			<input class="form-control form-control-sm" type="text" name="user_id" id="user_id" readonly="readonly">
			<small id="user_id_help" class="form-text text-muted">아이디는 자동 생성되며 변경할 수 없습니다.</small>
		</div>
		
		<!-- 입사년월 자동 계산 후 입력 -->
		<div class="col">
			<label for="user_password">비밀번호</label>
			<input class="form-control form-control-sm" type="text" name="user_password" id="user_password" readonly="readonly">
			<small id="user_password_help" class="form-text text-muted">초기 비밀번호는 'qlwm' + 전화번호 끝 4자리로 구성됩니다. 예) qlwm8848 </small>
		</div>
		
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

	<button type="button" class="btn btn-primary btn-sm" id="submitBtn">직원 등록</button>
	<button class="btn btn-secondary btn-sm">다시 쓰기</button>
</form>

<script>
	$(function(){
		/* 날짜 관련 작업 : 등록일 설정, 아이디 값 설정 */
		// 1) 오늘 날짜 계산 
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
		
		// 2) 등록일 설정
		var user_join = year + "-" + month + "-" + day;
		$("#user_join").val(user_join);
		
		var check_user_id = false;
		
		// 3) 아이디 발급
		var orderNum;
		// 순번 가져오기  ajax 동기식
		$.ajax({
			url : "/admin/student/register/getIdOrder",
			type : "POST",
			async : false,
			success : function(data) {
				if(data==0) {
					data = "000";
				}
				orderNum = data;
			} 
		})
		$("#user_id").val(year+""+month+'21'+orderNum);
		
		
		/********
		 ** 검증 **
		 ********/ 
		var check_form = false;		
		
		// 1) 이름 : 글자 수 제한	
		$("#user_name").on('keyup', function() {
			// 글자 수 제한 (30자)
			if($(this).val().length > 10) {
				$(this).val($(this).val().substring(0, 10));
				//alert("이름은 10자 이하로 입력해 주세요");
			}
		});
		
		// 2) 연락처 : 글자 수 제한  11자리
		$("#user_phone").on('keyup', function() {
			// 글자 수 제한 (11자)
			if($(this).val().length > 11) {
				$(this).val($(this).val().substring(0, 11));
			}
		});
	
		
		// 3) 이메일
		// - 글자 수 제한
		
		// 4) 주소
		// 바이트 제한
		var byteCount = 0;
		var limitLength = 0;
		$("#user_address").on('keyup', function() {
			// 바이트 출력
			byteCount = strByteLength($(this).val());
			$('#user_address_help').text(byteCount+" Byte");
			// 바이트 제한
			if(byteCount == 98 || byteCount == 99 || byteCount == 100)
				limitLength = $(this).val().length;
			if(byteCount>=100) {
				$(this).val($(this).val().substring(0, limitLength));	
				//alert("이름은 10자 이하로 입력해 주세요");
			}
		});
		
		// 바이트 구하기
		var strByteLength = function(s,b,i,c){
			for(b=i=0; c=s.charCodeAt(i++); b+=c>>11?3:c>>7?2:1);
			return b
		}
		
		// 제출
		$("#submitBtn").click(function() {
			// 미입력 항목 체크
			if($("#user_name").val().length==0) {
				alert("이름을 입력하세요.");
				$("#user_name").focus();
				return;
			} else if($("#user_phone").val().length<10) {
				alert("연락처는 '-'을 제외하고 최소 10자리 숫자를 입력하세요.");
				$("#user_phone").focus();
				return;
			} else if($("#user_email").val().length==0) {
				alert("이메일을 입력하세요.");
				$("#user_email").focus();
				return;
			} else if($("#user_address").val().length==0) {
				alert("주소를 입력하세요.");
				$("#user_address").focus();
				return;
			}
			
			// 이름 : 한글만
			var regexName= /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			vName =$("#user_name").val();	
			if(!regexName.test(vName)) {
				alert("이름은 한글만 입력하세요");
				$("#user_name").val(vName.replace(regexName,''));
				check_form = false;
				return;
			}
			
			// 연락처 : 숫자만
			var regexPhone = /^[0-9]*$/ //숫자만
			vPhone = $("#user_phone").val();
			if(!regexPhone.test(vPhone)) {
				alert("연락처는 숫자만 입력하세요");
				$("#user_phone").val(vPhone.replace(regexPhone,''));
				check_form = false;
				return;
			}
			
			// 연락처는 11글자
			
			// 비밀번호 생성
			
			check_form = true;
			
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