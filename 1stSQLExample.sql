-- select * from Invoices where 

-- get VendorID, InvoiceNumber, InvoiceTotal

SELECT VendorID, InvoiceNumber, InvoiceTotal 
FROM Invoices
WHERE InvoiceTotal >= 2000;


-- calculated value - total credits

SELECT InvoiceDate, Invoicetotal, PaymentTotal, CreditTotal, InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue FROM Invoices
ORDER BY BalanceDue desc

-- return only select range of dates
SELECT InvoiceNumber, InvoiceDate, Invoicetotal, InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY BalanceDue Desc 
