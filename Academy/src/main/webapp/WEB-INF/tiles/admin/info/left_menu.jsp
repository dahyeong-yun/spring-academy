<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<div class="btn-group-vertical btn-block">
	<a href="/admin/info" class="btn btn-outline-primary w-100">정보 변경</a>
<!-- 	<a href="/admin/info/passChange" class="btn btn-outline-primary w-100">비밀번호 변경</a> -->
	<c:if test="${loginUser.user_type eq '1'}">
		<a href="/admin/info/suspend" class="btn btn-outline-primary w-100">회원 탈퇴</a>
	</c:if>
</div>