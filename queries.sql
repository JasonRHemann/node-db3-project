-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName, CategoryName FROM product AS P
JOIN Category AS C
ON P.CategoryID = C.ID;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT Id, OrderDate, CompanyName FROM [order] as O
JOIN Shipper as S
ON O.ShipVia = S.Id
WHERE OrderDate BETWEEN '2012-07-04' AND '2012-08-09' ---WHERE orderDate < 2012-09-09
ORDER BY OrderDate;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Id, Quantity, ProductName FROM [orderdetail] AS O
JOIN Product AS P 
ON O.ProductId = P.Id
WHERE OrderId = 10251
ORDER BY ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT Id AS OrderId, LastName AS Employee, CompanyName AS Customer FROM [order] AS O
JOIN Employee AS E
ON O.EmployeeId = E.Id
JOIN Customer AS C
ON O.CustomerId = C.Id;

--stretch
SELECT CategoryName, count() as count FROM [Categories]
JOIN products ON products.categoryID = categories.categoryID
GROUP BY categoryNameFrom Ramonta Lee to Everyone:  02:05 PM

SELECT [Orders].OrderID, Count() AS ItemCount FROM [Orders]
JOIN OrderDetails AS OD ON [Orders].OrderID = OD.OrderID
GROUP BY [Orders].OrderID;