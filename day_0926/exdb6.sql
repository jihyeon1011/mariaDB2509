-- w3. ANY 연산자
SHOW DATABASES;
USE EXDB;

SELECT productname
FROM products
WHERE productid = ANY
(SELECT productid
FROM orderdetails
WHERE quantity = 10);

SELECT productname
FROM products
WHERE productid = ANY
(SELECT productid
FROM orderdetails
WHERE quantity > 99);

SELECT productname
FROM products
WHERE productid = ANY
(SELECT productid
FROM orderdetails
WHERE quantity > 1000);

-- w3. all 연산자
SELECT ALL productname
FROM products
WHERE TRUE;

SELECT productname
FROM products
WHERE productid = ALL
(SELECT productid
FROM orderdetails
WHERE quantity = 10);

-- w3.insert into select

SELECT orderid, quantity,
case when quantity > 30 then 'The quantity is greater than 30'
when quantity = 30 then 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText
FROM orderdetails;

SELECT customername, city, country FROM customers
ORDER BY (case
when city IS NULL then country
ELSE city
END);

-- ifnull, coalesce

-- ifnull: null이면 대체값으로 바꾸자
-- coalesce: null이면 여러 후보 중 첫 번째 사용
--
