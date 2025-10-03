USE Customer_insights

CREATE TABLE Inventory
(
	ProductId INT,
	StockQuantity INT,
	ReorderLevel INT
);



CREATE TABLE Inventory_updated
(
	ProductId INT,
	StockQuantity INT,
	ReorderLevel INT,
	Stock_Status VARCHAR(50)
);



-- To get Inventory report in excel file
SELECT i.ProductId,
	   p.ProductName,
	   p.Category, 
	   (i.StockQuantity- SUM(s.Quantity)) AS Remaning_Quantity, 
	   i.ReorderLevel, 
	   CASE WHEN (i.StockQuantity- SUM(s.Quantity)) > i.ReorderLevel THEN 'Sufficient Stock'  
			WHEN (i.StockQuantity- SUM(s.Quantity)) <= i.ReorderLevel AND (i.StockQuantity- SUM(s.Quantity)) >0 THEN 'Insufficient Stock' 
			WHEN (i.StockQuantity- SUM(s.Quantity)) =0 THEN 'Out of Stock' 
		END AS 'Stock Status'
FROM Sales s
INNER JOIN Inventory i
ON s.ProductID = i.ProductId
INNER JOIN Products p
ON i.ProductId = p.ProductID
GROUP BY i.StockQuantity, p.Category, i.ProductId, i.ReorderLevel, p.ProductName


-- to populate dbo.Inventory_updated
SELECT i.ProductId,
	   (i.StockQuantity- SUM(s.Quantity)) AS StockQuantity, 
	   i.ReorderLevel, 
	   CASE WHEN (i.StockQuantity- SUM(s.Quantity)) > i.ReorderLevel THEN 'Sufficient Stock'  
			WHEN (i.StockQuantity- SUM(s.Quantity)) <= i.ReorderLevel AND (i.StockQuantity- SUM(s.Quantity)) >0 THEN 'Insufficient Stock' 
			WHEN (i.StockQuantity- SUM(s.Quantity)) =0 THEN 'Out of Stock' 
		END AS 'Stock_Status'
FROM Sales s
INNER JOIN Inventory i
ON s.ProductID = i.ProductId
INNER JOIN Products p
ON i.ProductId = p.ProductID
GROUP BY i.StockQuantity, p.Category, i.ProductId, i.ReorderLevel, p.ProductName


SELECT * FROM Customer
SELECT * FROM Sales
SELECT * FROM Products
SELECT * FROM Inventory
SELECT * FROM Inventory_updated