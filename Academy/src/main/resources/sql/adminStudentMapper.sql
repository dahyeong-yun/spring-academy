SELECT
    user_id,
    user_login_id,
    user_password,
    user_type,
    user_suspended,
    user_name,
    user_phone,
    user_email,
    user_birth,
    user_address,
    user_gender,
    user_join_date
FROM (SELECT
        users.user_id,
        users.user_login_id,
        users.user_password,
        users.user_type,
        users.user_suspended,
        users.user_name,
        users.user_phone,
        users.user_email,
        users.user_birth,
        users.user_address,
        users.user_gender,
        users.user_join_date,
        row_number() over(order by user_id asc) as row_num
    FROM
        users
    WHERE
        users.user_type = 2
        AND users.user_suspended = 0)
WHERE
    row_num BETWEEN 1 AND 10;
        -- between 시작 수 and 끝 수 10차이,
        -- 페이지 정보가 있을 경우 전체 갯수를 row 수로 나눈 몫의 올림이 전체 페이지 갯 수


SELECT COUNT(user_id)
FROM users
where users.user_type = 2
AND users.user_suspended = 0;