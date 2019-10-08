-- -------------------------------------------------------------------
-- 사용자 테이블
-- -------------------------------------------------------------------
DESC users;
SELECT * FROM users;

-- 관리자 dummy (최소 정보 입력)
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('admin','123','0','원희재', '01074705604','gmlwo123@gmail.com','0',sysdate);

-- 직원 dummy (교수 3, 관리 1, 상담 1  / 2019 연 01 월 10 직원 구분(10 관리, 11 교수, 12 상담) 순번 3자리 )
-- 2019 01 10(11,12) 001
-- 2019 01 21(20) 001
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190111001','123','1','정교수','01065434567','wjdry123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190111002','123','1','이교수','01065412347','rutn123@gmail.com','0',sysdate);

insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values (4, '201902003','123','1','최교수','01076514567','chlry123@gmail.com','0',sysdate);

COMMIT;
insert into users values (users_seq.nextval, '201900001','123','1','김관리','rhksfl123@gmail.com');
insert into users values (users_seq.nextval, '201900002','123','1','정관리','jql123@gmail.com');
insert into users values (users_seq.nextval, '201901001','123','1','박상담','tkdeka123@gmail.com');
insert into users values (users_seq.nextval, '201901002','123','1','이상담','tkdeka123@gmail.com');

-- 학생 dummy( 15명 * 8개 반 + 취업반 10명 = 130) 
delete from users where user_id='20190121001';

insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121001','123','2','김학생','01000134567','dnlsel123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121002','123','2','이학생','01074414567','dPwjd123@gmail.com','0',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121003','123','2','문이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121004','123','2','가이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121005','123','2','박이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121006','123','2','원이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121007','123','2','선이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121008','123','2','제갈이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121009','123','2','조이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121010','123','2','정이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121011','123','2','변이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121012','123','2','홍이썬','01076455686','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121013','123','2','윤이썬','01075558667','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121014', '123','2','궉이썬','01036456867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121015','123','2','이이썬','01091532567','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190121016','123','2','최이썬','01012345867','raldl123@gmail.com','1',sysdate);

delete from users;

rollback;
COMMIT;

-- -------------------------------------------------------------------
-- 학생 테이블
-- -------------------------------------------------------------------
DESC student;
SELECT * FROM student;

insert into student (stu_id, stu_name, stu_birth, stu_phone, stu_email, stu_addr)
values (2, sysdate,'01077756452','asdk@gmail.com','인천시 미추홀구 숭의동');

COMMIT;

-- -------------------------------------------------------------------
-- 직원 테이블
-- -------------------------------------------------------------------
DESC employee;
SELECT * FROM employee;
-- emp_id : user_id
-- emp_rank : 1 사원 / 2 주임 / 3 대리 / 4 과장 / 5 차장 / 6 부장 / 7 수석 / 8 이사 / 9 사장
-- emp_type : 1 교수 / 2 관리 / 3 상담

insert into employee (emp_id, emp_rank, emp_salary, emp_type)
values ('20190111001', '3',40000000,'1');

COMMIT;

-- -------------------------------------------------------------------
-- 강의실 테이블
-- -------------------------------------------------------------------
DESC classroom;
SELECT * FROM classroom;

insert into classroom(clr_id, clr_name, clr_capa)
values('camp190801', '1강의실', 12);
insert into classroom(clr_id, clr_name, clr_capa)
values('camp190802', '2강의실', 12);
insert into classroom(clr_id, clr_name, clr_capa)
values('camp19080p', '프로젝트실', 8);

COMMIT;

-- -------------------------------------------------------------------
--  과목 정보 테이블
-- -------------------------------------------------------------------
DESC lecture;
SELECT * FROM lecture;

insert into lecture(lec_id, lec_name, lec_dis)
values('javafr0001', 'Java Frameworks', 'SI, ERP 및 CRM 프로그래밍 개발자나 웹 프로그래밍 개발자로의 취업 대비 강의');
insert into lecture(lec_id, lec_name, lec_dis)
values('design0001', '웹디자인(UI/UX)', '그래픽, 광고 등 일러스트와 포토샵 등을 활용한 웹디자인(UI/UX) 학습 강의');
insert into lecture(lec_id, lec_name, lec_dis)
values('datapy0001', '빅데이터 분석', '파이썬을 활용한 데이터 분석을 배우는 데이터 분석 입문 강의');
/*
update lecture
set lec_dis='SI, ERP 및 CRM 프로그래밍 개발자나 웹 프로그래밍 개발자로의 취업 대비 강의'
where lec_id='javafr0001';*/

rollback;

COMMIT;

-- -------------------------------------------------------------------
--  강의 테이블
-- -------------------------------------------------------------------
DESC teach_lecture;
SELECT * FROM teach_lecture;
-- tel_id : 개강 년 + 월 + 순번(4자리)
insert into teach_lecture(tel_id, emp_id, lec_id, clr_id, tel_enroll_date, tel_begin_date, tel_end_date, tel_curr)
values('2019080001', '20190111001','javafr0001','camp190801',TO_DATE('2019-10-06', 'yyyy-mm-dd'),TO_DATE('2019-10-06', 'yyyy-mm-dd'),TO_DATE('2019-10-06', 'yyyy-mm-dd'),
'{"1강" : "1강 배울 내용",
"2강" : "2강 배울 내용",
"3강" : "3강 배울 내용",
"4강" : "4강 배울 내용",
"5강" : "5강 배울 내용",
"6강" : "6강 배울 내용",
"7강" : "7강 배울 내용",
"8강" : "8강 배울 내용",
"9강" : "9강 배울 내용",
"10강" : "10강 배울 내용",
"11강" : "11강 배울 내용",
"12강" : "12강 배울 내용"}');

COMMIT;

-- -------------------------------------------------------------------
--  수강 테이블
-- -------------------------------------------------------------------

-- dummy data
insert into attend_lecture(atc_id, stu_id, lec_id)
values(attend_lecture_seq.nextval, 2, 1);

delete from attend_lecture;

COMMIT;


insert into lecture_qna(qna_id, lec_id, user_id, qna_title, qna_content, qna_created)
values(lecture_qna_seq.nextval, 1, 2, '자바 널과 0의 차이','널과 0의 차이가 뭔가요?',sysdate);

-- 2배로 게시물 삽입
insert into lecture_qna(qna_id, lec_id, user_id, qna_title, qna_content, qna_created)
select lecture_qna_seq.nextval, lec_id, user_id, qna_title, qna_content, qna_created from lecture_qna;

COMMIT;
