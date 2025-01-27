-- p. 137 114 rows on Invoices table. # of invoices, sum total due where total > 0
USE AP

SELECT InvoiceNumber, (InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
	FROM Invoices
	WHERE

	-- demonstration on counting function
SELECT COUNT (*)
FROM Invoices

-- summing result set and counting number of results
SELECT COUNT(*) AS NumberOfInvoices, SUM(Invoicetotal -PaymentTotal -Credittotal) AS TotalDue
	FROM Invoices 
	WHERE Invoicetotal -PaymentTotal -Credittotal >0

-- how many total invoices, average invoice total, and total invoice amount. for invoices after 7/1/22

SELECT 'After 7/1/2022' AS SelectionDate,
	COUNT(*) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AverageInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount,
	MIN(InvoiceTotal) AS LowestInvoiceAmount,
	MAX(invoiceTotal) AS HighestInvoiceTotal
		FROM Invoices
	WHERE InvoiceDate > '2022-07-01'

--	p139. First or Last Vendor alphabetically
SELECT Min(VendorName) AS FirstVendor,
		MAX(VendorName) AS LastVendor,
		COUNT(VendorName) AS NumberOfVendors
		FROM Vendors


-- p. 139 using DISTINCT keyword in query summaries - number of distinct vendors
SELECT COUNT(DISTINCT VendorID) AS NumberOfVendors
	FROM Invoices

-- p. 141 using GROUP BY, AVG invoice amount by vendors

SELECT VendorID, AVG(InvoiceTotal) as AverageInvoiceAmount
	FROM Invoices
GROUP BY VendorID
	HAVING AVG(InvoiceTotal) >2000
	ORDER BY AverageInvoiceAmount DESC



	-- p. 143 # of invoices by vendor

SELECT VendorID, COUNT(*) AS InvoiceQuantity
	FROM Invoices
	GROUP BY VendorID


--p. 143 vendors grouped by 3 different collumns, city, inv qty, and inv avg

SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQuantity, AVG(InvoiceTotal) AS InvoiceAVG
	FROM Invoices I
	JOIN Vendors V ON I.VendorID = V.VendorID
	GROUP BY VendorState, VendorCity
	ORDER BY VendorState, VendorCity



	-- limit results using HAVING clause (having always comes after group by)
	SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQuantity, AVG(InvoiceTotal) AS InvoiceAVG
	FROM Invoices I
	JOIN Vendors V ON I.VendorID = V.VendorID
	GROUP BY VendorState, VendorCity
	HAVING COUNT(*) >=2
	ORDER BY VendorState, VendorCity


	--p. 145 search condition in the HAVING CLAUSE

	SELECT VendorName, COUNT(*) AS InvoiceQTY,
		AVG(InvoiceTotal) AS InvoiceAVG
		FROM Vendors V
		JOIN Invoices I ON V.VendorID = I.VendorID
		GROUP BY VendorName
		HAVING AVG(InvoiceTotal) >500
		ORDER BY InvoiceQTY Desc


--p.145 search condition in the where clause
SELECT VendorName, COUNT(*) AS InvoiceQTY,
		AVG(InvoiceTotal) AS InvoiceAVG
		FROM Vendors V
		JOIN Invoices I ON V.VendorID = I.VendorID
	WHERE InvoiceTotal > 500
	GROUP BY VendorName
	ORDER BY InvoiceQTY Desc


--p. 149  Invoices by Vendor, grouped, to get invoice count and invoicetotal with summary row
SELECT VendorID, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
	FROM Invoices
	GROUP BY rollup(VendorID)


-- rollup on multiple collumns, vendors from IA NJ ROLLUP by vendor state and city

SELECT VendorState, VendorCity, COUNT(*) AS QTYVendors
	FROM Vendors
	WHERE VendorState IN ('IA', 'NJ')
	GROUP BY ROLLUP(VendorState, VendorCity)
	ORDER BY VendorState DESC, VendorCity DESC

	--p. 151

SELECT VendorID, COUNT(*) AS InvoiceCount,
	SUM(InvoiceTotal) AS InvoiceSUM
	FROM INVOICES
	GROUP BY CUBE(VendorID)

	SELECT VendorState, VendorCity, COUNT(*) AS QTYVendors
	FROM Vendors
	WHERE VendorState IN ('IA', 'NJ')
	GROUP BY CUBE(VendorState, VendorCity)
	ORDER BY VendorState DESC, VendorCity DESC


	--p. 153 GROUPING SETS, only sorts by state and then by city

	SELECT VendorState, VendorCity, COUNT(*) AS QTYVendors
	FROM Vendors
	WHERE VendorState IN ('IA', 'NJ')
	GROUP BY GROUPING SETS(VendorState, VendorCity)
	ORDER BY VendorState DESC, VendorCity DESC


-- Composite GROUPING

SELECT VendorState, VendorCity, VendorZIPCode, COUNT(*) AS QTYVendors
	FROM Vendors
	WHERE VendorState IN ('IA', 'NJ')
	GROUP BY GROUPING SETS((VendorState, VendorCity), VendorZipCode, ())
	ORDER BY VendorState DESC, VendorCity DESC

--p.155

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
	SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateTotal,
	COUNT(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateCount,
	AVG(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateAVG
	FROM Invoices