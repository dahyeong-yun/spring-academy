-- 회원 정보 수정
UPDATE
    users
SET
    user_password = '222',
    user_name = '정진아',
    user_email = 'wlsdk123@naver.com',
    user_phone = '01065421879',
    user_birth = sysdate,
    user_address = '인천시',
    user_gender = 1
WHERE 
    user_id = '20190111001';
    
commit;
