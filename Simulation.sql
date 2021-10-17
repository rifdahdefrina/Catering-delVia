/*
Anggota Kelompok : 
-Calvin (2301893865)
-Fannisa Rahmah (2301882874)
-Rifdah Defrina (2301869191)
-M. Revi Gilang P (2301914301)
*/

USE [Catering delVia]
GO

-- Simulation
INSERT INTO Purchase VALUES
('PU025', 'ST001', 'VE010', '2020-11-11')

INSERT INTO PurchaseDetail VALUES
('PU025', 'ID010', 75)

SELECT * FROM Ingredient
BEGIN TRANSACTION
UPDATE Ingredient
SET Stock = Stock - 75
WHERE ID = 'ID010'
SELECT * FROM Ingredient
ROLLBACK
--COMMIT


INSERT INTO [Transaction] VALUES
('TR025', 'ST001', 'CU001', '2020-11-11', 'Monthly', 'Jl. P')

INSERT INTO TransactionDetail VALUES
('TR025', 'ME010', 50)