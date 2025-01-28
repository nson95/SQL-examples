-- Notes from ch6


--p. 161
-- Return all invoices who's total > avg invoice total

USE AP

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal	
	FROM Invoices
	WHERE InvoiceTotal > 
	(SELECT AVG(InvoiceTotal)
	FROM Invoices)
	ORDER BY InvoiceTotal


-- p. 163 A query that uses an inner join
-- JOIN invoices and Vendors, show invoicenumber, invoicedate, invoicetotal, invoice vendors from CA


SELECT InvoiceNumber, InvoiceDate, InvoiceTotal 
	FROM Invoices i
	JOIN Vendors v ON v.VendorID = i.VendorID
	WHERE VendorState = 'CA'
	ORDER BY InvoiceDate


-- Same query as a subquery

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal 
	FROM Invoices i
WHERE VendorID IN
	(SELECT VendorID 
	FROM Vendors 
	WHERE VendorState = 'CA')
ORDER BY InvoiceDate

-- p.165 
-- Vendors with no invoices

SELECT VendorID, VendorName, VendorState
	FROM Vendors
	WHERE VendorID NOT IN
	(SELECT DISTINCT VendorID FROM Invoices)

-- same example without subquery

SELECT i.VendorID, VendorName, VendorState
	FROM Vendors V
	LEFT JOIN Invoices i 
		ON v.VendorID = i.VendorID
	WHERE i.VendorID IS NULL

-- p.167
-- Invoice payment details. see where balance > 0 and less than avg balance due
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, (InvoiceTotal -PaymentTotal -CreditTotal) AS BalanceDue
	FROM Invoices
		WHERE (InvoiceTotal -PaymentTotal -CreditTotal) > 0
		AND (InvoiceTotal -PaymentTotal -CreditTotal) <
		(SELECT AVG(InvoiceTotal -PaymentTotal -CreditTotal) 
		FROM Invoices
		WHERE (InvoiceTotal-PaymentTotal-CreditTotal > 0))
	ORDER BY InvoiceTotal


--p. 168 using ALL keyword

SELECT *
	FROM Invoices
WHERE VendorID = 34
-- all invoices who's totals are > vendorid 34's invoices

SELECT VendorName, InvoiceNumber, InvoiceTotal 
	FROM Invoices i
	JOIN Vendors v ON i.VendorID = v.VendorID
	WHERE InvoiceTotal > ALL
	(SELECT InvoiceTotal
	FROM Invoices
	WHERE VendorID = 34)
	ORDER BY VendorName


-- p. 171 InvoiceTotals for VendorID 115
-- any or some can be used interchangably
SELECT InvoiceTotal
	FROM Invoices
	WHERE VendorID = 115
	


-- Invoices < any or some of vendor 115's

SELECT *
	FROM Vendors v
	JOIN Invoices i ON i.VendorID = v.VendorID
	WHERE InvoiceTotal < ANY(SELECT InvoiceTotal
	FROM Invoices
	WHERE VendorID = 115)


-- correlated subqueries, similar to looping through result set in oop
-- subquery uses field of an outer query
-- p.173
-- Show Vendor Invoices that are above their own average invoices

SELECT VendorID, InvoiceNumber, InvoiceTotal	
	FROM Invoices i1
		WHERE InvoiceTotal >
		(SELECT AVG(InvoiceTotal) 
			FROM Invoices i2
			WHERE i2.VendorID = i1.VendorID)
		ORDER BY VendorID, InvoiceTotal


-- p. 175 WHERE EXISTS or NOT EXISTS
-- Vendors without Invoices


SELECT VendorID, VendorName, VendorState
	FROM Vendors v
	WHERE NOT EXISTS 
		(SELECT * 
			FROM Invoices i
		WHERE i.VendorID = v.VendorID)
