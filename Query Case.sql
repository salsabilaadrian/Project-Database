USE SaraviaPen

--1
SELECT
	cu.CustomerID,
	CustomerName,
	SalesTransactionDate,
	[Sales Transaction Quantity] = SUM(Qty)
FROM Customer cu
	JOIN SalesTransactionHeader sth
		ON cu.CustomerID = sth.CustomerID
	JOIN SalesTransactionDetail std
		ON sth.SalesTransactionID = std.SalesTransactionID
GROUP BY cu.CustomerID, CustomerName, SalesTransactionDate, PenID
HAVING DAY(SalesTransactionDate) = 25
	AND PenID LIKE 'PEN009'

--2
SELECT
	PenID,
	PenName,
	[Total of Pen Material] = COUNT(ptd.PurchaseTransactionID)
FROM PurchaseTransactionHeader pth
	JOIN PurchaseTransactionDetail ptd
		ON pth.PurchaseTransactionID = ptd.PurchaseTransactionID
	JOIN PenMaterial pml
		ON ptd.PenMaterialID = pml.PenMaterialID
	JOIN Pen p
		ON pml.PenMaterialID = p.PenMaterialID
GROUP BY PenID, PenName
HAVING PenName LIKE 'Milky%' 
	AND COUNT(ptd.PurchaseTransactionID) > 6

--3
SELECT
	CustomerName,
	[Sales Transaction Date] = CONVERT(VARCHAR, SalesTransactionDate, 102),
	[Total Pen Type] = COUNT(PenID),
	[Total Quantity] = SUM(Qty)
FROM Customer cu
	JOIN SalesTransactionHeader sth
		ON cu.CustomerID = sth.CustomerID
	JOIN SalesTransactionDetail std
		ON sth.SalesTransactionID = std.SalesTransactionID
group by CustomerName, SalesTransactionDate
HAVING DAY(SalesTransactionDate) = 9
	AND SUM(Qty) > 10

--4
SELECT
	StaffName,
	[Staff Gender] = LEFT(StaffGender, 1),
	CustomerName,
	[Total Sales Transaction] = COUNT(sth.SalesTransactionID)
FROM Staff st
	JOIN SalesTransactionHeader sth
		ON sth.StaffID = st.StaffID
	JOIN SalesTransactionDetail std
		ON sth.SalesTransactionID = std.SalesTransactionID
	JOIN Customer c
		ON sth.CustomerID = c.CustomerID
GROUP BY StaffName, StaffGender, CustomerName, SalesTransactionDate
HAVING DATEPART(day, SalesTransactionDate)%2 = 0
	AND SUM(Qty) <= 10

--5
SELECT DISTINCT
	[Customer Name] = UPPER(CustomerName),
	CustomerGender,
	sth.SalesTransactionID
FROM Customer cu
	JOIN SalesTransactionHeader sth
		ON cu.CustomerID = sth.CustomerID
	JOIN SalesTransactionDetail std
		ON sth.SalesTransactionID = std.SalesTransactionID,
	(
		SELECT 
			AVG(Qty) as avgstd
		FROM SalesTransactionDetail
	) as sub
	WHERE Qty > sub.avgstd 
		AND DAY(SalesTransactionDate) = 22 

--6
SELECT
	VendorName,
	[PurchaseDate] = CONVERT(VARCHAR, PurchaseTransactionDate, 106),
	[MaterialName] = LOWER(PenMaterialName)
FROM Vendor vdr
	JOIN PurchaseTransactionHeader pth
		ON vdr.VendorID = pth.VendorID
	JOIN PurchaseTransactionDetail ptd
		ON pth.PurchaseTransactionID = ptd.PurchaseTransactionID
	JOIN PenMaterial pm
		ON pm.PenMaterialID = ptd.PenMaterialID,
	(
		SELECT
			[avgPrice] = AVG(PenMaterialPrice)
		FROM  PenMaterial
	) AS sub
WHERE PenMaterialPrice > sub.avgPrice 
	AND VendorName LIKE ('% Industry')

--7
SELECT
	[Total Purchase Transaction] = CONCAT (COUNT(pth.PurchaseTransactionID), ' Transaction(s)'),
	VendorName,
	[Staff Name] = SUBSTRING (StaffName, 1, CHARINDEX(' ', StaffName)),
	PurchaseTransactionDate
FROM PurchaseTransactionHeader pth
	JOIN Vendor vd
		ON pth.VendorID = vd.VendorID
	JOIN Staff st
		ON pth.StaffID = st.StaffID
	JOIN PurchaseTransactionDetail ptd
		ON pth.PurchaseTransactionID = ptd.PurchaseTransactionID,
	(
		SELECT
			AVG(Qty) as avgptd 
		FROM PurchaseTransactionDetail
	) as sub
	WHERE Qty < avgptd
		AND DATENAME(WEEKDAY, PurchaseTransactionDate) = 'Sunday'
GROUP BY VendorName, StaffName, PurchaseTransactionDate

--8
/*
8.	Display VendorName, Transaction Date
	(obtained from purchases date in ‘dd mon yyyy’ format),
	PenMaterialName, and Material Number
	(obtained from PenMaterialId by replacing the first three characters with ‘PM’)
	for every purchase transaction with the pen material stock is greater than the average 
		of all pen material stock and the total price (obtained from the sum of
		transaction quantity multiplied with pen material price) is greater
	than 500000. Sort the result by vendor name in descending order.
(alias subquery) 
*/
SELECT
	VendorName,
	[Transaction Date] = CONVERT(VARCHAR, PurchaseTransactionDate, 113),
	PenMaterialName,
	[Material Number] = 'PM' + RIGHT(pm.PenMaterialID, 3)
FROM Vendor v
	JOIN PurchaseTransactionHeader pth
		ON v.VendorID = pth.VendorID
	JOIN PurchaseTransactionDetail ptd
		ON pth.PurchaseTransactionID = ptd.PurchaseTransactionID
	JOIN PenMaterial pm
		ON ptd.PenMaterialID = pm.PenMaterialID,
	(
		SELECT
			[avgstock] = AVG(PenMaterialStock),
			[totalprice] = SUM(Qty)
		FROM PenMaterial pm 
			JOIN PurchaseTransactionDetail ptd
				ON pm.PenMaterialID = ptd.PenMaterialID
	) as stock
	WHERE PenMaterialStock > stock.avgstock AND stock.totalprice *PenMaterialPrice > 500000
GROUP BY VendorName, PenMaterialName, PenMaterialPrice, PurchaseTransactionDate, pm.PenMaterialID, PenMaterialStock
ORDER BY VendorName DESC

--9
CREATE VIEW ViewSalesTransaction as
SELECT	
	StaffName,
	CustomerName,
	[Total Sales Transaction] = COUNT(sth.SalesTransactionID),
	[Maximum Sales] = MAX(Qty)
FROM Staff st
	JOIN SalesTransactionHeader sth
		ON st.StaffID = sth.StaffID
	JOIN Customer cu
		ON sth.CustomerID = cu.CustomerID
	JOIN SalesTransactionDetail std
		ON sth.SalesTransactionID = std.SalesTransactionID
GROUP BY StaffName, CustomerName
HAVING CustomerName LIKE 'c%' 
	AND COUNT(sth.SalesTransactionID) > 2

--10
CREATE VIEW ViewPurchaseDetail as
SELECT
	VendorName,
	[Total Purchase Quantity] = SUM(Qty),
	[Total Purchase Transaction] = COUNT(pth.PurchaseTransactionID)
FROM Vendor vd
	JOIN PurchaseTransactionHeader pth
		ON vd.VendorID = pth.VendorID
	JOIN PurchaseTransactionDetail ptd
		ON pth.PurchaseTransactionID = ptd.PurchaseTransactionID
	JOIN Staff st
		ON st.StaffID = pth.StaffID
GROUP BY VendorName, StaffGender
HAVING StaffGender LIKE 'Male' 
	AND COUNT(pth.PurchaseTransactionID) > 1
