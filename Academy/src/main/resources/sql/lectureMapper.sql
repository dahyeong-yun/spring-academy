-- 강의 아이디로 강의 정보 찾기
select lec_id, lec_name, clr_id
from lecture
where lec_id=1;

-- 수강 과목의 질문 게시물 리스트
select qna_id, lec_id, user_id, user_name, qna_title, qna_content, qna_created, qna_updated
from
    (select q.qna_id, q.lec_id, q.user_id, u.user_name, q.qna_title, q.qna_content, q.qna_created, q.qna_updated,
     row_number() over(order by q.qna_id desc) as row_num
     from lecture_qna q
     join users u
     on q.user_id = u.user_id
     where lec_id = 1)
where row_num between 1 and 10
order by qna_id desc;

-- 게시판 별 게시물 전체 갯 수
select count(qna_id)
from lecture_qna
where qna_id > 0
and lec_id = 1;

