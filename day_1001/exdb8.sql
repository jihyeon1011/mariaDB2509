--exdb8
-- default constraint
USE exdb;
SHOW TABLES;

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	City VARCHAR(255) DEFAULT 'Sandnes'
);
DESC persons;

-- INSERT INTO persons (피드나열) VALUES (값나열);
-- : 값을 일부만 줄때(필수입력빼고), 순서바꿔서 넣을때(비추)
-- INSERT INTO persons VALUES (값나열); 
-- IFNULL(필드명, '대체값')

INSERT INTO persons (id, lastname) VALUES (1, '길동');
INSERT INTO persons (lastname, id) VALUES ('지매', 2);
INSERT INTO persons VALUES(3, '세종', '대왕', 500, '수원');
INSERT INTO persons VALUES(4, '춘향', '성', 9999, '수원9');

SELECT * FROM persons;

SELECT lastname, IFNULL(age, 8888) AS lastname 
FROM persons
WHERE lastname = '길동';

-- ---------------------------------------
ALTER TABLE persons
ALTER city SET DEFAULT '수원';

INSERT INTO persons VALUES(4, '춘향', '성', 9999, '용인');
INSERT INTO persons (id, lastname) VALUES(5, '지현');

ALTER TABLE persons
ALTER city DROP DEFAULT;
DESC persons;
INSERT INTO persons (id, lastname) VALUES(6, '지현6');
-- ---------------------------------------

DROP TABLE orders;
SELECT * FROM orders;

CREATE TABLE orders(
	ID INT NOT NULL,
	OrderNumber INT NOT NULL,
	OrderDate date DEFAULT CURRENT_DATE()
);
DESC orders;

INSERT INTO orders(id, ordernumber) VALUES(1, 100);
INSERT INTO orders VALUES(2, 200, '2020-09-09');
INSERT INTO orders VALUES(3, 300, '2020-8-8');

SELECT * FROM orders;

-- ---------------------------------------
-- index

CREATE INDEX idx_lastname
ON persons(lastname);

DESC persons;
SHOW INDEX FROM persons;

CREATE INDEX idx_pname
ON persons(lastname, firstname);

ALTER TABLE persons
DROP INDEX idx_lastname;
SHOW INDEX FROM persons;

ALTER TABLE persons
DROP INDEX idx_pname;
SHOW INDEX FROM persons;

-- ---------------------------------------
-- auto_increment : 이미 존재하는 id보다 작은 값으로는 설정 불가(오류는 안나는데)
DROP TABLE persons;

CREATE TABLE persons(
	Personid INT NOT NULL AUTO_INCREMENT,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	PRIMARY KEY(personid)
);

SELECT * FROM persons;
INSERT INTO persons (lastname, firstname, age)VALUES('홍', '길동', 22);
INSERT INTO persons (lastname, firstname, age)VALUES('일', '지매', 25);

ALTER TABLE persons AUTO_INCREMENT = 100;
INSERT INTO persons (lastname, firstname, age)VALUES('대왕', '세종', 30);

ALTER TABLE persons AUTO_INCREMENT = 1;
INSERT INTO persons (lastname, firstname, age)VALUES('성', '춘향', 16);

DESC persons;
ALTER TABLE persons AUTO_INCREMENT = 50;
INSERT INTO persons (lastname, firstname, age)VALUES('장', '영실', 35);

-- ---------------------------------------
-- date

SELECT * FROM orders;
DROP TABLE orders;

CREATE TABLE orders(
	OrderId INT,
	ProductName VARCHAR(200),
	OrderDate DATE
);

INSERT INTO orders VALUES(1, 'Geitost', '2008-11-11');
INSERT INTO orders VALUES(2, 'Camembert Pierrot', '2008-11-09');
INSERT INTO orders VALUES(3, 'Mozzarella di Giovanni', '2008-11-11');
INSERT INTO orders VALUES(4, 'Mascarpone Fabioli', '2008-10-29');

SELECT * 
FROM orders
WHERE orderdate = '2008-11-11';

SELECT * 
FROM orders
WHERE orderdate = 20081111;

SELECT * 
FROM orders
WHERE orderdate = '20081111';

-- datetime

CREATE TABLE orders(
	OrderId INT,
	ProductName VARCHAR(200),
	OrderDate DATETIME
);

INSERT INTO orders VALUES(1, 'Geitost', '	2008-11-11 13:23:44');
INSERT INTO orders VALUES(2, 'Camembert Pierrot', '2008-11-09 15:45:21');
INSERT INTO orders VALUES(3, 'Mozzarella di Giovanni', '2008-11-11 11:12:01');
INSERT INTO orders VALUES(4, 'Mascarpone Fabioli', '2008-10-29 14:56:59');

SELECT * 
FROM orders
WHERE DATE(orderdate) = '20081111';

SELECT * 
FROM orders
WHERE orderdate between '2008-11-11 00:00:00' AND '2008-11-11 23:59:59';

SELECT *
FROM orders
WHERE DATE_FORMAT(orderdate, '%Y-%m-%d') = '2008-11-11';

-- ---------------------------------------
-- view

SELECT * FROM customers;
DESC customers;

CREATE VIEW `Brazil Customers` AS
SELECT CustomerName, ContactName
FROM customers
WHERE country = 'Brazil';

SELECT * FROM `Brazil Customers`;

SHOW TABLES;

CREATE VIEW `Products Above Average Price` AS
SELECT productName, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT * FROM `Products Above Average Price`;

-- 뷰를 생성create하거나 새로고침replace
CREATE OR REPLACE VIEW `Brazil Customers` AS
SELECT customername, contactname, city, country
FROM customers
WHERE country = 'Brazil';
-- 뷰의 이름은 대소문자(공백)를 구분함 ** 실수하지 않도록 숙지
CREATE OR REPLACE VIEW `brazil customers` AS
SELECT customername, contactname, city, country
FROM customers
WHERE country = 'Brazil';


SELECT * FROM `Brazil Customers`;

DROP VIEW `Brazil Customers`;
DROP VIEW `brazil customers`;
DROP VIEW `Products Above Average Price`;