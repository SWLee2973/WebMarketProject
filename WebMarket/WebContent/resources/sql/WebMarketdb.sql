--데이타베이스 생성
create database webmarketdb;

--테이블 생성
CREATE TABLE IF NOT EXISTS product(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(20),
	p_unitPrice  INTEGER,
	p_description TEXT,
   	p_category VARCHAR(20),
	p_manufacturer VARCHAR(20),
	p_unitsInStock LONG,
	p_condition VARCHAR(20),
	p_fileName  VARCHAR(20),
	PRIMARY KEY (p_id)
)default CHARSET=utf8;

desc product;

--초기데이타 입력
INSERT INTO product VALUES('P1234', 'iPhone 6s', 800000, '1334X750 Renina HD display, 8-megapixel iSight Camera','Smart Phone', 'Apple', 1000, 'new', 'P1234.png');
INSERT INTO product VALUES('P1235', 'LG PC gram', 1500000, '3.3-inch,IPS LED display, 5rd Generation Intel Core processors', 'Notebook', 'LG', 1000, 'new', 'P1235.png');
INSERT INTO product VALUES('P1236', 'Galaxy Tab S', 900000, '3.3-inch, 212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor', 'Tablet', 'Samsung', 1000, 'new', 'P1236.png');

select * from product;

show databases;


상품id, 상품명, 설명, 단가, 재고

select p_id, p_name, p_description, p_unitprice, p_unitsinstock 
from product;

select * from product order by p_id;

INSERT INTO product VALUES(?, ?,?, ?, ?, ?,?, ?,?);



update product set p_condition='new' 
where p_id='P1234'; 

desc product;

update prodcute set
 p_name=?,
 p_unitPrice=?,    
 p_description =?,  
 p_category=?,   
 p_manufacturer=?,    
 p_unitsInStock=?,    
 p_condition=?,    
 p_fileName=?    
where p_id =?



