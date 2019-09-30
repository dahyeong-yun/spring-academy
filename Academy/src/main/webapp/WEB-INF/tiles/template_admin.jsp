<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Business IT Academy</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- jqgrid -->
	<link rel="stylesheet" type="text/css" media="screen" href="/resources/vendor/jqgridUI/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="/resources/vendor/jqgrid/css/ui.jqgrid.css" />
	<script type="text/javascript" src="/resources/vendor/jqgrid/jquery.js"></script>
	<script type="text/javascript" src="/resources/vendor/jqgrid/js/i18n/grid.locale-kr.js"></script>
	<script type="text/javascript" src="/resources/vendor/jqgrid/js/minified/jquery.jqGrid.min.js"></script>
	
	<!--  bootstrap4  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">
	
	<!-- custom style.css -->
	<link href='<c:url value="/css/style.css"/>' rel="stylesheet">
	
	<!--  font  -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
</head>

<body>
	<div style="width: 100%; height: 100%;">
		<div>
			<tiles:insertAttribute name="nav" />
		</div>
		
		<div>
			<tiles:insertAttribute name="menu" />
		</div>
		
		<!-- 본문 컨텐츠 -->
		<div class="container mt-4">
			<div class="container">
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="#">Home</a></li>
				  </ol>
				</nav>
				
			<c:choose>
				<c:when test="${pageTitle != null}">
					<h1 class="display-6">${pageTitle}</h1>
				</c:when>
				<c:otherwise>
					<h1 class="display-6">메뉴명</h1>
				</c:otherwise>
			</c:choose>
			
			</div>
			
			<div class="row mt-4">
				<div class="col-md-2">
					<div id="left">
						<tiles:insertAttribute name="left" />
					</div>
				</div>
				<div class="col-md-10">
					<div id="body">
						<tiles:insertAttribute name="body" />
					</div>
				</div>
			</div>
		</div>
		
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>