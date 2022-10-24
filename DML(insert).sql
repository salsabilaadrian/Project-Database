USE SaraviaPen


INSERT INTO Customer VALUES
('CTR001', 'Salino Tengko', 'Male', '2001-10-15', 'Kemanggisan, Jakarta', '081277610978'),
('CTR002', 'Salsabila Adryan', 'Female', '2001-12-30', 'Dago, Jawa Barat', '082173410298'),
('CTR003', 'Jeremia Sitorus', 'Male', '2001-09-27', 'Sudirman, Jakarta', '081359086324'),
('CTR004', 'Fisalma Maradita', 'Female', '2001-08-19', 'Karang Tengah, Banten', '081262870280'),
('CTR005', 'Nashwa Shakira', 'Female', '2002-12-17', 'Gading Serpong, Banten', '081219122108'),
('CTR006', 'Sekar Arum', 'Female', '2001-02-04', 'Bintaro, Banten', '085791319031'),
('CTR007', 'Carum Zahira', 'Female', '1995-06-10', 'Bintaro, Banten', '081398457395'),
('CTR008', 'Najwa Sihab', 'Female', '2000-11-29', 'Palmerah, Jakarta', '081931931455'),
('CTR009', 'Ceza Arap', 'Male', '1988-10-30', 'Alam Sutera, Jakarta', '082103483237'),
('CTR010', 'Deddy Cahyadi', 'Male', '1990-04-25', 'Kebon Jeruk, Jakarta', '085693912497')



INSERT INTO Staff VALUES
('STF001', 'Muhammad Ansalma', 'Male', '2000-08-10', 'Slipi, Jakarta', '081154661905'),
('STF002', 'Salmanis Adita', 'Female', '1994-01-19', 'Ciledug, Jakarta', '081170549667'),
('STF003', 'Francesco Adrian', 'Male', '1997-08-20', 'Pasar Minggu, Jakarta', '081181993172'),
('STF004', 'Salino Hidayat', 'Male', '2001-03-14', 'Kelapa Gading, Jakarta', '081132467136'),
('STF005', 'Tengku Umar', 'Male', '1998-02-14', 'Ciracas, Jakarta', '081176171362'),
('STF006', 'Radita Salfa', 'Female', '1998-02-27', 'Pondok Gede, Jawa Barat', '081126113295'),
('STF007', 'Salsa', 'Female', '2001-12-30', 'Fatmawati, Jakarta', '081117184155'),
('STF008', 'Jere Miasito', 'Male', '1995-09-28', 'Blok A, Jakarta', '081106641227'),
('STF009', 'Gunawan Setiadi', 'Male', '2000-12-17', 'Bintaro, Jakarta', '081168327075'),
('STF010', 'Shakira Humaira', 'Female', '1999-08-21', 'Gading Serpong, Jakarta', '081120999462')



INSERT INTO Vendor VALUES
('VDR001', 'Maju Mundur Makmur', 'Ciledug, Banten', 'maju.mundur123@outlook.com', '081287632108'),
('VDR002', 'Maju Enak', 'Palmerah, Jakarta', 'enak.majumaju@outlook.com', '081242898298'),
('VDR003', 'Mundur Sejahtera', 'Cijantung, Jakarta', 'sejahtera.tidakmundur@gmail.com', '081298429842'),
('VDR004', 'Selamat Dunia', 'Tanah Abang, Jakarta', 'dunia.selamat@outlook.com', '081213019301'),
('VDR005', 'Dia.Lo.Gue', 'Manggarai, Jakarta', 'dia.logue!@gmail.com', '081280349445'),
('VDR006', 'Sejahtera Abadi', 'Mangga Dua, Jakarta', 'abadi.sejahtera@gmail.com', '081201391942'),
('VDR007', 'Sentosa Jaya', 'Depok, Jawa Barat',    'jaya.sentosa12@gmail.com', '081249342244'),
('VDR008', 'Jaya Makmur Industry', 'Cibubur, Jawa Barat', 'makmurdiri.jaya@outlook.com', '081212124240'),
('VDR009', 'Makmur Diri Industry', 'Alam Sutera, Banten', 'diriini.makmur@gmail.com', '081212311442'),
('VDR010', 'Abadi Jaya', 'Sawanga, Jakarta', 'jaya.abadi@outlook.com', '081231314141')



INSERT INTO PenMaterial VALUES
('PML001', 'RubberPlastic', 100, 500),
('PML002', 'GlossyPlastic', 200, 200),
('PML003', 'MattePlastic', 350, 150),
('PML004', 'GlassPlastic', 250, 300),
('PML005', 'DovePlastic', 240, 450),
('PML006', 'DupePlastic', 130, 3500),
('PML007', 'RealPlastic', 4000, 250),
('PML008', 'StandartPlastic', 100, 100),
('PML009', 'PremiumPlastic', 30000, 1000),
('PML010', 'VIPPlastic', 700, 130)


INSERT INTO PaymentType VALUES
('PTY001', 'Cash'),
('PTY002', 'Debit'),
('PTY003', 'Credit')



INSERT INTO Pen VALUES
('PEN001', 'PML001', 'JoykoPen', 15000, 100),
('PEN002', 'PML002', 'MilkyKenkoPen', 14000, 100),
('PEN003', 'PML003', 'KikiPen', 23000, 110),
('PEN004', 'PML004', 'KokoPen', 40000, 150),
('PEN005', 'PML005', 'JapanPen', 20000, 150),
('PEN006', 'PML006', 'KoreaPen', 35000, 600),
('PEN007', 'PML007', 'MilkyAPen', 45000, 250),
('PEN008', 'PML008', 'SiriPen', 37000, 180),
('PEN009', 'PML009', 'SarasaPen', 20000, 100),
('PEN010', 'PML004', 'QiuPen', 25000, 100)



INSERT INTO SalesTransactionHeader VALUES
('SLT001', 'PTY001', 'CTR001', 'STF001', '2020-10-09'),
('SLT002', 'PTY001', 'CTR001', 'STF001', '2020-03-25'),
('SLT003', 'PTY002', 'CTR002', 'STF003', '2020-09-22'),
('SLT004', 'PTY001', 'CTR003', 'STF002', '2020-11-15'),
('SLT005', 'PTY002', 'CTR004', 'STF004', '2020-12-09'),
('SLT006', 'PTY002', 'CTR005', 'STF005', '2020-07-25'),
('SLT007', 'PTY002', 'CTR005', 'STF006', '2020-06-22'),
('SLT008', 'PTY002', 'CTR006', 'STF007', '2020-10-20'),
('SLT009', 'PTY001', 'CTR007', 'STF008', '2020-09-01'),
('SLT010', 'PTY001', 'CTR008', 'STF001', '2020-03-27'),
('SLT011', 'PTY002', 'CTR009', 'STF009', '2020-05-18'),
('SLT012', 'PTY001', 'CTR009', 'STF009', '2020-10-26'),
('SLT013', 'PTY001', 'CTR009', 'STF009', '2020-10-17'),
('SLT014', 'PTY002', 'CTR010', 'STF010', '2020-04-21'),
('SLT015', 'PTY001', 'CTR002', 'STF003', '2020-02-23')



INSERT INTO SalesTransactionDetail VALUES
('SLT001', 'PEN002', 12),
('SLT002', 'PEN009', 2),
('SLT003', 'PEN004', 55),
('SLT004', 'PEN001', 5),
('SLT005', 'PEN002', 29),
('SLT006', 'PEN009', 8),
('SLT007', 'PEN006', 60),
('SLT008', 'PEN010', 9),
('SLT009', 'PEN007', 10),
('SLT010', 'PEN008', 11),
('SLT011', 'PEN009', 5),
('SLT012', 'PEN010', 6),
('SLT013', 'PEN008', 7),
('SLT014', 'PEN002', 8),
('SLT015', 'PEN001', 2),
('SLT002', 'PEN006', 5),
('SLT001', 'PEN005', 10),
('SLT005', 'PEN003', 15),
('SLT007', 'PEN002', 20),
('SLT008', 'PEN007', 25),
('SLT009', 'PEN010', 30),
('SLT010', 'PEN003', 14),
('SLT015', 'PEN005', 5),
('SLT014', 'PEN004', 11),
('SLT002', 'PEN005', 16)



INSERT INTO PurchaseTransactionHeader VALUES
('PCT001', 'STF001', 'VDR001', 'PTY001', '2020-01-08'),
('PCT002', 'STF001', 'VDR001', 'PTY001', '2020-01-02'),
('PCT003', 'STF003', 'VDR002', 'PTY002', '2020-02-06'),
('PCT004', 'STF002', 'VDR003', 'PTY003', '2020-02-12'),
('PCT005', 'STF004', 'VDR004', 'PTY002', '2020-03-15'),
('PCT006', 'STF005', 'VDR005', 'PTY003', '2020-03-24'),
('PCT007', 'STF006', 'VDR005', 'PTY003', '2020-04-29'),
('PCT008', 'STF007', 'VDR006', 'PTY002', '2020-04-10'),
('PCT009', 'STF008', 'VDR007', 'PTY001', '2020-05-06'),
('PCT010', 'STF001', 'VDR008', 'PTY001', '2020-06-08'),
('PCT011', 'STF009', 'VDR009', 'PTY003', '2020-07-15'),
('PCT012', 'STF002', 'VDR010', 'PTY003', '2020-08-19'),
('PCT013', 'STF010', 'VDR009', 'PTY001', '2020-09-17'),
('PCT014', 'STF010', 'VDR010', 'PTY002', '2020-10-16'),
('PCT015', 'STF003', 'VDR002', 'PTY001', '2020-11-28')



INSERT INTO PurchaseTransactionDetail VALUES
('PCT001', 'PML002', 1),
('PCT002', 'PML003', 2),
('PCT003', 'PML004', 3),
('PCT004', 'PML001', 5),
('PCT005', 'PML002', 2),
('PCT006', 'PML002', 8),
('PCT007', 'PML006', 10),
('PCT008', 'PML010', 9),
('PCT009', 'PML002', 10),
('PCT010', 'PML008', 11),
('PCT011', 'PML009', 30),
('PCT012', 'PML010', 6),
('PCT013', 'PML008', 7),
('PCT014', 'PML002', 8),
('PCT015', 'PML001', 2),
('PCT001', 'PML003', 5),
('PCT007', 'PML005', 10),
('PCT008', 'PML002', 15),
('PCT009', 'PML006', 20),
('PCT010', 'PML007', 25),
('PCT003', 'PML010', 30),
('PCT004', 'PML003', 14),
('PCT005', 'PML005', 5),
('PCT004', 'PML002', 11),
('PCT010', 'PML005', 16)
