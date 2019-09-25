<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(document).ready(function() {
		$("#searchBtn").on("click", function(event){
			self.location="/student/lecture/"+${lecture.lec_id}+"/qna"
			+ "${pageMaker.makeQuery(1)}"
			+ "&searchType="
			+ $("select option:selected").val() 
			+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
		
		$("#newBtn").on("click", function(evt) {
			self.location = "register";
		})
	});
</script>

<div class="form-group">
	<div class="input-group">
			<select class="form-control form-control-sm" name="searchType">
				<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
				<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>Title</option>
				<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>Content</option>
				<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>Writer</option>
				<option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>Title Or Content</option>
				<option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>Contend Or Writer</option>
				<option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>Title Or Content Or Writer</option>
			</select>
			<input class="form-control form-control-sm" type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
			<button class="btn btn-secondary btn-sm" id="searchBtn">검색</button>
			<button class="btn btn-secondary btn-sm" id="newBtn">글쓰기</button>
	</div>
</div>

<table class="table table-hover">
	<thead class="thead-light">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${qnaList}" var="qna">
		<tr>
			<th scope="row">${qna.qna_id}</th>
			<td>${qna.qna_title}</td>
			<td>${qna.user_name}</td>
			<td>${qna.qna_created}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<div class="text-center">
	<ul class="pagination pagination-sm justify-content-center">
	
		<c:if test="${pageMaker.prev}">
			<li class="page-item">
				<a class="page-link" href="/student/lecture/${lecture.lec_id}/qna${pageMaker.makeSearch(startPage - 1)}">&laquo;</a>
			</li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li	class="page-item <c:out value="${pageMaker.cri.page == idx ?'active':''}" />"  >
				<a class="page-link" href="/student/lecture/${lecture.lec_id}/qna${pageMaker.makeSearch(idx)}">${idx}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li class="page-item">
				<a class="page-link" href="/student/lecture/${lecture.lec_id}/qna${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a>
			</li>
		</c:if>
	</ul>
</div>
