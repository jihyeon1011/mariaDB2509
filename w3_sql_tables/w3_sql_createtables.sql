SHOW DATABASES;
CREATE DATABASE exdb;
USE EXDB;

CREATE TABLE Customers(
	CustomerID INT,
	CustomerName VARCHAR(70),
	ContactName	VARCHAR(30),
	Address VARCHAR(50),
	City	VARCHAR(30),
	PostalCode VARCHAR(20),
	Country VARCHAR(20)
);

CREATE TABLE Categories(
	CategoryID INT,
	CategoryName VARCHAR(20),
	`Description`VARCHAR(100)
);

SELECT * FROM Categories;
DROP TABLE orderdetails;
USE exdb;

CREATE TABLE Employees(
	EmployeeID INT,
	LastName	VARCHAR(20),
	FirstName VARCHAR(20),
	BirthDate DATE,
	Photo VARCHAR(20),	
	Notes text
);

CREATE TABLE OrderDetails(
OrderDetailID INT,
OrderID CHAR(5),
ProductID VARCHAR(3),
Quantity VARCHAR(4)
);

CREATE TABLE Orders(
	OrderID CHAR(5),
	CustomerID VARCHAR(3),
	EmployeeID INT,
	OrderDate DATE,
	ShipperID int
);
CREATE TABLE Products(
	ProductID	INT,	
	ProductName	VARCHAR(70),
	SupplierID	INT,
	CategoryID	INT,
	Unit	VARCHAR(50),
	Price DECIMAL(6,2)
);
CREATE TABLE Shippers(
	ShipperID	INT,
	ShipperName VARCHAR(20),
	Phone VARCHAR(20)
);
CREATE TABLE Suppliers(
	SupplierID INT,	
	SupplierName VARCHAR(50),
	ContactName	VARCHAR(50),
	Address	VARCHAR(50),
	City	VARCHAR(30),
	PostalCode	VARCHAR(30),
	Country	VARCHAR(30),
	Phone VARCHAR(20)
);

SELECT * FROM Suppliers;