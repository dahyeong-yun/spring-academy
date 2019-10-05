-- -------------------------------------------------------------------
-- 사용자 테이블
-- -------------------------------------------------------------------
create table users(
    user_id varchar2(11) primary key, -- 2019 01 00(10,11,12 / 20,21 잠재 고객) 11자리 숫자
    user_password varchar2(20) NULL, -- 잠재 고객을 만들어야 해서 null 가능
    user_type char(1) NOT NULL, -- 0 : 관리자 / 1 : 직원 / 2 : 학생 / 3 : 잠재고객
    user_suspended char(1) DEFAULT 0 NOT NULL, -- 0 : 활성 / 1 : 정지
	user_name varchar2(20) NOT NULL,
	user_phone varchar2(11) NOT NULL, -- 최대 11자리 숫자 3+4+4
	user_email varchar2(50) NOT NULL, -- 
	user_address varchar2(200)	NULL,
	user_gender char(1)	NOT NULL,  -- 0 : 남 / 1 : 여'
	user_join_date date DEFAULT sysdate
);
drop table users;
commit;

select * from users;
desc users;

-- alter table users add(user_name varchar2(13));
-- alter table users add(user_email varchar2(100));
-- alter table users drop column user_birth;
-- 초기 비밀번호
-- 비밀번호 변경 여부
-- 가입일자
-- 정지 여부



-- -------------------------------------------------------------------
-- 학생 테이블
-- -------------------------------------------------------------------
create table student (
	stu_id int primary key,
    stu_birth date null,
    stu_phone varchar2(20) not null,
    stu_email varchar2(100) not null,
    stu_addr varchar2(100) null
);
drop table student;
/*
alter table student drop column stu_name;

create sequence student_seq;
drop sequence student_seq;
*/
select * from student;
desc student;

-- 외래키 제약 추가
alter table student
add constraint fk_student_stu_id
foreign key(stu_id) references users(user_id);

alter table student
drop constraint fk_student_stu_id;


delete from student;

commit;

-- -------------------------------------------------------------------
-- 강의실 테이블
-- -------------------------------------------------------------------
create table classroom (
    clr_id int primary key,
    clr_name varchar2(20),
    clr_capa int
);
drop table classroom;

create sequence classroom_seq;
drop sequence classroom_seq;

select * from classroom;
desc classroom;


-- -------------------------------------------------------------------
-- 과목 정보 테이블
-- -------------------------------------------------------------------
create table lecture (
    lec_id int primary key,
    lec_name varchar2(50),
    lec_dis varchar(300),
    clr_id int
);
drop table lecture;

create sequence lecture_seq;
drop sequence lecture_seq;

select * from lecture;
desc lecture;

-- 외래키 제약 추가
alter table lecture
add constraint fk_lecture_clr_id
foreign key(clr_id) references classroom(clr_id);

alter table lecture
drop constraint fk_lecture_clr_id;

-- alter table lecture add(lec_dis varchar2(300));


-- -------------------------------------------------------------------
-- 수강 테이블 ; 학생의 수강 정보
-- -------------------------------------------------------------------
create table attend_lecture(
    atc_id int primary key,
    stu_id int,
    lec_id int
);
drop table attend_lecture;

create sequence attend_lecture_seq;
drop sequence attend_lecture_seq;

select * from attend_lecture;
desc attend_lecture;

-- 외래키 제약 추가
alter table attend_lecture
add constraint fk_attend_lecture_stu_id
foreign key(stu_id) references student(stu_id);

alter table attend_lecture
drop constraint attend_lecture_stu_id_fk;


-- -------------------------------------------------------------------
-- 질문 게시판
-- -------------------------------------------------------------------
create table lecture_qna(
    qna_id int primary key,
    lec_id int,
    user_id int,
    qna_title varchar(60),
    qna_content varchar(3000),
    qna_created date,
    qna_updated date
);
drop table lecture_qna;

create sequence lecture_qna_seq;
drop sequence lecture_qna_seq;

select * from lecture_qna;
desc lecture_qna;

-- -------------------------------------------------------------------
-- 상담 정보
-- -------------------------------------------------------------------
create table counsel_lecture(
    cns_id int not null,-- 상담 식별자
    user_id int, -- 상담 고객(null은 잠재 고객)
    emp_id int not null, -- 상담 직원
    cns_root int, -- 1: 전단지, 2: 광고
    lec_id int, -- 관심 강의(다중값 원하면?)
    cns_content varchar(3000),
    cns_created date not null,
    cns_updated date,
    cns_followup char(1) not null,
    cns_interest varchar(200) -- 일단은 텍스트로
);
drop table counsel_lecture;

create sequence counsel_lecture_seq;
drop sequence counsel_lecture_seq; 

select * from counsel_lecture;
desc counsel_lecture;

-- 기본키
alter table counsel_lecture
add constraint pk_counsel_lecture_cns_id
primary key(cns_id);

alter table counsel_lecture
drop constraint pk_counsel_lecture_cns_id;

-- 외래키 제약 추가
-- 상담 고객 제약
alter table counsel_lecture
add constraint fk_counsel_lecture_user_id
foreign key(user_id) references users(user_id);

alter table counsel_lecture
drop constraint fk_counsel_lecture_user_id;

-- 상담 직원 제약
/*alter table counsel_lecture
add constraint fk_counsel_lecture_user_id
foreign key(user_id) references users(user_id);*/

alter table counsel_lecture
add constraint fk_counsel_lecture_lec_id
foreign key(lec_id) references lecture(lec_id);

commit;