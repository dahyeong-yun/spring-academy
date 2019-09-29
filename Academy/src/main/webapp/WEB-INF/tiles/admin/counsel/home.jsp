<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 본문 컨텐츠 -->
상담 관리

<button class="btn btn-primary btn-sm">검색</button>
<div>
	<table id="table1"></table>
</div>


<script>
	$(function(){
		var dataArray = [
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"},
				{'fOcurDtmc' : '1','spd':"1",'rpm':"1",'brkYn':"1",'status':"1"}
			];
		
		function makeTable(id, array) {
			$("#" + id).jqGrid({
				datatype : "local",
				height : 250,
				width : 900,
				colNames : [ '일시', '속도', 'RPM', '브레이크', '상태' ],
				colModel : [ {
					name : 'fOcurDtmc',
					align : 'right'
				}, {
					name : 'spd',
					align : 'right'
				}, {
					name : 'rpm',
					align : 'right'
				}, {
					name : 'brkYn',
					align : 'right'
				}, {
					name : 'status',
					align : 'right'
				} ],
				caption : "상담 리스트"
			});

			for (var i in array) {
				$("#" + id).jqGrid('addRowData', i + 1, array[i]);
				console.log(i);
			}
		}
		makeTable('table1', dataArray);
	});
	
</script>