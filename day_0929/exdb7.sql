--

SHOW DATABASES;
USE exdb;

SHOW TABLES;
SELECT * FROM persons;

-- 테이블 생성
CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age int
);
DESCRIBE persons;

-- 테이블 필드구조 수정
ALTER TABLE persons
MODIFY age INT NOT NULL;
DESC persons;

DROP TABLE persons;
SELECT * FROM persons;

--
CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	UNIQUE(ID)
);
DESCRIBE persons;

DROP TABLE persons;
SELECT * FROM persons;

-- UNIQUE(ID) : 1, 2, 3,... 즉 ID값이 중복안됨.
-- UNIQUE(ID, LastName) : ID+lastName 두개의 필드값을 합
-- 1길동, 2길동, 3길동, 1지매, 2지매, 3지매, ... 중복가능
-- 4대왕, 4대왕 ... 두개의 필드값이 중복됨.. 안됨.
CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	age INT,
	CONSTRAINT UC_person UNIQUE(ID, LastName)
);

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT
);
DESC persons;

ALTER TABLE persons
ADD UNIQUE (id);

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT
);
DESC persons;

ALTER TABLE persons
ADD CONSTRAINT UC_Person UNIQUE (ID, LastName);

-- 제약조건 삭제
ALTER TABLE persons
DROP INDEX uc_person;

-- CONSTRAINT를 관리하는 테이블에서 확인하는 방법:start ----
SHOW INDEX FROM persons;

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons';

--

SELECT CONSTRAINT_NAME, CONSTRAINT_type, TABLE_NAME
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons';

--
SELECT CONSTRAINT_NAME, COLUMN_NAME, ordinal_position
FROM information_schema.key_column_usage
WHERE TABLE_NAME = 'persons'
	AND CONSTRAINT_NAME = 'UC_person';
	
-- CONSTRAINTS를 관리하는 테이블에서 확인하는 방법:end

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	PRIMARY KEY(ID)
);
DESC persons;

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	CONSTRAINT pk_person PRIMARY KEY(id, lastname)
);
DESC persons;

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT
);

DESC persons;

ALTER TABLE persons
ADD PRIMARY KEY(id);

DROP TABLE persons;
CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT
);
DESC persons;

ALTER TABLE persons
ADD CONSTRAINT pk_person PRIMARY KEY(id, lastname);

ALTER TABLE persons
DROP PRIMARY KEY;

-- --------------------------------------------------
SELECT * FROM persons_f;
SELECT * FROM orders_f;

-- 인원표
CREATE TABLE persons_f(
	personID INT PRIMARY key,
	LastName VARCHAR(255),
	FirstName VARCHAR(255),
	Age int
);

-- 주문표
CREATE TABLE orders_f(
	orderID INT NOT NULL,
	orderNumber INT NOT NULL,
	personID INT,
	PRIMARY KEY(orderID),
	FOREIGN KEY(personID) REFERENCES persons_f(personID)
);
SELECT * FROM orders_f;
DESC persons_f;
DESC orders_f;

-- constraint 등록
DROP TABLE orders_f;
DESC orders_f;

CREATE TABLE orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY(OrderID),
	CONSTRAINT FK_PersonOrder FOREIGN KEY(personID) REFERENCES persons_f(personID)	
);
SHOW INDEX FROM orders_f;

DROP TABLE orders_f;
CREATE TABLE orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT
);
DESC orders_f;

ALTER TABLE orders_f
ADD FOREIGN KEY(personID) REFERENCES persons_f(personID);

ALTER TABLE orders_f
ADD CONSTRAINT FK_PersonOrder 
FOREIGN KEY(personID) REFERENCES persons_f(personID);

SHOW INDEX FROM orders_f;

ALTER TABLE orders_f
DROP FOREIGN KEY FK_PersonOrder;
-- 실제로는 지워졌는데 인덱스는 남아있음.
-- ------------------------------------------------------
DROP TABLE persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	CHECK (Age>=18)
);

DESC persons;
SHOW CREATE TABLE persons;

DROP table persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	City VARCHAR(255),
	CONSTRAINT chk_person CHECK(age >= 18 AND city = 'Sandnes')
);
-- SHOW INDEX from persons;
SHOW CREATE table persons;

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE table_name = 'persons';

DROP TABLE persons;
CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	City VARCHAR(255)
);
DESC persons;

ALTER TABLE persons
ADD CHECK(age >= 18);

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons';

DROP TABLE persons;

ALTER TABLE persons
ADD CONSTRAINT CHK_PersonAge CHECK(age>=18 AND city = 'Sandnes');

ALTER TABLE persons
DROP constraint CHK_PersonAge;
