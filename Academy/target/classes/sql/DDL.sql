-- -------------------------------------------------------------------
-- 사용자 테이블
-- -------------------------------------------------------------------
CREATE TABLE users(
    user_id VARCHAR2(11) NOT NULL, -- 2019 01 00(10,11,12 / 20,21 잠재 고객) 11자리 숫자
    user_password VARCHAR2(20) NULL, -- 잠재 고객을 만들어야 해서 null 가능
    user_type CHAR(1) NOT NULL, -- 0 : 관리자 / 1 : 직원 / 2 : 학생 / 3 : 잠재고객
    user_suspended CHAR(1) DEFAULT 0 NOT NULL, -- 0 : 활성 / 1 : 정지
	user_name VARCHAR2(20) NOT NULL,
	user_phone VARCHAR2(11) NOT NULL, -- 최대 11자리 숫자 3+4+4
	user_email VARCHAR2(50) NOT NULL, -- 
	user_address VARCHAR2(200)	NULL,
	user_gender CHAR(1)	NOT NULL,  -- 0 : 남 / 1 : 여'
	user_join DATE NOT NULL
);
DROP TABLE users;
SELECT * FROM users;
DESC users;

-- 기본키 설정
ALTER TABLE users
ADD CONSTRAINT pk_users
PRIMARY KEY(user_id);

ALTER TABLE users DROP CONSTRAINT pk_users;

COMMIT;

-- -------------------------------------------------------------------
-- 학생 테이블
-- -------------------------------------------------------------------
CREATE TABLE student (
	stu_id VARCHAR2(11)NOT NULL,
    stu_type CHAR(1) NOT NULL
);
DROP TABLE student;
SELECT * FROM student;
DESC student;

-- 기본키 설정
ALTER TABLE student
ADD CONSTRAINT pk_student
PRIMARY KEY(stu_id);

ALTER TABLE student DROP CONSTRAINT pk_student;

/* 외래키 제약 추가
alter table student
add constraint fk_student_stu_id
foreign key(stu_id) references users(user_id);

alter table student
drop constraint fk_student_stu_id;
*/

COMMIT;

-- -------------------------------------------------------------------
-- 직원 테이블
-- -------------------------------------------------------------------
CREATE TABLE employee (
	emp_id VARCHAR2(11) NOT NULL,
    emp_rank CHAR(1) NOT NULL,
    emp_salary NUMBER(9) NOT NULL,
    emp_type CHAR(1) NOT NULL
);
DROP TABLE employee;
SELECT * FROM employee;
DESC employee;

-- 기본키 설정
ALTER TABLE employee
ADD CONSTRAINT pk_employee
PRIMARY KEY(emp_id);

ALTER TABLE employee DROP CONSTRAINT pk_employee;

COMMIT;

-- -------------------------------------------------------------------
-- 강의실 테이블
-- -------------------------------------------------------------------
CREATE TABLE classroom (
    clr_id VARCHAR2(10) NOT NULL,
    clr_name VARCHAR2(20) NOT NULL,
    clr_capa NUMBER(3) NOT NULL
);
DROP TABLE classroom;
SELECT * FROM classroom;
DESC classroom;

-- 기본키 설정
ALTER TABLE classroom
ADD CONSTRAINT pk_classroom
PRIMARY KEY(clr_id);

ALTER TABLE classroom DROP CONSTRAINT pk_classroom;

COMMIT;

-- -------------------------------------------------------------------
-- 과목 정보 테이블
-- -------------------------------------------------------------------
CREATE TABLE lecture (
    lec_id  VARCHAR2(11) NOT NULL,
    lec_name VARCHAR2(20) NOT NULL,
    clr_id VARCHAR2(10) NOT NULL,
    lec_dis VARCHAR2(200) NOT NULL
);
DROP TABLE lecture;
SELECT * FROM lecture;
DESC lecture;

-- 기본키 설정
ALTER TABLE lecture
ADD CONSTRAINT pk_lecture
PRIMARY KEY(lec_id);

ALTER TABLE lecture DROP CONSTRAINT pk_lecture;
/*
-- 외래키 제약 추가
ALTER TABLE lecture
ADD CONSTRAINT fk_lecture_clr_id
FOREIGN KEY(clr_id) REFERENCES classroom(clr_id);

alter table lecture
drop constraint fk_lecture_clr_id;
*/

COMMIT;

-- -------------------------------------------------------------------
-- 강의 테이블 ; 직원의 강의 정보
-- -------------------------------------------------------------------
CREATE TABLE teach_lecture (
    tel_id  VARCHAR2(10) NOT NULL,
    emp_id  VARCHAR2(11) NOT NULL,
    lec_id  VARCHAR2(10) NOT NULL,
    tel_enroll_date DATE NOT NULL,
    tel_begin_date DATE NOT NULL,
    tel_end_date DATE NOT NULL,
    tel_curr VARCHAR2(3000) NOT NULL
);
DROP TABLE teach_lecture;
SELECT * FROM teach_lecture;
DESC teach_lecture;

-- 기본키 설정
ALTER TABLE teach_lecture
ADD CONSTRAINT pk_teach_lecture
PRIMARY KEY(tel_id);

ALTER TABLE teach_lecture DROP CONSTRAINT pk_teach_lecture;
/*
-- 외래키 설정
*/
COMMIT;

-- -------------------------------------------------------------------
-- 질문 게시물
-- -------------------------------------------------------------------
CREATE TABLE lecture_qna(
    qna_id VARCHAR2(10) NOT NULL,
    tel_id VARCHAR2(10) NOT NULL,
    user_id VARCHAR2(11) NOT NULL,
    qna_title VARCHAR2(50) NOT NULL,
    qna_content VARCHAR2(3000) NOT NULL,
    qna_created DATE NOT NULL,
    qna_updated DATE NOT NULL
);
DROP TABLE lecture_qna;
SELECT * FROM lecture_qna;
DESC lecture_qna;

-- 기본키 설정
ALTER TABLE lecture_qna
ADD CONSTRAINT pk_lecture_qna
PRIMARY KEY(tel_id, qna_id);

ALTER TABLE lecture_qna DROP CONSTRAINT pk_lecture_qna;
/*
-- 외래키 설정
*/
COMMIT;

-- -------------------------------------------------------------------
-- 댓글 목록
-- -------------------------------------------------------------------
CREATE TABLE lecture_qna_reply (
    rep_id VARCHAR2(10) NOT NULL,
    qna_id VARCHAR2(10) NOT NULL,
    tel_id VARCHAR2(11) NOT NULL,
    user_id VARCHAR2(11) NOT NULL,
    rep_content VARCHAR2(500) NOT NULL,
    rep_created DATE NOT NULL,
    rep_updated DATE NOT NULL
);
DROP TABLE lecture_qna_reply;
SELECT * FROM lecture_qna_reply;
DESC lecture_qna_reply;

-- 기본키 설정
ALTER TABLE lecture_qna_reply
ADD CONSTRAINT pk_lecture_qna_reply
PRIMARY KEY(tel_id, qna_id, rep_id);

ALTER TABLE lecture_qna_reply DROP CONSTRAINT pk_lecture_qna_reply;

COMMIT;

-- -------------------------------------------------------------------
-- 수강 테이블 ; 학생의 수강 정보
-- -------------------------------------------------------------------
CREATE TABLE attend_lecture(
    atc_id VARCHAR2(10) NOT NULL,
    stu_id VARCHAR2(11) NOT NULL,
    tel_id VARCHAR2(10) NOT NULL,
    atc_join DATE NOT NULL,
    atc_complete CHAR(1) NOT NULL
);
DROP TABLE attend_lecture;
SELECT * FROM attend_lecture;
DESC attend_lecture;

-- 기본키 설정
ALTER TABLE attend_lecture
ADD CONSTRAINT pk_attend_lecture
PRIMARY KEY(atc_id);

ALTER TABLE attend_lecture DROP CONSTRAINT pk_attend_lecture;
/*
-- 외래키 제약 추가
alter table attend_lecture
add constraint fk_attend_lecture_stu_id
foreign key(stu_id) references student(stu_id);

alter table attend_lecture
drop constraint attend_lecture_stu_id_fk;
*/
COMMIT;