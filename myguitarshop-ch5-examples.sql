USE MyGuitarShop


-- 1.
SELECT COUNT(*) AS '# of Orders', SUM(TaxAmount) AS TotalTax
	FROM Orders

-- 2.

SELECT CategoryName
	FROM Categories c
	JOIN Products p
	ON c.CategoryID = p.CategoryID