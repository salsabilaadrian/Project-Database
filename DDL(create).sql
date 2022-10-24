USE SaraviaPen
--CREATE
/* Every pen material has information like 
name, price, stock and an identification number with the following format:*/
CREATE TABLE PenMaterial(
	PenMaterialID CHAR(6) PRIMARY KEY CHECK (PenMaterialID LIKE 'PML[0-9][0-9][0-9]') NOT NULL,
	PenMaterialName VARCHAR(255) NOT NULL,
	PenMaterialPrice INTEGER NOT NULL,
	PenMaterialStock INTEGER CHECK (PenMaterialStock >= 100)NOT NULL
)

/* Every pen has information like 
name, price, stock, and an identification code with the following format:*/
CREATE TABLE Pen(
	PenID CHAR(6) PRIMARY KEY CHECK (PenID LIKE 'PEN[0-9][0-9][0-9]') NOT NULL,
	PenMaterialID CHAR(6) FOREIGN KEY REFERENCES PenMaterial(PenMaterialID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PenName VARCHAR(255) CHECK (PenName LIKE '%Pen') NOT NULL,
	PenPrice INTEGER CHECK (PenPrice >= 10000 OR PenPrice <= 50000) NOT NULL,
	PenStock INTEGER NOT NULL
)

/*Customer who wants to buy a pen must has complete personal information like 
name, gender, date of birth, phone number, and address. Every customer has 
an identification code with the following format:*/
CREATE TABLE Customer(
	CustomerID CHAR(6) PRIMARY KEY CHECK (CustomerID LIKE 'CTR[0-9][0-9][0-9]') NOT NULL,
	CustomerName VARCHAR(255) NOT NULL,
	CustomerGender VARCHAR(6) NOT NULL,
	CustomerDOB DATE NOT NULL,
	CustomerAddress VARCHAR(255) NOT NULL,
	CustomerPhoneNumber VARCHAR(12) CHECK (LEN(CustomerPhoneNumber) = 12) NOT NULL 
)

/* Every staff who works in Saravia Pen has a complete personal information like 
name, gender, date of birth, phone number, address, salary, and 
an identification code with the following format:*/
CREATE TABLE Staff(
	StaffID CHAR(6) PRIMARY KEY CHECK (StaffID LIKE 'STF[0-9][0-9][0-9]') NOT NULL,
	StaffName VARCHAR(255) CHECK (LEN(StaffName) >= 3) NOT NULL,
	StaffGender VARCHAR(6) CHECK (StaffGender LIKE 'Male' OR StaffGender LIKE 'Female') NOT NULL,
	StaffDOB DATE NOT NULL,
	StaffAddress VARCHAR(255) NOT NULL,
	StaffPhoneNumber VARCHAR(255) CHECK (LEN(StaffPhoneNumber) = 12) NOT NULL 
)

CREATE TABLE Vendor(
	VendorID CHAR(6) PRIMARY KEY CHECK (VendorID LIKE 'VDR[0-9][0-9][0-9]') NOT NULL,
	VendorName VARCHAR(255) NOT NULL,
	VendorAddress VARCHAR(255) NOT NULL,
	VendorEmail VARCHAR(255) CHECK(VendorEmail LIKE '%@%') NOT NULL,
	VendorPhoneNumber VARCHAR(255) CHECK (LEN(VendorPhoneNumber) = 12) NOT NULL 
)


CREATE TABLE PaymentType(
	PaymentTypeID CHAR(6) PRIMARY KEY CHECK (PaymentTypeID LIKE 'PTY[0-9][0-9][0-9]') NOT NULL,
	PaymentTypeName VARCHAR(255) NOT NULL
)

/* Every sales transaction made by the customer have all the information about 
the customer, the staff, the transaction date, payment type, the pen(s) purchased, and the quantity of each pen. 
Each sales transaction has an identification code with the following format:*/
CREATE TABLE SalesTransactionHeader(
	SalesTransactionID CHAR(6) PRIMARY KEY CHECK (SalesTransactionID LIKE 'SLT[0-9][0-9][0-9]') NOT NULL,
	PaymentTypeID CHAR(6) FOREIGN KEY REFERENCES PaymentType(PaymentTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(6) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StaffID CHAR(6) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesTransactionDate DATE CHECK (YEAR(SalesTransactionDate) LIKE '2020')NOT NULL
)

CREATE TABLE SalesTransactionDetail (
	SalesTransactionID CHAR(6) FOREIGN KEY REFERENCES SalesTransactionHeader(SalesTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PenID CHAR(6) FOREIGN KEY REFERENCES Pen(PenID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Qty INTEGER NOT NULL,
	PRIMARY KEY(SalesTransactionID, PenID)
)

CREATE TABLE PurchaseTransactionHeader (
	PurchaseTransactionID CHAR(6) PRIMARY KEY CHECK (PurchaseTransactionID LIKE 'PCT[0-9][0-9][0-9]') NOT NULL,
	StaffID CHAR(6) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	VendorID CHAR(6) FOREIGN KEY REFERENCES Vendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PaymentTypeID CHAR(6) FOREIGN KEY REFERENCES PaymentType(PaymentTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseTransactionDate DATE NOT NULL
)

CREATE TABLE PurchaseTransactionDetail (
	PurchaseTransactionID CHAR(6) FOREIGN KEY REFERENCES PurchaseTransactionHeader(PurchaseTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PenMaterialID CHAR(6) FOREIGN KEY REFERENCES PenMaterial(PenMaterialID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Qty INTEGER NOT NULL,
	PRIMARY KEY(PurchaseTransactionID, PenMaterialID)
)
