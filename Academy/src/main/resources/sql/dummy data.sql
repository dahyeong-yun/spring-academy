-- -------------------------------------------------------------------
-- 사용자 테이블
-- -------------------------------------------------------------------
-- 관리자 dummy (최소 정보 입력)
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('admin','123','0','원희재', '01074705604','gmlwo123@gmail.com','0',sysdate);

-- 직원 dummy (교수 3, 관리 1, 상담 1  / 2019 연 01 월 10 직원 구분(10 교수, 11 관리, 12 상담) 순번 3자리 )
insert into users (user_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join)
values ('20190111001','123','1','정교수','01065434567','wjdry123@gmail.com','1',sysdate);


insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '201902002','123','1','이교수','01065412347','rutn123@gmail.com','0',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (4, '201902003','123','1','최교수','01076514567','chlry123@gmail.com','0',sysdate);
--delete from users where user_login_id='201902003';
commit;

insert into users values (users_seq.nextval, '201900001','123','1','김관리','rhksfl123@gmail.com');
insert into users values (users_seq.nextval, '201900002','123','1','정관리','jql123@gmail.com');
insert into users values (users_seq.nextval, '201901001','123','1','박상담','tkdeka123@gmail.com');
insert into users values (users_seq.nextval, '201901002','123','1','이상담','tkdeka123@gmail.com');

-- 학생 dummy( 15명 * 8개 반 + 취업반 10명 = 130) 
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190001','123','2','김이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190002','123','2','문이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190003','123','2','가이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190004','123','2','박이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190005','123','2','원이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190006','123','2','선이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190007','123','2','제갈이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190008','123','2','조이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190009','123','2','정이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190010','123','2','변이썬','01076345867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190011','123','2','홍이썬','01076455686','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190012','123','2','윤이썬','01075558667','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190013','123','2','궉이썬','01036456867','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190014','123','2','이이썬','01091532567','raldl123@gmail.com','1',sysdate);
insert into users (user_id, user_login_id, user_password, user_type, user_name, user_phone, user_email, user_gender, user_join_date)
values (users_seq.nextval, '20190015','123','2','최이썬','01012345867','raldl123@gmail.com','1',sysdate);

delete from users;

rollback;
commit;
-- -------------------------------------------------------------------
-- 학생 테이블
-- -------------------------------------------------------------------


-- dummy data
insert into student (stu_id, stu_name, stu_birth, stu_phone, stu_email, stu_addr)
values (2, sysdate,'01077756452','asdk@gmail.com','인천시 미추홀구 숭의동');


-- dummy data
insert into classroom(clr_id, clr_name, clr_capa)
values(classroom_seq.nextval, '1강의실', 12);
insert into classroom(clr_id, clr_name, clr_capa)
values(classroom_seq.nextval, '프로젝트실', 8);

commit;

-- dummy data
insert into lecture(lec_id, lec_name, lec_dis, clr_id)
values(lecture_seq.nextval, 'Java 취업 준비반', '2개월 안에 취업 가능한 수준의 자바 실력을 갖출 수 있는 강의',1);
/*update lecture set lec_dis = '2개월 안에 취업 가능한 수준의 자바 실력을 갖출 수 있는 강의'
where lec_id=1;*/

commit;


-- dummy data
insert into attend_lecture(atc_id, stu_id, lec_id)
values(attend_lecture_seq.nextval, 2, 1);

delete from attend_lecture;

commit;


insert into lecture_qna(qna_id, lec_id, user_id, qna_title, qna_content, qna_created)
values(lecture_qna_seq.nextval, 1, 2, '자바 널과 0의 차이','널과 0의 차이가 뭔가요?',sysdate);

-- 2배로 게시물 삽입
insert into lecture_qna(qna_id, lec_id, user_id, qna_title, qna_content, qna_created)
select lecture_qna_seq.nextval, lec_id, user_id, qna_title, qna_content, qna_created from lecture_qna;

commit;
