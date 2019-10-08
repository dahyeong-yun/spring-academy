<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 최상단 메뉴  -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark shadow">
	<!-- 로고 -->
	<a class="navbar-brand mr-auto" href="<c:choose>
		<c:when test="${loginUser.user_type eq '0'}">/admin/dashboard</c:when>
		<c:when test="${loginUser.user_type eq '2'}">/student/dashboard</c:when>
		<c:otherwise>/admin/dashboard</c:otherwise>
	</c:choose>">
		<img src="/resources/build/image/img_header_logo.png" alt="Logo" style="width:220px;">
	</a>
	
	<a class="btn btn-danger btn-sm" href="/logout">로그아웃</a>

</nav>