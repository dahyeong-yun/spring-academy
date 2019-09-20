-- ·Î±×ÀÎ
select user_id, user_login_id, user_password, user_type
from users
where user_login_id = #{user_login_id}