-- chapter3 --


-- 실습1. shopDB 생성--
SHOW DATABASES;
CREATE DATABASE shopdb;
USE shopdb;


-- 실습2. 테이블 생성--
CREATE TABLE memberTBL(
memberID CHAR(8) NOT null,
memberName CHAR(5) NOT null,
memberAddress CHAR(20)
);

CREATE TABLE productTBL(
productName CHAR(4) NOT NULL,
cost INT NOT null,
makeDate DATE,
company CHAR(5),
amount INT NOT NULL
);


-- 실습3.행 데이터 입력--
INSERT INTO membertbl(memberID, memberName, memberAddress)
VALUES 
	('Dang', '당탕이', '경기 부천시 중동'),
	('Jee', '지운이', '서울 은평구 증산동'),
	('Han', '한주연', '인천 남구 주안동'),
	('Sang', '상길이', '경기 성남구 분당구');
	
SELECT * FROM producttbl;
DROP TABLE producttbl;

INSERT INTO producttbl(productName, cost, MAKEDATE, company, amount)
VALUES
	('컴퓨터', 10, '2017-01-01', '삼성', 17),
	('세탁기', 20, '2018-09-01', 'LG', 3),
	('냉장고', 5, '2019-02-01', '대우', 22);
	

-- 실습4. 데이터 활용 --

SELECT * FROM membertbl;
SELECT membername, memberaddress FROM membertbl;
SELECT * FROM membertbl WHERE membername = '지운이';
CREATE TABLE `my testTBL` (id INT);
DROP TABLE `my testTBL`;

CREATE TABLE indexTBL(
	first_name VARCHAR(14),
	last_name VARCHAR(16),
	hire_date date
);

INSERT INTO indexTBL
	SELECT first_name, last_name, hire_date
	FROM employees.employees
	LIMIT 500;
	
SELECT * FROM indexTBL;

SELECT * FROM indextbl WHERE first_name = 'Mary';

explain SELECT * FROM indextbl WHERE first_name = 'Mary';

CREATE INDEX idx_indexTBL_firstname
	ON indexTBL(first_name);
	
SELECT * FROM indextbl WHERE first_name = 'Mary';

explain SELECT * FROM indextbl WHERE first_name = 'Mary';