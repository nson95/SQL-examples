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


-- 4.

SELECT AccountNo, AccountDescription
	FROM GLAccounts gl
	WHERE NOT EXISTS
	(SELECT AccountNo
	FROM InvoiceLineItems li
	WHERE gl.AccountNo = li.AccountNo)
	ORDER BY AccountNo




