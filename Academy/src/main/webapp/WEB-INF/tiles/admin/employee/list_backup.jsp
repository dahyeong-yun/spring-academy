<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h4>직원 관리</h4>
<div class="row" id="searchBar">
    <div class="col-2">
        <select class="form-control form-control-sm">
            <option>이름</option>
            <option>이메일</option>
            <option>번호</option>
        </select>
    </div>

    <div class="col-9">
        <input class="form-control form-control-sm" type="text" name="keyword" placeholder="검색어를 입력하세요.">
    </div>

    <div class="col-1">
        <button type="button" class="btn btn-success btn-sm searchEmpList">검색</button>
    </div>
</div>

<div class="mt-4">
    <table id="employee_list"></table>
</div>

<hr class="my-4">
<h4>직원 등록</h4>
아이디 생성 조건 : 올해 연도 + 관리00/상담01/교수02 + 마지막 사번 +1<br>
초기 비밀번호 123<br>
필수 입력값<br>
아이디(자동 생성)
비밀번호
(사용자 유형은 1로 고정 입력)
이름
전화번호
이메일
성별
입사일(미입력시 sysdate)

<!-- The Modal -->
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
                    <div class="row">
                        <div class="col">
                            <label for="user_name">이름</label>
                            <input class="form-control form-control-sm" id="user_name" type="text">
                        </div>
                        <div class="col">
                            <label for="user_login_id">아이디</label>
                            <input class="form-control form-control-sm" id="user_login_id" type="text" disabled="disabled">
                        </div>
                    </div>

                    <label>이메일</label>
                    <label>전화번호</label>
                    <label>생일</label>
                    <label>주소</label>
                    <label>성별</label>
                    <label>입사일</label>
                </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">수정</button>
                <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">삭제</button>
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        // 테이블 그리기
        function empTable(id, array) {
            $("#" + id).jqGrid({
                datatype: "local",
                height: 100,
                width: 950,
                colNames: ['직원명', '아이디', '이메일', '생일', '주소', '성별', '입사일'],
                colModel: [
                	{name: 'user_name', align: 'center', key: "true"},
                    {name: 'user_login_id', align: 'center'},
                    {name: 'user_email', align: 'center'},
                    {name: 'user_birth', align: 'center'},
                    {name: 'user_address', align: 'center'},
                    {name: 'user_gender', align: 'center'},
                    {name: 'user_join_date', align: 'center'}
                ],
                autowidth: true,
                caption: "직원 리스트"
            });

            for (var i in array) {
                $("#" + id).jqGrid('addRowData', i + 1, array[i]);
            }
        }

        // 그리드 반응형
        $(window).on('resize.jqGrid', function() {
                jQuery("#employee_list").jqGrid('setGridWidth',
                    $("#content").width());
        });

        // 그리드 데이터 불러오기(동기식)
        var empList = null;
        $.ajax({
            url: "/admin/employee/list",
            type: "post",
            async: false,
            success: function(result) {
                empList = result;
                //$("employee_list").remove(); // element 있으면 삭제
                $("employee_list").jqGrid('clearGridData');
                empTable("employee_list", empList);
            }
        });

        // 검색
        $(".searchEmpList").click(function() {
            var searchInfo = {
                /*
                검색 타입 : 
                검색어 : 
                 */
            };
            $.ajax({
                url: "/admin/employee/search",
                data: searchInfo,
                type: "post",
                success: function(result) {
                    $("#employee_list").jqGrid("clearGridData", true); // 행 전체 지우기
                    empList = result;
                    empTable("employee_list", empList);
                }
            });

            empTable("employee_list", empList);
        });

        // 회원 정보 모달
        var $eachRowOfEmployee = $('tr[role="row"]');
        $eachRowOfEmployee.on("click", function() {
            // 정보 넣기
            var $user_name = $(this).find("td[aria-describedby='employee_list_user_name']").attr('title');
            $("#user_name").val($user_name);

            var $user_login_id = $(this).find("td[aria-describedby='employee_list_user_login_id']").attr('title');
            $("#user_login_id").val($user_login_id);


            // 모달 표시
            $('#empInfoForm').modal('show');
        });
    });

</script>
