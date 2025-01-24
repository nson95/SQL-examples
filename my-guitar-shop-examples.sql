USE MyGuitarShop
SELECT * 
	FROM Categories;

	-- EXAMPLE 4 from workbook Display ProductName, ListPrice, DiscountAmount, and DiscountPrice from Products
	-- SORT DiscountPrice DESC
SELECT ProductName, ListPrice, ListPrice*DiscountPercent/100 AS DiscountAmount, ListPrice-(ListPrice*DiscountPercent/100) AS DiscountedPrice
	FROM Products
ORDER BY DiscountedPrice DESC

