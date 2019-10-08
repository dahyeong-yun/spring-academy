<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ui.jqgrid.css">
</head>
<body>
	<div class="content container-fluid">
		<div class="row">
			<div class="col-md-9">
				<!-- JQ그리드 시작 -->
				<table id="jqGrid"></table>
				<div id="jqGridPager"></div>
				<!-- JQ그리드 끝 -->
			</div>
		</div>
	</div>
	<!-- 스크립트 시작 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/i18n/grid.locale-kr.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.jqGrid.min.js"></script>
	<script src="https://kit.fontawesome.com/d76d3d7057.js" crossorigin="anonymous"></script>
	<script>
		// mbrList, athrList, mbrId, mbrPh, mbrNm 저장변수
		var mbrList;
		var athrList;

		// jqgrid 생성
		$(document).ready(function() {
			var rowNum = 100;
			$("#jqGrid").jqGrid({
				url : "refreshList",
				mtype : "GET",
				datatype : "json",
				colModel : [ {
					label : '권한번호',
					name : 'athrNo',
					key : true,
					width : 75,
					editable : true,
					editoptions : {
						readonly : true
					}
				}, {
					label : '권한명',
					name : 'athrNm',
					width : 150,
					editable : true
				}, {
					label : '권한 설명',
					name : 'athrExpl',
					width : 150,
					editable : true
				}, {
					label : '권한  등급',
					name : 'athrGrde',
					width : 150,
					editable : true
				}, {
					label : '권한등록일자',
					name : 'athrRegiDate',
					width : 150,
					search : false,
					sortable : false,
					formatter : "date",
					formatoptions : {
						srcformat : 'U/1000',
						newformat : 'Y/m/d H:i:A'
					}
				} ],
				viewrecords : true,
				height : 700,
				autowidth : true,
				rowNum : rowNum,
				rowList : [ 100, 200, 300, 400, 500 ],
				pager : "#jqGridPager",
				caption : "권한관리",
				loadonce : false,
				onCellSelect : function(rowid, iCol) {
				}
			});
			
			// jqgrid 네비게이션 옵션 설정
			$("#jqGrid").jqGrid('navGrid', '#jqGridPager', {
				edit : true,
				add : true,
				del : true,
				search : true,
				refreshtext : "새로고침",
				searchtext : "조회",
				edittext : "수정",
				addtext : "신규",
				deltext : "삭제"
			}, {
				url : "update",
				mtype : "POST",
				recreateForm : true,
				closeAfterEdit : true,
				editData : {
					athrNo : function() {
						return $('#athrNo').val();
					},
					athrNm : function() {
						return $('#athrNm').val();
					},
					athrExpl : function() {
						return $('#athrExpl').val();
					},
					athrGrde : function() {
						return $('#athrGrde').val();
					}
				},
				beforeShowForm : function() {
					console.log("beforeShowForm");
					$("#athrNm").attr("placeholder", "영문, 한글, 숫자 3~30자");
					$("#athrExpl").attr("placeholder", "500자 이내");
					$("#athrGrde").attr("placeholder", "숫자 0~99까지");
					$("#athrNm").attr("pattern", "^[a-zA-Z0-9가-힣]{3,30}").attr("required", true);
					$("#athrExpl").attr("pattern", "^.{0,500}$").attr("required", true);
					$("#athrGrde").attr("pattern", "^[0-9]{2}").attr("required", true);
					$("#FrmGrid_jqGrid").append("<button type='submit' id='jqgrid_submit_btn' style='visibility : hidden;' />");
				},
				beforeSubmit : function() {
					console.log("beforeSubmit");
					$("#jqgrid_submit_btn").trigger("click");
					
					if (!document.getElementById('athrNm').validity.valid)
						return [ false, "" ];
					if (!document.getElementById('athrExpl').validity.valid)
						return [ false, "" ];
					if (!document.getElementById('athrGrde').validity.valid)
						return [ false, "" ];
					return [ true, "" ];
				},
				errorTextFormat : function(data) {
					return 'Error: ' + data.resultMsg;
				}
			}, {
				url : "register",
				mtype : "POST",
				closeAfterAdd : true,
				editData : {
					athrNo : "-1",
					athrNm : function() {
						return $('#athrNm').val();
					},
					athrExpl : function() {
						return $('#athrExpl').val();
					},
					athrGrde : function() {
						return $('#athrGrde').val();
					}
				},
				beforeShowForm : function() {
					console.log("beforeShowForm");
					$("#athrNo").attr("placeholder", "미입력항목");
					$("#athrNm").attr("placeholder", "영문, 한글, 숫자 3~30자");
					$("#athrExpl").attr("placeholder", "500자 이내");
					$("#athrGrde").attr("placeholder", "숫자 0~99까지");
					$("#athrNm").attr("pattern", "^[a-zA-Z0-9가-힣]{3,30}").attr("required", true);
					$("#athrExpl").attr("pattern", "^.{0,500}$").attr("required", true);
					$("#athrGrde").attr("pattern", "^[0-9]{2}").attr("required", true);
					$("#FrmGrid_jqGrid").append("<button type='submit' id='jqgrid_submit_btn' style='visibility : hidden;' />");
				},
				beforeSubmit : function() {
					console.log("beforeSubmit");
					$("#jqgrid_submit_btn").trigger("click");

					console.log(!document.getElementById('athrNm').validity.valid);
					console.log(!document.getElementById('athrExpl').validity.valid);
					console.log(!document.getElementById('athrGrde').validity.valid);
					if (!document.getElementById('athrNm').validity.valid)
						return [ false, "" ];
					if (!document.getElementById('athrExpl').validity.valid)
						return [ false, "" ];
					if (!document.getElementById('athrGrde').validity.valid)
						return [ false, "" ];
					console.log("test");
					return [ true, "" ];
				},
				errorTextFormat : function(data) {
					return 'Error: ' + data.resultMsg;
				}
			}, {
				url : "delete",
				mtype : "POST",
				delData : {
					athrNo : function(rowid, iCol) {
						var selId = $('#jqGrid').jqGrid('getGridParam', 'selrow');
						var athrNo = $('#jqGrid').jqGrid('getCell', selId, 'athrNo');
						return athrNo;
					},
				}
			});
		});

		function replacePw() {
			window.location = "/project/member/replacePw?mbrId=" + mbrId + "&mbrNm=" + mbrNm + "&mbrPh=" + mbrPh + "&goback=y";
		};
		function replaceBtn() {
			return '<a href="javascript:replacePw()"><i class="far fa-edit fa-2x"></i></a>';
		};

		function jqgridFormValidate() {
			console.log("check");
			return false;
		}
	</script>
	<!-- 스크립트 끝 -->
</body>
</html>