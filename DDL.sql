/*
Anggota Kelompok : 
-Calvin (2301893865)
-Fannisa Rahmah (2301882874)
-Rifdah Defrina (2301869191)
-M. Revi Gilang P (2301914301)
*/

CREATE DATABASE [Catering delVia]
GO

-- DROP DATABASE [Catering delVia]

USE [Catering delVia]
GO

CREATE TABLE Position (
	ID VARCHAR(5) PRIMARY KEY NOT NULL,
	[Name] VARCHAR(MAX) NOT NULL,
	CONSTRAINT ValidatePositionId CHECK(ID LIKE('SP[0-9][0-9][0-9]'))
)

CREATE TABLE Staff (
	ID VARCHAR(5) PRIMARY KEY NOT NULL,
	[Name] VARCHAR(MAX) NOT NULL,
	Gender VARCHAR(6) NOT NULL, /* Cuman Male atau Female */
	Email VARCHAR(MAX) NOT NULL,
	PhoneNumber VARCHAR(MAX) NOT NULL, /*Kalo int nanti 0 di paling depan hilang*/
	[Address] VARCHAR(MAX) NOT NULL,
	Salary INT,
	PositionId VARCHAR(5) NOT NULL,
	FOREIGN KEY (PositionId) REFERENCES Position(ID),
	CONSTRAINT ValidateStaffId		CHECK (ID LIKE('ST[0-9][0-9][0-9]')),
	CONSTRAINT ValidateStaffPhone	CHECK (PhoneNumber LIKE ('08%') AND NOT PhoneNumber LIKE '%[^0-9]%'),
	CONSTRAINT ValidateStaffEmail	CHECK (Email NOT LIKE('@%') AND 
	(Email LIKE('%@gmail.com') OR Email LIKE('%@yahoo.com') OR Email LIKE('%@yahoo.co.id'))),
	CONSTRAINT ValidateSalary		CHECK (Salary >= 500000 AND Salary <= 5000000),	
)

CREATE TABLE Ingredient (
	ID VARCHAR(5) PRIMARY KEY NOT NULL,
	[Name] VARCHAR(MAX) NOT NULL,
	Stock INT NOT NULL,
	Price INT NOT NULL,
	CONSTRAINT ValidateIngredientId CHECK(ID LIKE('ID[0-9][0-9][0-9]'))
)

CREATE TABLE Vendor (
	ID VARCHAR(5) PRIMARY KEY NOT NULL,
	[Name] VARCHAR(MAX) NOT NULL,
	PhoneNumber VARCHAR(MAX) NOT NULL,
	[Address] VARCHAR(MAX) NOT NULL,
	CONSTRAINT ValidateVendorId CHECK(ID LIKE('VE[0-9][0-9][0-9]')),
	CONSTRAINT ValidateVendorName CHECK([Name] LIKE('PT. %')),
)

CREATE TABLE Purchase (
	ID VARCHAR(5) PRIMARY KEY NOT NULL,
	StaffId VARCHAR(5) NOT NULL,
	VendorId VARCHAR(5) NOT NULL,
	[Date] DATE NOT NULL,
	FOREIGN KEY (StaffId) REFERENCES Staff(ID),
	FOREIGN KEY (VendorId) REFERENCES Vendor(ID),
	CONSTRAINT ValidatePurchaseId CHECK(ID LIKE('PU[0-9][0-9][0-9]'))
)

CREATE TABLE PurchaseDetail (
	PurchaseId VARCHAR(5) NOT NULL,
	IngredientId VARCHAR(5) NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY (PurchaseId, IngredientId),
	FOREIGN KEY (PurchaseId) REFERENCES Purchase(ID),
	FOREIGN KEY (IngredientId) REFERENCES Ingredient(ID),
)

CREATE TABLE Customer (
	ID VARCHAR(5) PRIMARY KEY NOT NULL,
	[Name] VARCHAR(MAX) NOT NULL,
	PhoneNumber VARCHAR(MAX) NOT NULL,
	[Address] VARCHAR(MAX) NOT NULL,
	Gender VARCHAR(6) NOT NULL,
	Email VARCHAR(MAX) NOT NULL,
	CONSTRAINT ValidateCustomerId CHECK(ID LIKE('CU[0-9][0-9][0-9]')),
	CONSTRAINT ValidateCustomerPhone	CHECK (PhoneNumber LIKE ('08%') AND NOT PhoneNumber LIKE '%[^0-9]%'),
	CONSTRAINT ValidateCustomerEmail	CHECK (Email NOT LIKE('@%') AND 
	(Email LIKE('%@gmail.com') OR Email LIKE('%@yahoo.com') OR Email LIKE('%@yahoo.co.id'))),
)

CREATE TABLE Menu (
	ID VARCHAR(5) PRIMARY KEY NOT NULL,
	[Name] VARCHAR(MAX) NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	Price INT NOT NULL,
	CONSTRAINT ValidateMenuId CHECK(ID LIKE('ME[0-9][0-9][0-9]')),
	CONSTRAINT ValidateMenuName CHECK(LEN([Name]) > 5),
)

CREATE TABLE [Transaction] (
	ID VARCHAR(5) PRIMARY KEY NOT NULL,
	StaffId VARCHAR(5) NOT NULL,
	CustomerId VARCHAR(5) NOT NULL,
	[Date] DATE NOT NULL,
	ReservationType VARCHAR(MAX) NOT NULL,
	ReservationAddress VARCHAR(MAX) NOT NULL,
	FOREIGN KEY (StaffId) REFERENCES Staff(ID),
	FOREIGN KEY (CustomerId) REFERENCES Customer(ID),
	CONSTRAINT ValidateTransactionId CHECK(ID LIKE('TR[0-9][0-9][0-9]'))
)

CREATE TABLE TransactionDetail (
	TransactionId VARCHAR(5) NOT NULL,
	MenuId VARCHAR(5) NOT NULL,
	Pax INT NOT NULL,
	PRIMARY KEY (TransactionId, MenuId),
	FOREIGN KEY (TransactionId) REFERENCES [Transaction](ID),
	FOREIGN KEY (MenuId) REFERENCES Menu(ID),
)
