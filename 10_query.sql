/*
Anggota Kelompok : 
-Calvin (2301893865)
-Fannisa Rahmah (2301882874)
-Rifdah Defrina (2301869191)
-M. Revi Gilang P (2301914301)
*/

USE [Catering delVia]
GO

--1
SELECT [StaffName] = s.[Name], 
	[StaffPositionName] = p.[Name], 
	[Total Activity] = [Total].P
FROM Staff s
JOIN Position p ON p.Id = s.PositionId
JOIN (
	SELECT P = (COUNT(tr.ID) + COUNT(pc.id)), S = s.ID
	FROM Staff s
	JOIN [Transaction] tr ON tr.StaffId = s.ID
	JOIN Purchase pc ON pc.StaffId = s.ID
	GROUP BY s.ID
) AS [Total] ON [Total].S = s.ID
WHERE s.Salary >= 1000000 AND s.Salary <= 4000000 
GROUP BY S.[Name], P.[Name], [Total].P
HAVING [Total].P > 2

--2 
SELECT [CustomerID] = c.ID, 
	[CustomerName] = c.[Name], 
	[Pax Bought] = SUM(trd.Pax)
FROM Customer c
JOIN [Transaction] tr ON tr.CustomerId = c.ID
JOIN TransactionDetail trd ON trd.TransactionId = tr.ID
WHERE c.Gender LIKE('Male') AND MONTH(tr.[Date]) <= 6
GROUP BY c.ID, c.[Name]

--3
SELECT [IngredientName] = ig.[Name],
	[Ingredient Bought] = SUM(pcd.Quantity), 
	[Purchase Count] = COUNT(PurchaseId), 
	[Total Expenses] = (SUM(ig.Stock * ig.Price))
FROM Ingredient ig
JOIN PurchaseDetail pcd ON pcd.IngredientId = ig.ID
JOIN Purchase pc ON pc.ID = pcd.PurchaseId
WHERE DATEPART(MONTH, pc.[Date]) % 2 = 0 AND DATEPART(WEEKDAY, pc.[Date]) BETWEEN 2 AND 5
GROUP BY ig.[Name]

--4
SELECT [Staff First Name] = LEFT(s.[Name], CHARINDEX(' ', s.[Name])),
	[Transaction Count] = COUNT(tr.ID), 
	[Pax Sold] = SUM(trd.Pax)
FROM Staff s
JOIN [Transaction] tr ON tr.StaffId = s.ID
JOIN TransactionDetail trd ON trd.TransactionId = tr.ID
JOIN Customer c ON tr.CustomerId = c.ID
WHERE RIGHT(s.ID, 1) % 2 = 1 AND RIGHT(c.ID, 1) % 2 = 0
GROUP BY s.[Name]

--5
SELECT [Vendor Name] = SUBSTRING(v.[Name], 5, LEN(v.[Name])), 
	[IngredientName] = ig.[Name], 
	[Ingredient Price] = 'Rp. ' + CAST(Ig.Price AS VARCHAR)
FROM (
	SELECT [AvgPrice] = AVG(Price)
	FROM Ingredient
) AS [Avg], Vendor v
JOIN Purchase pc ON v.ID = pc.VendorId
JOIN PurchaseDetail pcd ON pcd.PurchaseId = pc.ID
JOIN Ingredient ig ON ig.ID = pcd.IngredientId
GROUP BY v.[Name], ig.[Name], ig.Price, [Avg].AvgPrice, ig.Stock
HAVING ig.Price >= [Avg].AvgPrice AND ig.Stock < 250

-- 6
SELECT [CustomerName] = c.[Name], 
	[TransactionDate] = CONVERT(VARCHAR, tr.[Date], 107),
	[MenuName] = m.[Name], 
	[MenuPrice] = m.Price, 
	[Brief Description] = LEFT(m.[Description], CHARINDEX(' ', m.[Description])),
	[Pax] = trd.Pax,
	[Total Price] = m.Price * trd.Pax
FROM ( 
	SELECT [AvgPrice] = AVG(Price)
	FROM Menu
) AS [Avg], Customer c
JOIN [Transaction] tr ON tr.CustomerId = c.ID
JOIN TransactionDetail trd ON trd.TransactionId = tr.ID
JOIN Menu m ON m.ID = trd.MenuId
WHERE trd.Pax > 100
GROUP BY c.[Name], tr.[Date], m.[Name], m.[Description], trd.Pax, m.Price, [Avg].AvgPrice
HAVING m.Price > [Avg].AvgPrice

-- 7
SELECT [Staff Name] = UPPER(s.[Name]),
	[Purchase Date] = CONVERT(VARCHAR, pc.[Date], 107),
	[Quantity Bought] = CONVERT(VARCHAR, pcd.Quantity) + ' pcs' 
FROM (
	SELECT [MaxPrice] = MAX(Price)
	FROM Ingredient
) AS [Max], Staff s
JOIN [Purchase] pc ON pc.StaffId = s.ID
JOIN PurchaseDetail pcd ON pcd.PurchaseId = pc.ID
JOIN Ingredient ig ON ig.ID = pcd.IngredientId
WHERE DATEPART(MONTH, pc.[Date]) % 2 = 0
GROUP BY s.[Name], pc.[Date], [Max].MaxPrice, ig.Price, pcd.Quantity
HAVING ig.Price < [Max].MaxPrice

-- 8
SELECT [CustomerName] = c.[Name], 
	[Email] = SUBSTRING(c.Email, 1, CHARINDEX('@', c.Email) - 1),
	[Menu Name] = LOWER(m.[Name]),
	[Pax Bought] = SUM(trd.Pax)
FROM (
	SELECT [AvgPax] = AVG(Pax)
	FROM TransactionDetail
) AS [Avg], Customer c
JOIN [Transaction] tr ON tr.CustomerId = c.ID
JOIN TransactionDetail trd ON trd.TransactionId = tr.ID
JOIN Menu m ON m.ID = trd.MenuId
WHERE c.Gender LIKE('Male')
GROUP BY c.[Name], c.Email, m.[Name], [Avg].AvgPax, trd.Pax
HAVING trd.Pax >= [Avg].AvgPax

-- 9
CREATE VIEW LoyalCustomerView AS
SELECT [CustomerName] = c.[Name], 
	[Total Transaction] = COUNT(c.ID),
	[Total Pax Purchased] = SUM(trd.Pax),
	[Total Price] = SUM(trd.Pax * m.Price)
FROM Customer c
JOIN [Transaction] tr ON tr.CustomerId = c.ID
JOIN TransactionDetail trd ON trd.TransactionId = tr.ID
JOIN Menu m ON m.ID = trd.MenuId
WHERE c.Gender LIKE('Female')
GROUP BY c.[Name]
HAVING COUNT(c.ID) > 2
GO

SELECT * FROM LoyalCustomerView
-- DROP VIEW LoyalCustomerView

-- 10
CREATE VIEW VendorRecapView AS
SELECT DISTINCT [VendorName] = v.[Name],
	[Purchases Made] = COUNT(v.ID),
	[Ingredients Purchased] = SUM(pcd.Quantity)
FROM Vendor v
JOIN Purchase pc ON pc.VendorId = v.ID
JOIN PurchaseDetail pcd ON pcd.PurchaseId = pc.ID
JOIN Ingredient ig ON ig.ID = pcd.IngredientId
WHERE pcd.Quantity > 150
GROUP BY v.[Name]
HAVING COUNT(v.ID) > 1
GO

SELECT * FROM VendorRecapView
-- DROP VIEW VendorRecapView