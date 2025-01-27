USE MYGuitarShop
SELECT *
	FROM Customers

SELECT * 
	FROM Addresses


SELECT FirstName, LastName, Line1 AS StreetAddress, City, STATE, Zipcode
	FROM Customers C
	JOIN Addresses A ON C.ShippingAddressID = A.AddressID

	-- 4.

SELECT P1.ProductName, P1.ListPrice 
	FROM Products P1
	JOIN Products P2 ON P1.ListPrice = P2.ListPrice
	WHERE P1.PRoductID != P2.ProductID
	