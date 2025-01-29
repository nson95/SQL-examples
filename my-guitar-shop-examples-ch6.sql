--1.
USE MyGuitarShop

SELECT COUNT(*) AS "# of Orders", SUM(TaxAmount) AS TotalTaxAmt
	FROM Orders


--Redoing as example in review #1.


USE MyGuitarShop
SELECT DISTINCT(CategoryName)
	FROM Categories 
	WHERE CategoryID IN(
	SELECT DISTINCT(CategoryID)
	FROM Products 
	)

	--FROM Categories C
	--JOIN Products p on p.CategoryID = c.CategoryID
	--ORDER BY CategoryName



SELECT DISTINCT(CategoryID)		



--2
SELECT CategoryName, SUM(DISTINCT ProductID), 
	FROM Categories c

-- joins and subqueries can be used interchangably




--4.
--A) Write a SELECT statement that returns three columns: EmailAddress, OrderID, and 
--the order total for each order. To do this, you can group the result set by the 
--EmailAddress and OrderID columns. Then, you can calculate the order total from the 
--columns in the OrderItems table.
-- Relationships: Order - OrderItems, Orders - Customer
--B) Write a second SELECT statement that uses the first SELECT statement in its FROM 
--clause. The main query should return two columns: the customer’s email address and 
--the largest order for that customer. To do this, you can group the result set by the 
--EmailAddress column.

SELECT EmailAddress, o.OrderID, SUM((ItemPrice -DiscountAmount) * Quantity) AS OrderTotal
	FROM Orders o 
		JOIN Customers c 
		ON c.CustomerID = o.CustomerID
		JOIN OrderItems oi 
		ON oi.OrderID = o.OrderID
	GROUP BY EmailAddress, o.OrderID


SELECT EmailAddress, MAX(OrderTotal)
	FROM (
	SELECT EmailAddress, o.OrderID, 
	SUM((ItemPrice -DiscountAmount) * Quantity) AS OrderTotal
		FROM Orders o 
			JOIN Customers c 
			ON c.CustomerID = o.CustomerID
			JOIN OrderItems oi 
			ON oi.OrderID = o.OrderID
		GROUP BY EmailAddress, o.OrderID
		) AS OrderTotal
	GROUP BY EmailAddress


	

	SELECT * FROM Orders
	SELECT * FROM OrderItems
	SELECT * FROM Customers