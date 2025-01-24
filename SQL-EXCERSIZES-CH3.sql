-- Chapter 3 Excersises
-- 1.
USE AP
SELECT VendorContactFName, VendorContactLName, VendorName FROM VENDORS 
ORDER BY VendorContactLName, VendorContactFName

-- 2.
SELECT InvoiceNumber AS Number, 
InvoiceTotal AS Total, 
PaymentTotal + CreditTotal AS Credits, 
InvoiceTotal - PaymentTotal - CreditTotal AS Balance 
FROM Invoices

-- 3. 
SELECT VendorContactLName +', ' +VendorContactFName AS "Full Name" FROM Vendors

-- 4.
SELECT InvoiceTotal, (InvoiceTotal*.1) AS "10%", (InvoiceTotal+InvoiceTotal*.1) AS "Plus 10%" FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY InvoiceTotal DESC

-- 5.
SELECT InvoiceNumber AS Number, 
InvoiceTotal AS Total, 
PaymentTotal + CreditTotal AS Credits, 
InvoiceTotal - PaymentTotal - CreditTotal AS Balance 
FROM Invoices
WHERE InvoiceTotal >= 500
AND InvoiceTotal <= 10000

-- 6.

SELECT VendorContactLName +', ' +VendorContactFName AS "Full Name" 
FROM Vendors
WHERE VendorContactLName LIKE '[A, B,C,E]%'
ORDER BY VendorContactLName, VendorContactFName;

-- 7.
SELECT * FROM Invoices 
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0 AND PaymentDate IS NOT NULL
OR InvoiceTotal - PaymentTotal - CreditTotal = 0 AND PaymentDate IS NULL;



