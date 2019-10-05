-- 로그인
SELECT
    user_id, user_password, user_type, user_suspended, user_name,
    user_email, user_phone, user_birth, user_address, user_gender, user_join_date
FROM
    users
WHERE 
    user_suspended = '0'
    AND user_id = 'admin';

-- 수강 과목 리스트
select s.stu_id, s.stu_name, l.lec_id, l.lec_name
from attend_lecture a
join student s
on s.stu_id = a.stu_id
join lecture l
on l.lec_id = a.lec_id
where s.stu_id = 2;
