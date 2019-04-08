show databases;
--member테이블 생성
 --정수타입의 칼럼값 자동 증가 처리 옵션 auto_increment 
 --primary key(칼럼명) 키 지정
create table member(
id int not null auto_increment,
name varchar(100) not null,
password varchar(50) not null,
primary key(id)
);

insert into member(name,password) values('홍길동','1234');
select * from member;
insert into member(name,password) values('일지매','5678');

--db문자셋 utf-8로 설정
ALTER DATABASE [DB명] DEFAULT CHARACTER SET utf8;
ALTER DATABASE jspbookdb DEFAULT CHARACTER SET utf8;

show variables like 'c%';

desc member;


--테이블의 칼럼 추가
alter table member add phone varchar(100);
alter table member drop column phone;

alter table member change column password passwd varchar(6);
alter table member change column passwd password varchar(50);

-- 테이블명 변경
rename table member to Student;
select * from student;
rename table student to member;
select * from member;

--조회
select * from member order by id desc;

--조건 조회
select * from member where id=2;
select * from member where name like '%길%' order by id desc;

--조회 결과 갯수 한정
select * from member limit 2;

--update
insert into member(name,password) values('임꺽정','1234');
select * from member;
update member set name='관리자' where name like '임꺽정';
select * from member;

-- 삭제
-- delete from 테이블명 where 조건
delete from member where id=2;

