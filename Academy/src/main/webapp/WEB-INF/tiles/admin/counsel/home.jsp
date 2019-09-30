<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 본문 컨텐츠 -->



<div class="row">
	<!-- 고객 검색 -->
	<div class="col-6 mb-3">
		<h4>고객 정보 검색</h4>
		<button class="btn btn-primary btn-sm">검색</button>
	</div>
	
	<!-- 상담 검색 결과 -->
	<div class="col-6 mb-3">
		<h4>고객 정보 검색 결과</h4>
		<table id="table1"></table>
	</div>
	
	<!-- 상담 리스트 테이블 -->
	<div class="col-2 my-2">
		<h4>상담 리스트</h4>
		<table id="counsel_list"></table>
	</div>

	<!-- 상담 내용 폼 테이블 -->
	<div class="col-10 my-2">
		<h4>상담 내용 등록</h4>
		<form id="potential_customer_form">
			<strong>상담 고객 정보</strong>
			<div class="row">
				<div class="col">
					<label for="user_name">이름</label>
					<input class="form-control form-control-sm" type="text" name="user_name" id="user_name" placeholder="이름을 입력하세요.">
				</div>
				
				<div class="col">
					<label for="user_phone">연락처</label>
					<input class="form-control form-control-sm" type="text" name="user_phone" id="user_phone"placeholder="연락처를 입력하세요.">
				</div>
				
				<div class="col">
					<label for="user_email">이메일</label>
					<input class="form-control form-control-sm" type="email" name="user_email" id="user_email" placeholder="이메일을 입력하세요.">
				</div>
				
				<input type="hidden" name="user_type" value="3">
			</div>
			
			<hr class="my-3">
			
			<button class="btn btn-primary btn-sm">고객 등록</button>
		</form>
	</div>
</div>

<script>
	$(function() {
		// 상담 고객 확정 체크 
		var target_customer_ck = false;
		
		/* 상담 고객 폼 */
		$("#yesRadio").click(function(){
			$("#potential_customer_form").hide();
		});
		$("#noRadio").click(function(){
			$("#potential_customer_form").show();
		});
		
		
		/* jqgrid*/
		var dataArray = [
			{"name":"김명성", "email":"gryb809@naver.com"},
			{"name":"김명성", "email":"gryb809@naver.com"},
			{"name":"김명성", "email":"gryb809@naver.com"},
			{"name":"김명성", "email":"gryb809@naver.com"}
		];

		function makeCustomerTable(id, array) {
			$("#" + id).jqGrid({
				datatype : "local",
				height : 100,
				width : 530,
				colNames : [ '고객명','이메일' ],
				colModel : [ {
					name : 'name',
					align : 'center',
					width : '140'
				}, {
					name : 'email',
					align : 'center',
					width : '160'
				} ],
				caption : "고객 검색 결과"
			});

			for ( var i in array) {
				$("#" + id).jqGrid('addRowData', i + 1, array[i]);
			}
		}
		
		makeCustomerTable('table1', dataArray);


		var dataArray2 = [
			{"date":"2019-10-12"},
			{"date":"2019-10-12"},
			{"date":"2019-10-12"},
			{"date":"2019-10-12"},
			{"date":"2019-10-12"},
			{"date":"2019-10-12"},
		];
		
		function makeListTable(id, array) {
			$("#" + id).jqGrid({
				datatype : "local",
				height : 300,
				width : 100,
				colNames : [ '상담일자' ],
				colModel : [ {
					name : 'date',
					align : 'center',
					width : '120'
				} ],
				caption : "상담 내역 일자"
			});

			for ( var i in array) {
				$("#" + id).jqGrid('addRowData', i + 1, array[i]);
			}
		}
		
		makeListTable('counsel_list', dataArray2);
		
		var eachRowOfCustomer = $('tr[role="row"]');
		// 고객 이름 클릭 시,
		eachRowOfCustomer.each(function () {
			$(this).on('click',function(){
				var result = $(this).find("td[aria-describedby='table1_email']");
				console.log(result);
				console.log(result[0].valueOf());
				console.log(result[0].toString());
				console.log(result.attr('title'));
				console.log(typeof result.context);
			});
		});
	});
</script>