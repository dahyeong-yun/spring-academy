/*
 # 사용자 별 이용 테이블 및 쿼리 유형
    - 관리자
        - 사용자 유형에 따른 테이블 (학생, 직원, 관리자 => 사용자 엔티티) : 관리자만이 사용자 아이디를 생성 가능
            - 학생 사람 수 지정해서 한번에 생성하기, 아이디, 비밀번호 자동 생성 -> 초기 비밀번호 변경하지 않을 경우, 사용 불가 
        - 과목 유형, 커리큘럼, 실제 강의 테이블 
        - 강의실 테이블
        - 강의실(스터디룸) 테이블
    - 학생
        - 강의별 QnA 테이블 조회, 수정, 삭제, 생성
    - 직원
        - 상담 테이블
        - 강의실(스터디룸) 테이블 조회, 수정, 삭제, 생성
*/

-- 테이블 정의 및 dummy data 입력

-- ------------------------------
-- ## 관리자
--   - 사용자 유형에 따른 테이블
-- ------------------------------

-- -------------
-- 사용자 테이블(이 필요한지?)
-- -------------
create table users(
    user_id int primary key,
    user_login_id varchar2(20) not null unique,
    user_password varchar2(20) not null,
    user_type char(1) not null -- 0:관리자, 1:직원, 2:학생
);
drop table users;
create sequence users_seq;
drop sequence users_seq;
select * from users;
desc users;

insert into users values (users_seq.nextval, 'admin','123','0');
insert into users values (users_seq.nextval, '20190001','123','2');

commit;



-- -------------
-- 학생 테이블
-- -------------
create table student (
	stu_id int primary key,
    stu_name varchar2(20) not null,
    stu_birth date null,
    stu_phone varchar2(20) not null,
    stu_email varchar2(100) not null,
    stu_addr varchar2(100) null
);
drop table student;
create sequence student_seq;
drop sequence student_seq;
select * from student;
desc student;

-- 외래키 제약 추가
alter table student
add constraint student_stu_id_fk
foreign key(stu_id) references users(user_id);

-- dummy data
insert into student (stu_id, stu_name, stu_birth, stu_phone, stu_email, stu_addr)
values (2, '김명성',sysdate,'01077756452','asdk@gmail.com','인천시 미추홀구 숭의동');

commit;

-- -------------
-- 과목 정보 테이블(커리큘럼, 강사, 일정만 바꿔 낄 수 있도록)
-- -------------
create table course (
    cou_id int primary key,
    cou_name varchar2(50),
    clr_id int
);
drop table course;
create sequence course_seq;
drop sequence course_seq;
select * from course;
desc course;

-- 외래키 제약 추가
alter table course
add constraint course_clr_id_fk
foreign key(clr_id) references classroom(clr_id);

-- dummy data
insert into course(cou_id, cou_name, clr_id)
values(course_seq.nextval, 'Java 취업 준비반', 1);

commit;

-- -------------
-- 강의실 테이블
-- -------------
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


-- -------------
-- 수강 테이블 ; 학생의 수강 정보
-- -------------
create table attend_course(
    atc_id int primary key,
    stu_id int,
    cou_id int
);
drop table attend_course;
create sequence attend_course_seq;
drop sequence attend_course_seq;
select * from attend_course;
desc attend_course;

-- 외래키 제약 추가
alter table attend_course
add constraint attend_course_stu_id_fk
foreign key(stu_id) references student(stu_id);

-- dummy data
insert into attend_course(atc_id, stu_id, cou_id)
values(attend_course_seq.nextval, 2, 1);

commit;

-- 수강 과목 리스트 뷰
select s.stu_id, s.stu_name, co.cou_name
from attend_course a
join student s
on s.stu_id = a.stu_id
join course co
on co.cou_id = a.cou_id;
-- where s.stu_id = 2;






-- 직원 테이블
create table employee (
	emp_id int primary key,
    emp_login_id varchar(20),
    emp_passwd varchar(20) not null,
	emp_name varchar(20) not null,
    emp_type char(1) not null -- 관리자, 상담원, 교수자, 오퍼레이션(회계, 커뮤니티)
);




-- 커리큘럼 테이블
create table curriculum (
    curr_id int primary key
);



-- 실제 열린 강의 리스트 테이블(어떤 학생이 듣는지)
create table calss (
    class_id int primary key,
    sub_id int,
    curr_id int,
    room_id int
);

-- QnA 게시판
create table qnaBorad(
    qna_id int primary key,
    class_id int
);

drop table myMember;

commit;

-- 화면별 query

-- 로그인
select user_id, user_login_id, user_password, user_type
from users
where user_login_id = 'admin';

commit;

