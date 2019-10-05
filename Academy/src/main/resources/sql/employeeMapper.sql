-- 전체 직원 리스트
select 
    user_id, user_login_id, user_password, user_type, user_suspended, user_name, user_email,
	user_birth,	user_address, user_gender, user_join_date
from users
where
    user_type <> 0
    and user_suspended = 0;
