-- 1. Write a SELECT statement that returns two columns from the Invoices table: VendorID and PaymentSum, where PaymentSum is the sum of the PaymentTotal column
-- Group result set by VendorID
USE AP
SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
	FROM Invoices 
GROUP BY VendorID

