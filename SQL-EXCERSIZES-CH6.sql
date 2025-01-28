USE AP


-- 1.
SELECT VendorName
	FROM Vendors v
	WHERE VendorID IN
	(SELECT VendorID FROM Invoices)
	ORDER BY VendorName

-- 2.

SELECT InvoiceNumber, InvoiceTotal
	FROM Invoices i
	WHERE PaymentTotal > 
	(SELECT AVG(PaymentTotal)
	FROM Invoices
	WHERE Invoicetotal != 0)


-- 3.

SELECT InvoiceNumber, InvoiceTotal
	FROM Invoices i
	WHERE PaymentTotal > 
	ALL(SELECT TOP 50 PERCENT PaymentTotal
	FROM Invoices
	WHERE Invoicetotal != 0
	GROUP BY PaymentTotal)
	ORDER BY InvoiceTotal DESC


-- 4.

SELECT AccountNo, AccountDescription
	FROM GLAccounts gl
	WHERE NOT EXISTS
	(SELECT AccountNo
	FROM InvoiceLineItems li
	WHERE gl.AccountNo = li.AccountNo)
	ORDER BY AccountNo

-- 5.

SELECT VendorName, i.InvoiceID, InvoiceSequence, InvoiceLineItemAmount
	FROM InvoiceLineItems ili
	JOIN Invoices i
	ON i.InvoiceID = ili.InvoiceID
	JOIN Vendors v 
	ON i.VendorID = v.VendorID
	WHERE i.VendorID IN
	(SELECT * FROM InvoiceLineItems
	WHERE InvoiceSequence > 1)

	

-- 6. 

SELECT SUM(InvoiceMax) AS SumTotalInvoices
	FROM (SELECT VendorID, MAX(InvoiceTotal) AS InvoiceMax
	FROM Invoices 
	WHERE InvoiceTotal - PaymentTotal - CreditTotal >0
	GROUP BY VendorID)
	AS InvoiceMax


	-- questions about having to declare InvoiceMax 2x


-- 7.
USE AP
SELECT VendorName, VendorCity, VendorState
	FROM Vendors
	WHERE VendorCity + VendorState NOT IN (SELECT 
	VendorCity + VendorState
	FROM Vendors
	GROUP BY VendorCity + VendorState 
	HAVING COUNT(*) > 1)
	ORDER BY VendorCity, VendorState
	


-- 8. 

SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices i
	JOIN Vendors v 
	ON i.VendorID = v.VendorID
	WHERE InvoiceDate = (SELECT MIN(InvoiceDate)
	-- essentially aliasing when having to use an aggregate
	FROM Invoices i2
	WHERE i.VendorID = i2.VendorID)
	





