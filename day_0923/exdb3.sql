-- ---<mariaDB 연습 3일차>---
SHOW DATABASES;
USE exdb;
SHOW TABLES;

--테이블구조
DESCRIBE customers;
DESC customers;

--테이블조회
SELECT * FROM customers;
SELECT COUNT(*) FROM customers;
SELECT customerID, ADDRESS FROM customers;

SELECT * FROM customers
WHERE Country = 'Mexico';

SELECT * FROM customers
WHERE customerid = 1;

SELECT * FROM customers
WHERE country = 'Germany' AND city = 'Berlin';

SELECT * FROM customers
ORDER BY country;

-- ---<테이블의 레코드(한줄) 삽입>---
INSERT INTO customers(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES(3000, 'Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

SELECT * FROM customers
WHERE customerID IS NULL;

SELECT * FROM customers 
WHERE customerID IS NOT NULL;

-- ---<테이블 내용 업데이트>---
UPDATE customers
SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
WHERE CustomerID = 1;

SELECT * FROM customers;

UPDATE customers
SET postalcode = '00000'
WHERE country = 'Mexico';

DELETE FROM customers WHERE CustomerName = 'Alfreds Futterkiste';

SELECT * FROM customers LIMIT 3;
SELECT * FROM customers LIMIT 3 OFFSET 3;

SELECT * FROM customers
WHERE country = 'Germany' LIMIT 3;

SELECT * FROM customers
ORDER BY country LIMIT 3;

SELECT * FROM products;

SELECT MIN(price) AS 가장낮은가격
FROM products;

SELECT MAX(price) AS 가장높은가격
FROM products;

SELECT COUNT(*) FROM products;
SELECT COUNT(productid) FROM products;

SELECT AVG(price) 평균가격
FROM products;

DESCRIBE orderdetails;
SELECT SUM(quantity) 합계
FROM orderdetails;

SELECT * FROM customers;

SELECT * FROM customers
WHERE customerName LIKE 'a%';

SELECT * FROM customers
WHERE customerName LIKE '%a';

SELECT * FROM customers
WHERE customerName LIKE '%or%';

SELECT * FROM customers
WHERE customerName LIKE '_r%';

SELECT * FROM customers
WHERE customerName LIKE 'a__%';

SELECT * FROM customers
WHERE contactName LIKE 'a%o';

SELECT * FROM customers
WHERE customerName NOT LIKE 'a%';

SELECT * FROM customers
WHERE city LIKE 'ber%';

SELECT * FROM customers
WHERE city LIKE '%es%';

SELECT * FROM customers
WHERE city LIKE '_ondon';

SELECT * FROM customers
WHERE city LIKE 'L_n_on';

SELECT * FROM customers
WHERE country IN('Germany', 'France', 'UK');

SELECT * FROM customers
WHERE country not IN('Germany', 'France', 'UK');

SELECT * FROM suppliers;
SELECT country FROM suppliers;

SELECT * FROM customers
WHERE country IN (SELECT country FROM suppliers);

SELECT * FROM customers
WHERE country not IN (SELECT country FROM suppliers);

SELECT * FROM products;

SELECT * FROM products
WHERE price BETWEEN 10 AND 20;

SELECT * FROM products
WHERE price not BETWEEN 10 AND 20;

SELECT * FROM products
WHERE price BETWEEN 10 AND 20
AND categoryid NOT IN (1,2,3);

SELECT * FROM products
WHERE productName
	BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY productName;

SELECT * FROM products
WHERE productName
	BETWEEN 'Carnarvon Tigers' AND "Chef Anton's Cajun Seasoning"
ORDER BY productName;

SELECT * FROM products
WHERE productName
	not BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY productName;

SELECT * FROM orders
WHERE orderDate BETWEEN '1996-07-01' AND '1996-07-31';

SELECT customerid AS id, customername AS customer
FROM customers;

SELECT customername AS 고객, contactName AS 연락처
FROM customers;

SELECT customername AS 고객, contactname AS "연락처 ()"
FROM customers;

SELECT customername, 
	CONCAT_WS(', ', Address, PostalCode, City, Country) AS 주소
FROM customers;

SELECT * FROM customers AS c;

SELECT * FROM orders AS o;
-- ---<특정고객이 주문한 정보를 검색>---
--
-- SELECT 결과로 보여질 필드선택
-- FROM 사용하는 테이블
-- WHERE c.CustomerName='Around the Horn'
-- 	AND c.CustomerID=o.CustomerID ;

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM customers AS c, orders AS o
WHERE c.CustomerName='Around the Horn'
	AND c.CustomerID=o.CustomerID ;
	
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM customers AS c, orders AS o
WHERE c.CustomerID=o.CustomerID ;

-- ----------------------------------------------
-- 고객테이블(고객id)
-- 고객id, 고객name, 고객tel, 고객 addr

-- (관계??)테이블	
-- **주문**테이블(주문id)
-- 주문id, 주문name(제품id), 주문date, 고객id

-- 제품 테이블(제품id)
-- 제품id, 제품name, 제품price
-- ----------------------------------------------
