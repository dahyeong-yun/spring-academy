<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- /student/info/suspend -->
<div class="text-center">
	<form id="suspendForm">
		<input type="hidden" name="user_id" id="user_id">
	</form>
	<p>정말로 탈퇴하시겠습니까?</p>
	
	<button class="btn btn-danger btn-sm">네, 탈퇴합니다.</button>
	<a class="btn btn-primary btn-sm ml-3" href="/student/info">아니오. 탈퇴하지 않습니다.</a>
</div>
<script>
	$(function(){
		$(".btn-danger").click(function(){
			var agree = confirm("탈퇴 후에는 바로 로그아웃 처리 되며, 해당 서비스를 다시 이용할 수 없습니다. 정말로 탈퇴하시겠습니까?");
			if(agree) {
				var formObj = $("#suspendForm");
				$("#user_id").val("${loginUser.user_id}");
				formObj.attr("action","/student/info/suspend");
				formObj.attr("method","POST");
				formObj.submit();
			}
		})
	});
</script>