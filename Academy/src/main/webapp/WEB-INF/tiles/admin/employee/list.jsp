<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-sm table-hover text-center" id="employee_list">
	<thead>
		<tr>
			<th scope="col">아이디</th>
			<th scope="col">이름</th>
			<th scope="col">연락처</th>
			<th scope="col">이메일</th>
			<th scope="col">주소</th>
			<th scope="col">성별</th>
			<th scope="col">입사일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${empList}" var="emp">
		<tr class="eachEmp">
			<td class="id">${emp.user_id}</td>
			<td class="name">${emp.user_name}</td>
			<td class="phone">${emp.user_phone}</td>
			<td class="email">${emp.user_email}</td>
			<td class="address">${emp.user_address}</td>
			<td class="gender">${emp.user_gender}</td>
			<td class="join">${emp.user_join}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>


<!-- URD Modal -->
<div class="modal fade" id="empInfoForm">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <!-- Header -->
            <div class="modal-header">
                <h4 class="modal-title">직원 정보</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- body -->
            <div class="modal-body">
                <form>
                    <div class="row mt-2">
	                    <div class="col">
                            <label for="user_id">아이디</label>
                            <input class="form-control form-control-sm" id="user_id" type="text" readonly="readonly">
                        </div>
                        <div class="col">
                            <label for="user_name">이름</label>
                            <input class="form-control form-control-sm" id="user_name" type="text">
                        </div>
                    </div>
                    
					<div class="row mt-2">
	                    <div class="col">
                            <label for="user_email">이메일</label>
                            <input class="form-control form-control-sm" id="user_email" type="text">
                        </div>
                        <div class="col">
                            <label for="user_phone">연락처</label>
                            <input class="form-control form-control-sm" id="user_phone" type="text">
                        </div>
                    </div>
                    
                    <div class="row mt-2">
	                    <div class="col">
                            <label for="user_address">주소</label>
                            <input class="form-control form-control-sm" id="user_address" type="text">
                        </div>
                    </div>
                    
                    <div class="row mt-2">
	                    <div class="col">
	                   		<label for="user_gender">성별</label>
							<select class="form-control form-control-sm" name="user_gender" id="user_gender">
								<option value="0">남자</option>
								<option value="1">여자</option>
							</select>
                        </div>
                        
                        <div class="col">
                            <label for="user_join">입사일</label>
                            <input class="form-control form-control-sm" id="user_join" type="text">
                        </div>
                    </div>
                </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">정보 수정</button>
                <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">회원 정지</button>
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
$(function() {

    // 회원 정보 모달
    var $eachRowOfEmployee = $('tr.eachEmp');
    $eachRowOfEmployee.on("click", function() {
		// 테이블 값 찾기
    	var $user_id = $(this).find("td.id").text();
		var $user_name = $(this).find("td.name").text();
		var $user_phone = $(this).find("td.phone").text();
		var $user_email = $(this).find("td.email").text();
		var $user_address = $(this).find("td.address").text();
		var $user_gender = $(this).find("td.gender").text();
		var $user_join = $(this).find("td.join").text();

		// 모달에 값 입력
		$("#user_id").val($user_id);
		$("#user_name").val($user_name);
		$("#user_phone").val($user_phone);
		$("#user_email").val($user_email);
		$("#user_address").val($user_address);
		$("#user_gender").val($user_gender);
		$("#user_join").val($user_join);
		
		// 모달 표시
        $('#empInfoForm').modal('show');
    });
});
</script>
연락처 '-' 처리<br>
성별 남성, 여성 표기<br>