-- 학생 전체 리스트
SELECT
    user_id,
    user_password,
    user_type,
    user_suspended,
    user_name,
    user_phone,
    user_email,
    user_address,
    user_gender,
    user_join
FROM (SELECT
        users.user_id,
        users.user_password,
        users.user_type,
        users.user_suspended,
        users.user_name,
        users.user_phone,
        users.user_email,
        users.user_address,
        users.user_gender,
        TO_CHAR(users.user_join, 'YYYY-MM-DD') as user_join,
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


-- 학생 전체 수
SELECT
    COUNT(user_id)
FROM
    users
where
    users.user_type = 2
    AND users.user_suspended = 0;

-- 학생 정보 업데이트
UPDATE
    users
SET
    user_name = '원형우',
    user_phone = '01045556398',
    user_email = '21guddn@naver.com',
    user_address = '서울시 중구',
    user_gender = '1'
WHERE
    user_id = '20190121006';

-- 학생 계정 정지
UPDATE
    users
SET
    user_suspended = '1',
    user_name = 'suspended',
    user_email = 'suspended',
    user_phone = 'suspended',
    user_address = 'suspended',
    user_gender = '1'
WHERE 
    user_id = '20190121006';

-- 학생 아이디 순번 받아오기
SELECT
	    LPAD(TO_CHAR(orderNum),3,'0')
FROM
   (SELECT
        MAX(TO_NUMBER(SUBSTR(users.user_id,9,3)))+1 as orderNum
    FROM
        users
    WHERE
        users.user_type = 2
        and SUBSTR(user_id,7,2)= '21');

rollback;