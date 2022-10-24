USE SaraviaPen


-- Sales Transaction Simulation
INSERT INTO SalesTransactionHeader VALUES
('SLT016', 'PTY001', 'CTR005', 'STF005', '2020-12-29')
INSERT INTO SalesTransactionDetail VALUES
('SLT016', 'PEN001', 96),
('SLT016', 'PEN009', 12),
('SLT016', 'PEN010', 29)


--Header
SELECT
	sth.SalesTransactionID,
	pty.PaymentTypeID,
	cu.CustomerID,
	st.StaffID,
	SalesTransactionDate
FROM SalesTransactionHeader sth
	JOIN SalesTransactionDetail std
		ON sth.SalesTransactionID = std.SalesTransactionID
	JOIN Pen p
		ON std.PenID = p.PenID
	JOIN PaymentType pty
		ON sth.PaymentTypeID = pty.PaymentTypeID
	JOIN Customer cu
		ON sth.CustomerID = cu.CustomerID
	JOIN Staff st
		ON sth.StaffID = st.StaffID
WHERE sth.SalesTransactionID LIKE 'SLT016'

--Detail
SELECT
	sth.SalesTransactionID,
	p.PenID,
	Qty
FROM SalesTransactionHeader sth
	JOIN SalesTransactionDetail std
		ON sth.SalesTransactionID = std.SalesTransactionID
	JOIN Pen p
		ON std.PenID = p.PenID
	JOIN PaymentType pty
		ON sth.PaymentTypeID = pty.PaymentTypeID
	JOIN Customer cu
		ON sth.CustomerID = cu.CustomerID
	JOIN Staff st
		ON sth.StaffID = st.StaffID
WHERE sth.SalesTransactionID LIKE 'SLT016'

-- Purchase Transaction Simulation
INSERT INTO PurchaseTransactionHeader VALUES
('PCT016', 'STF005', 'VDR002', 'PTY001', '2020-12-01')
INSERT INTO PurchaseTransactionDetail VALUES
('PCT016', 'PML002', 69),
('PCT016', 'PML004', 321),
('PCT016', 'PML006', 123),
('PCT016', 'PML008', 100),
('PCT016', 'PML010', 92)

--Header
SELECT
	pth.PurchaseTransactionID,
	st.StaffID,
	v.VendorID,
	pty.PaymentTypeID,
	PurchaseTransactionDate
FROM PurchaseTransactionHeader pth
	JOIN PurchaseTransactionDetail ptd
		ON pth.PurchaseTransactionID = ptd.PurchaseTransactionID
	JOIN Staff st
		ON pth.StaffID = st.StaffID
	JOIN Vendor v
		ON pth.VendorID = v.VendorID
	JOIN PaymentType pty
		ON pth.PaymentTypeID = pty.PaymentTypeID
WHERE pth.PurchaseTransactionID LIKE 'PCT016'
	AND st.StaffID LIKE 'STF005'
	AND v.VendorID LIKE 'VDR002'
	AND pty.PaymentTypeID LIKE 'PTY001'
	AND PurchaseTransactionDate LIKE '2020-12-01'


--Detail
SELECT
	pth.PurchaseTransactionID,
	ptd.PenMaterialID,
	Qty
FROM PurchaseTransactionHeader pth
	JOIN PurchaseTransactionDetail ptd
		ON pth.PurchaseTransactionID = ptd.PurchaseTransactionID
	JOIN Staff st
		ON pth.StaffID = st.StaffID
	JOIN Vendor v
		ON pth.VendorID = v.VendorID
	JOIN PaymentType pty
		ON pth.PaymentTypeID = pty.PaymentTypeID
WHERE pth.PurchaseTransactionID LIKE 'PCT016'
	AND st.StaffID LIKE 'STF005'
	AND v.VendorID LIKE 'VDR002'
	AND pty.PaymentTypeID LIKE 'PTY001'
	AND PurchaseTransactionDate LIKE '2020-12-01'