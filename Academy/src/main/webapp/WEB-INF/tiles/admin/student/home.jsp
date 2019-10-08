<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- admin/student/home -->
<table id="student_list"></table>
<div id="pager"></div>
<script>
$(function() {
	// jqgrid
	$("#student_list").jqGrid({
		url:'/admin/student/getList',
		datatype: "json",
		height : 225,
		width : 900,
		colNames:['아이디','이름', '전화번호', '이메일','주소','성별','가입일'],
		colModel:[
			{name:'user_id', align:"center", width:80, editable:true, editoptions : {readonly : true}, key : true},
			{name:'user_name', align:"center", width:50, editable:true},
			{name:'user_phone', align:"center", width:50, editable:true},		
			{name:'user_email', align:"center", width:90, editable:true},		
			{name:'user_address', editable:true},
			{name:'user_gender', align:"center", width:30 , editable:true},
			{name:'user_join', align:"center", width:90, editable:true, editoptions : {readonly : true}
			}
		],
		rowNum:10,
		rowList:[10,20,30],
		pager: '#pager',
		viewrecords: true,
		sortorder: "desc",
		caption:"학생 리스트",
		onCellSelect : function(rowid, iCol){
			console.log(rowid + " : " + iCol);
			console.log($('#user_id').val());
			console.log($('#jqGrid').jqGrid('getRowData', rowid));
		}
	});
	
	// pagination
	$("#student_list").jqGrid('navGrid','#pager',{
			edit:true,
			add:false,
			del:true
		}, {
			url : "/admin/student/update",
			mtype : "POST",
			recreateForm : true,
			closeAfterEdit : true,
			editData : {
				user_id : function() {
					return $('#user_id').val();
				},
				user_name : function() {
					return $('#user_name').val();
				},
				user_phone : function() {
					return $('#user_phone').val();
				},
				user_email : function() {
					return $('#user_email').val();
				},
				user_address : function() {
					return $('#user_address').val();
				},
				user_gender : function() {
					return $('#user_gender').val();
				}
			}
		}, {
			url : "/admin/student/add",
			mtype : "POST",
			addData : {
			}
		}, {
			url : "/admin/student/suspend",
			mtype : "POST",
			delData : {
				user_id : function(rowid, iCol) {
					var selId = $('#student_list').jqGrid('getGridParam', 'selrow');
					var user_id = $('#student_list').jqGrid('getCell', selId, 'user_id');
					return user_id;
				}
			}
		}
	);
});
</script>