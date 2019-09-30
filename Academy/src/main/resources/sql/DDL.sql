-- -------------------------------------------------------------------
-- 사용자 테이블
-- -------------------------------------------------------------------
create table users(
    user_id int primary key,
    user_login_id varchar2(20) not null unique,
    user_password varchar2(20) not null,
    user_type char(1) not null, -- 0:관리자, 1:직원, 2:학생, 3: 잠재 고객
    user_name varchar2(13),
    user_email varchar2(100)
);
drop table users;

create sequence users_seq;
drop sequence users_seq; 

select * from users;
desc users;

-- alter table users add(user_name varchar2(13));
-- alter table users add(user_email varchar2(100));
-- 초기 비밀번호
-- 비밀번호 변경 여부
-- 가입일자
-- 정지 여부

-- 관리자 dummy
insert into users values (users_seq.nextval, 'admin','123','0','원희재','gmlwo123@gmail.com');

-- 직원 dummy
insert into users values (users_seq.nextval, '201900001','123','1','김관리','rhksfl123@gmail.com');
insert into users values (users_seq.nextval, '201901002','123','1','박상담','tkdeka123@gmail.com');

insert into users values (users_seq.nextval, '201902003','123','1','이교수','rutn123@gmail.com');
insert into users values (users_seq.nextval, '201900004','123','1','정관리','jql123@gmail.com');
insert into users values (users_seq.nextval, '201902005','123','1','정교수','wjdry123@gmail.com');

-- 학생 dummy
insert into users values (users_seq.nextval, '20190001','123','2','김명성','audtjd123@gmail.com');
insert into users values (3, '20190001','123','2','김명성','audtjd123@gmail.com');
insert into users values (4, '20190002','123','2','김자바','rlawk123@gmail.com');
insert into users values (5, '20190003','123','2','이자바','dlwk123@gmail.com');

delete from users;

rollback;
commit;


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

alter table student drop column stu_name;

create sequence student_seq;
drop sequence student_seq;

select * from student;
desc student;

-- 외래키 제약 추가
alter table student
add constraint fk_student_stu_id
foreign key(stu_id) references users(user_id);

alter table student
drop constraint fk_student_stu_id;

-- dummy data
insert into student (stu_id, stu_name, stu_birth, stu_phone, stu_email, stu_addr)
values (2, sysdate,'01077756452','asdk@gmail.com','인천시 미추홀구 숭의동');

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

-- dummy data
insert into classroom(clr_id, clr_name, clr_capa)
values(classroom_seq.nextval, '1강의실', 12);
insert into classroom(clr_id, clr_name, clr_capa)
values(classroom_seq.nextval, '프로젝트실', 8);

commit;

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

-- dummy data
insert into lecture(lec_id, lec_name, lec_dis, clr_id)
values(lecture_seq.nextval, 'Java 취업 준비반', '2개월 안에 취업 가능한 수준의 자바 실력을 갖출 수 있는 강의',1);
/*update lecture set lec_dis = '2개월 안에 취업 가능한 수준의 자바 실력을 갖출 수 있는 강의'
where lec_id=1;*/

commit;

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

-- dummy data
insert into attend_lecture(atc_id, stu_id, lec_id)
values(attend_lecture_seq.nextval, 2, 1);

delete from attend_lecture;

commit;

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

insert into lecture_qna(qna_id, lec_id, user_id, qna_title, qna_content, qna_created)
values(lecture_qna_seq.nextval, 1, 2, '자바 널과 0의 차이','널과 0의 차이가 뭔가요?',sysdate);

-- 2배로 게시물 삽입
insert into lecture_qna(qna_id, lec_id, user_id, qna_title, qna_content, qna_created)
select lecture_qna_seq.nextval, lec_id, user_id, qna_title, qna_content, qna_created from lecture_qna;

commit;

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

