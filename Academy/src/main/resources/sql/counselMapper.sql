-- 전체 사용자 리스트
select user_id, user_type, user_name, user_email
from users;

-- 잠재 고객 등록
insert into counsel_lecture(cns_id, user_id, emp_id, cns_root, lec_id, cns_content, cns_created, cns_followup, cns_interest)
values(counsel_lecture_seq.nextval, null, 43, 2, null, '그냥 전화해봄', sysdate, '0', '해당 없음');

rollback;
