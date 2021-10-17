/*
Anggota Kelompok : 
-Calvin (2301893865)
-Fannisa Rahmah (2301882874)
-Rifdah Defrina (2301869191)
-M. Revi Gilang P (2301914301)
*/

USE [Catering delVia]
GO

-- DML Master 10 data
INSERT INTO Position VALUES
('SP001', 'CEO'),
('SP002', 'Secretary'),
('SP003', 'Treasurer'),
('SP004', 'Promotion'),
('SP005', 'Marketing'),
('SP006', 'Inventory Manager'),
('SP007', 'Head Chef'),
('SP008', 'Chef'),
('SP009', 'Supervisor'),
('SP010', 'Cashier')

INSERT INTO Staff VALUES
('ST001', 'Calvin Arihta', 'Male', 'calvinarihta@gmail.com', '085210000688', 'Jl. Metro Kencana 5', 500000, 'SP010'),
('ST002', 'Adrian Prajna', 'Male', 'adrian025@gmail.com', '084220037835', 'Jl. Subco DB', 5000000, 'SP007'),
('ST003', 'Di Beiderbecke', 'Female', 'dbeiderbecke@yahoo.com', '085922001009', '9062 Macpherson Terrace', 4532006, 'SP003'),
('ST004', 'Donall Kebbell', 'Male', 'dkebbell@gmail.com', '086755542001', '84449 Linden Plaza', 835555, 'SP009'),
('ST005', 'Erina Croisdall', 'Female', 'ecroisdall@yahoo.co.id', '082966122333', '78 Rowland Point', 1488294, 'SP008'),
('ST006', 'Vanni Alsina', 'Female', 'valsina@gmail.com', '081928374561', '5 Elmside Parkway', 3288872, 'SP006'),
('ST007', 'Lay Rawkesby', 'Male', 'lrawkesby@yahoo.com', '089996633122', '6382 Sachtjen Terrace', 3331610, 'SP002'),
('ST008', 'Opalina Chong', 'Female', 'ochong@yahoo.co.id', '0844447177772', '7250 Debra Circle', 4685640, 'SP005'),
('ST009', 'Giulio Vallow', 'Male', 'gvallow@gmail.com', '0811888857422', '038 Merrick Lane', 4821310, 'SP004'),
('ST010', 'Deane Vettore', 'Female', 'dvettore@yahoo.com', '085777477277', '4967 Namekagon Court', 4146001, 'SP001')


INSERT INTO Ingredient VALUES
('ID001', 'Salt', 100, 230),
('ID002', 'Oil', 250, 1000),
('ID003', 'Sauce', 50, 600),
('ID004', 'Pears', 25, 500),
('ID005', 'Lemon', 50, 300),
('ID006', 'Chocolate', 150, 150),
('ID007', 'Cheese', 300, 700),
('ID008', 'Milk', 450, 100),
('ID009', 'Cinnamon', 50, 1500),
('ID010', 'Sugar', 125, 200)

INSERT INTO Vendor VALUES
('VE001', 'Pt. Sobu.Jkt', '081299997222', 'Jl. Pasar Elang 24'),
('VE002', 'Pt. Wikibox', '082341023335', '37 Florence Street'),
('VE003', 'Pt. Realmix', '084762234512', '79 Banding Hill'),
('VE004', 'Pt. Topicware', '083339582122', '0 Johnson Road'),
('VE005', 'Pt. Twitternation', '085993887521', '670 Pierstorff Point'),
('VE006', 'Pt. Jayo', '085556682917', '26 Fairfield Drive'),
('VE007', 'Pt. Oyope', '083255569288', '6 La Follette Center'),
('VE008', 'Pt. Thoughtstorm', '0833377721236', '504 Dawn Parkway'),
('VE009', 'Pt. Browsedrive', '082221222345', '18102 North Court'),
('VE010', 'Pt. Cogibox', '085680002122', '62836 Moland Center')

INSERT INTO Customer VALUES
('CU001', 'Ada Frankton', '085210005677', '5714 Kennedy Hill', 'Female', 'gsimison0@yahoo.com'),
('CU002', 'Jarrid Souter', '085210005677', '2509 Arrowood Court', 'Male', 'jsouter@gmail.com'),
('CU003', 'Berk Durtnel', '085210005677', '251 Clyde Gallagher Drive', 'Male', 'bdurtnel@yahoo.com'),
('CU004', 'Othilia Bushe', '085210005677', '7815 Steensland Drive', 'Female', 'obushe@yahoo.co.id'),
('CU005', 'Waring Slinn', '085210005677', '4 Canary Plaza', 'Male', 'wslinn@yahoo.com'),
('CU006', 'Rosalie Sproule', '085210005677', '74 Blackbird Street', 'Female', 'rsproule@gmail.com'),
('CU007', 'Desmund Caldecot', '085210005677', '0 Independence Drive', 'Male', 'dcaldecot@yahoo.co.id'),
('CU008', 'Sean Tunmore', '085210005677', '09827 Dwight Park', 'Male', 'stunmore@yahoo.co.id'),
('CU009', 'Hali Ottosen', '085210005677', '8 Arizona Place', 'Female', 'hottosen@gmail.com'),
('CU010', 'Glory Simison', '085210005677', '32880 Farwell Court', 'Female', 'gsimison@gmail.com')

INSERT INTO Menu VALUES
('ME001', 'Caesar Salad', 'Original, Chef Recommendation', 45000),
('ME002', 'Spicy Chicken', 'Really Hot, Not For The Weak', 35600),
('ME003', 'Tasty Tempura', 'Crunchy Tempura, Chef Recommendation', 24000),
('ME004', 'Teriyaki With Rice', 'Original Teriyaki Beef With Rice', 30000),
('ME005', 'House Special 1', 'Udon with Chicken Soup + Secret Sauce', 27000),
('ME006', 'House Special 2', 'Rice + Chicken Soup + Seaweed + Secret Sauce', 27000),
('ME007', 'Chicken With Rice', 'Original Chicken With Rice', 25000),
('ME008', 'Grilled Cow', 'Village Sharing, Very Big', 500000),
('ME009', 'Chicken BBQ', 'Taste Like New Year', 125000),
('ME010', 'Mango Slush', 'To Sooth Your Thirst', 17000)

-- Transaction (15 data)
INSERT INTO Purchase VALUES
('PU001', 'ST001', 'VE001', '2020-01-01'),
('PU002', 'ST001', 'VE002', '2020-02-03'),
('PU003', 'ST002', 'VE003', '2020-03-04'),
('PU004', 'ST003', 'VE003', '2020-04-07'),
('PU005', 'ST003', 'VE004', '2020-05-07'),
('PU006', 'ST004', 'VE005', '2020-05-10'),
('PU007', 'ST004', 'VE005', '2020-06-11'),
('PU008', 'ST005', 'VE006', '2020-06-14'),
('PU009', 'ST006', 'VE007', '2020-07-16'),
('PU010', 'ST007', 'VE007', '2020-07-19'),
('PU011', 'ST008', 'VE008', '2020-08-21'),
('PU012', 'ST009', 'VE008', '2020-09-24'),
('PU013', 'ST009', 'VE009', '2020-10-26'),
('PU014', 'ST010', 'VE009', '2020-11-28'),
('PU015', 'ST010', 'VE010', '2020-12-28')

INSERT INTO [Transaction] VALUES
('TR001', 'ST001', 'CU001', '2020-01-15', 'Daily', 'Jl. A'),
('TR002', 'ST001', 'CU002', '2020-02-09', 'Weekly', 'Jl. B'),
('TR003', 'ST002', 'CU002', '2020-02-25', 'Daily', 'Jl. C'),
('TR004', 'ST003', 'CU002', '2020-03-20', 'Daily', 'Jl. D'),
('TR005', 'ST004', 'CU003', '2020-04-11', 'Daily', 'Jl. E'),
('TR006', 'ST005', 'CU004', '2020-05-02', 'Daily', 'Jl. F'),
('TR007', 'ST005', 'CU005', '2020-05-16', 'Weekly', 'Jl. G'),
('TR008', 'ST006', 'CU006', '2020-06-27', 'Daily', 'Jl. H'),
('TR009', 'ST007', 'CU006', '2020-07-08', 'Weekly', 'Jl. I'),
('TR010', 'ST007', 'CU007', '2020-07-10', 'Daily', 'Jl. J'),
('TR011', 'ST008', 'CU007', '2020-08-14', 'Weekly', 'Jl. K'),
('TR012', 'ST009', 'CU008', '2020-09-09', 'Daily', 'Jl. L'),
('TR013', 'ST009', 'CU008', '2020-10-27', 'Daily', 'Jl. M'),
('TR014', 'ST010', 'CU009', '2020-11-20', 'Weekly', 'Jl. N'),
('TR015', 'ST010', 'CU010', '2020-12-18', 'Weekly', 'Jl. O')

-- Transaction Detail (25 data)
INSERT INTO PurchaseDetail VALUES
('PU001', 'ID009', 50),
('PU002', 'ID009', 1000),
('PU003', 'ID002', 1500),
('PU004', 'ID005', 2500),
('PU005', 'ID005', 5000),
('PU006', 'ID010', 70),
('PU007', 'ID009', 750),
('PU008', 'ID009', 230),
('PU009', 'ID006', 550),
('PU010', 'ID008', 120),
('PU010', 'ID002', 150),
('PU009', 'ID003', 100),
('PU002', 'ID001', 100),
('PU002', 'ID005', 900),
('PU001', 'ID001', 230),
('PU005', 'ID001', 250),
('PU001', 'ID008', 7500),
('PU010', 'ID001', 500),
('PU009', 'ID009', 900),
('PU008', 'ID010', 1000),
('PU002', 'ID006', 2500),
('PU008', 'ID007', 1000),
('PU006', 'ID003', 1500),
('PU001', 'ID010', 2000),
('PU001', 'ID002', 3000)

INSERT INTO TransactionDetail VALUES
('TR001', 'ME001', 500),
('TR002', 'ME001', 750),
('TR003', 'ME001', 1000),
('TR004', 'ME002', 1500),
('TR005', 'ME002', 2500),
('TR006', 'ME002', 50),
('TR007', 'ME003', 100),
('TR008', 'ME003', 250),
('TR009', 'ME004', 3000),
('TR010', 'ME005', 5000),
('TR001', 'ME005', 7500),
('TR002', 'ME006', 500),
('TR003', 'ME006', 600),
('TR004', 'ME007', 250),
('TR005', 'ME007', 900),
('TR006', 'ME007', 450),
('TR007', 'ME008', 50),
('TR008', 'ME008', 75),
('TR009', 'ME008', 100),
('TR010', 'ME009', 150),
('TR009', 'ME009', 2300),
('TR008', 'ME009', 1400),
('TR007', 'ME010', 500),
('TR006', 'ME010', 650),
('TR005', 'ME010', 125)