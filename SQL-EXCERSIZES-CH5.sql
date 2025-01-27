-- 1. Write a SELECT statement that returns two columns from the Invoices table: VendorID and PaymentSum, where PaymentSum is the sum of the PaymentTotal column
-- Group result set by VendorID
USE AP
SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
	FROM Invoices 
GROUP BY VendorID

-- 2. Write a SELECT statement that returns two columns: VendorName and PaymentSum, where PaymentSum is the sum of the PaymentTotal column.-- Group the result set by VendorName. Return only 10 rows, corresponding to the 10 vendors who’ve been paid the most. -- Hint: Use the TOP clause and join the Vendors table to the Invoices table.SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum	FROM Invoices I	JOIN Vendors V ON I.VendorID = V.VendorID	GROUP BY VendorName	ORDER BY PaymentSum DESC-- 3. Write a SELECT statement that returns three columns: VendorName, InvoiceCount, and InvoiceSum. -- InvoiceCount is the count of the number of invoices, and InvoiceSum is the sum of the InvoiceTotal column. -- Group the result set by vendor. Sort the result set so the vendor with the highest number of invoices appears first.SELECT VendorName, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum	FROM Vendors V	JOIN Invoices I ON V.VendorID = I.VendorID	GROUP BY VendorName	ORDER BY InvoiceCount DESC-- 4. Write a SELECT statement that returns three columns: AccountDescription, LineItemCount, and LineItemSum.-- LineItemCount is the number of entries in the InvoiceLineItems table that have that AccountNo. -- LineItemSum is the sum of the InvoiceLineItemAmount column for that AccountNo. -- Filter the result set to include only those rows with LineItemCount greater than 1. -- Group the result set by account description, and sort it by descending LineItemCount. Hint: Join the GLAccounts table to the InvoiceLineItems table.SELECT AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum		FROM InvoiceLineItems I	JOIN GLAccounts G ON G.AccountNo = I.AccountNo	GROUP BY AccountDescription	HAVING COUNT(*) > 1 	ORDER BY LineItemCount DESC-- 5. Modify the solution to exercise 4 to filter for invoices dated from October 1, 2022 to December 31, 2022.
-- Hint: Join the Invoices table so you can code a search condition based on InvoiceDate.SELECT AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum	FROM InvoiceLineItems LI	JOIN GLAccounts G ON G.AccountNo = LI.AccountNo	JOIN Invoices I ON LI.InvoiceID = I.InvoiceID	WHERE I.InvoiceDate > '2022-10-01' 	AND I.InvoiceDate < '2022-12-31'	GROUP BY AccountDescription	HAVING COUNT(*) > 1 	ORDER BY LineItemCount DESC-- 6 Write a SELECT statement that answers the following question: What is the total amount invoiced for each AccountNo? -- Use the ROLLUP operator to include a row that gives the grand total. SELECT AccountNo, SUM(InvoiceLineItemAmount) AS LineItemSUM 	FROM InvoiceLineItems	GROUP BY ROLLUP (AccountNo)-- 7.Write a SELECT statement that returns four columns: VendorName, Account-Description, LineItemCount, and LineItemSum. -- LineItemCount is the row count, and LineItemSum is the sum of the InvoiceLineItemAmount column. -- For each vendor and account, return the number and sum of line items, sorted first by vendor, then by account description. -- Hint: Use a four-table join.SELECT VendorName, AccountDescription AS "Account-Description", COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount)  AS LineItemSum	FROM Vendors V	JOIN Invoices I ON V.VendorID = I.VendorID	JOIN InvoiceLineItems LI ON LI.InvoiceID = I.InvoiceID	JOIN GLAccounts GL ON GL.AccountNo = li.AccountNo	GROUP BY VendorName, AccountDescription	ORDER BY VendorName, AccountDescription
-- 8.  Write a SELECT statement that answers this question: Which vendors are being paid from more than one account? 
-- Return two columns: the vendor name and the total number of accounts that apply to that vendor’s invoices. 
-- Hint: Use the DISTINCT keyword to count InvoiceLineItems.AccountNo.

SELECT COUNT(DISTINCT LI.AccountNo) AS "# of Accounts" , VendorName	
	FROM Vendors V
	JOIN Invoices i 
	ON i.VendorID = v.VendorID
	JOIN InvoiceLineItems li 
	ON i.InvoiceID = li.InvoiceID
	GROUP BY VendorName
	HAVING COUNT(DISTINCT li.AccountNo) > 1
	ORDER BY VendorName

-- had trouble on this one

--  9. Write a SELECT statement that returns six columns:
-- VendorID From Invoices. InvoiceDate from Invoices. InvoiceTotal from Invoices.
-- VendorTotal from Vendors. VendorCount from Vendors. VendorAvg from Vendors.
-- The result set should include the individual invoices for each vendor.

SELECT i.VendorID, InvoiceDate, InvoiceTotal
	FROM Invoices i
	JOIN Vendors v 
	ON i.VendorID = v.VendorID
