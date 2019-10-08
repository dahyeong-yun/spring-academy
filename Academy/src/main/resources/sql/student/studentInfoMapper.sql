-- 회원 정보 수정
UPDATE
    users
SET
    user_password = '222',
    user_name = '정진아',
    user_email = 'wlsdk123@naver.com',
    user_phone = '01065421879',
    user_address = '인천시',
    user_gender = 1
WHERE 
    user_id = '20190111001';
    
DESC users;

-- 회원 탈퇴
UPDATE
    users
SET
    user_password = '1',
    user_suspended = '1',
    user_name = 'suspended',
    user_email = 'suspended',
    user_phone = 'suspended',
    user_address = 'suspended',
    user_gender = '1'
WHERE 
    user_id = '20190121002';

commit;
