-- Chapter 4 Demos
-- Pg 103 two table join, joining Vendors and Invoices
USE AP
SELECT * 
FROM Vendors;

SELECT InvoiceNumber, VendorName FROM Invoices
JOIN Vendors on Vendors.VendorID = Invoices.VendorID

SELECT InvoiceNumber, VendorName
FROM Invoices AS I
JOIN Vendors AS V on V.VendorID = I.VendorID

-- P107 using fully qualified object names

SELECT * FROM AP.dbo.Vendors

-- p.109 joinging on multiple items

SELECT * 
FROM Invoices I 
JOIN InvoiceLineItems LI ON I.InvoiceID = LI.InvoiceID
AND I.InvoiceTotal > LI.InvoiceLineItemAmount
ORDER BY InvoiceNumber

-- changing 2nd condition to where clause, works the same
SELECT * 
FROM Invoices I 
JOIN InvoiceLineItems LI ON I.InvoiceID = LI.InvoiceID
WHERE I.InvoiceTotal > LI.InvoiceLineItemAmount
ORDER BY InvoiceNumber


-- Vendors table self join
-- find vendors that share a common city
SELECT DISTINCT V1.VendorName, V1.VendorCity, V1.VendorState
FROM Vendors V1
JOIN Vendors V2 ON V1.VendorCity = V2.VendorCity
					AND V1.VendorState = V2.VendorState
					AND V1.VendorID <> V2.VendorID
ORDER BY V1.VendorState, V1.VendorCity;


--p 115 implicit join - vendors and invoices

SELECT InvoiceNumber, VendorName FROM Invoices I 
JOIN Vendors V on V.VendorID = I.VendorID

SELECT InvoiceNumber, VendorName FROM Invoices I, Vendors V
WHERE V.VendorID = I.VendorID

-- Vendors and Invoices - LEFT Outer Join

SELECT VendorNAme, InvoiceNumber, InvoiceTotal
FROM Vendors V 
LEFT JOIN Invoices I ON V.VendorID = I.VendorID
ORDER BY V.VendorName

-- right join
SELECT VendorNAme, InvoiceNumber, InvoiceTotal
FROM Invoices I
RIGHT JOIN Vendors V ON I.VendorID = V.VendorID
ORDER BY V.VendorName

-- other type of outer join. Where you want nothing from one side
-- whcih businesses have done no business with us, and therefore do not appear in invoice table
SELECT VendorNAme, InvoiceNumber, InvoiceTotal
FROM Vendors V 
LEFT JOIN Invoices I ON V.VendorID = I.VendorID
WHERE InvoiceNumber IS NULL
ORDER BY V.VendorName

