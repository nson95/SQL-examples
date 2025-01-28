--1.
USE MyGuitarShop

SELECT COUNT(*) AS "# of Orders", SUM(TaxAmount) AS TotalTaxAmt
	FROM Orders

--2
SELECT CategoryName, SUM(DISTINCT ProductID), 
	FROM Categories c

