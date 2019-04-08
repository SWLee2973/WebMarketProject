USE WebMarketDB;

 --use:0정상, 1탈퇴
create table member ( 
    id varchar(10) not null,
    password varchar(10) not null,
    name varchar(10) not null,
    gender varchar(4),
    birth  varchar(10),
    mail  varchar(30),
    phone varchar(20),
    zipcode varchar(5),
    address varchar(150),
    regist_day varchar(50),
    useflag int(1) not null default 0,
    primary key(id) 
) default CHARSET=utf8;

select * from member;
drop table member;
