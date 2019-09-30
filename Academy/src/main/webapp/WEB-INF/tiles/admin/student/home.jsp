<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 본문 컨텐츠 -->
<div class="table-wrapper">
	<div class="table-title">
		<div class="row">
			<div class="col-sm-8">
				<h4>학생 리스트</h4>
			</div>
			<div class="col-sm-4">
				<div class="search-box">
					<input type="text" class="form-control" placeholder="Search…">
				</div>
			</div>
		</div>
	</div>
	
	<table class="table table-striped table-hover table-bordered">
		<thead>
			<tr>
				<th>#</th>
				<th>이름 <i class="fa fa-sort"></i></th>
				<th>주소</th>
				<th>이메일<i class="fa fa-sort"></i></th>
				<th>아이디</th>
				<th></th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td class="user_id">1</td>
				<td>Thomas Hardy</td>
				<td>89 Chiaroscuro Rd.</td>
				<td>Portland</td>
				<td>97219</td>
				<td>USA</td>
			</tr>
			<tr>
				<td class="user_id">2</td>
				<td>Maria Anders</td>
				<td>Obere Str. 57</td>
				<td>Berlin</td>
				<td>12209</td>
				<td>Germany</td>
			</tr>
			<tr>
				<td class="user_id">3</td>
				<td>Fran Wilson</td>
				<td>C/ Araquil, 67</td>
				<td>Madrid</td>
				<td>28023</td>
				<td>Spain</td>
			</tr>
			<tr>
				<td class="user_id">4</td>
				<td>Dominique Perrier</td>
				<td>25, rue Lauriston</td>
				<td>Paris</td>
				<td>75016</td>
				<td>France</td>
			</tr>
			<tr>
				<td class="user_id">5</td>
				<td>Martin Blank</td>
				<td>Via Monte Bianco 34</td>
				<td>Turin</td>
				<td>10100</td>
				<td>Italy</td>
				
			</tr>
		</tbody>
	</table>
	<div class="clearfix">
		<div class="hint-text">
			Showing <b>5</b> out of <b>25</b> entries
		</div>
		<ul class="pagination">
			<li class="page-item disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
			<li class="page-item"><a href="#" class="page-link">1</a></li>
			<li class="page-item"><a href="#" class="page-link">2</a></li>
			<li class="page-item active"><a href="#" class="page-link">3</a></li>
			<li class="page-item"><a href="#" class="page-link">4</a></li>
			<li class="page-item"><a href="#" class="page-link">5</a></li>
			<li class="page-item"><a href="#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
		</ul>
	</div>
</div>

<script>
$(function() {
	var eachRowOfStudnet = $('tr');
	// 고객 이름 클릭 시,
	eachRowOfStudnet.each(function () {
		$(this).on('click',function(){
			var result = $(this).find('td.user_id');
			console.log(result);
			console.log(result[0].valueOf());
			console.log(result[0].toString());
		});
	});
});
</script>