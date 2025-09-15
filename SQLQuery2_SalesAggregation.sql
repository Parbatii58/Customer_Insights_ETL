USE Customer_insights

-- Sales table
CREATE TABLE Sales 
(
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE
);

-- Product table
CREATE TABLE Products 
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    UnitPrice DECIMAL(10,2)
);

CREATE TABLE Sales_Aggregated (
    Category VARCHAR(50),
    ProductID INT,
    ProductName VARCHAR(100),
    TotalQuantity INT,
    TotalSales DECIMAL(12,2)
);


--SELECT s.CustomerID, s.ProductID, p.ProductName, s.UnitPrice, s.Quantity
--FROM Sales s
--INNER JOIN Products p
--ON s.ProductID = p.ProductID



SELECT * FROM Sales
SELECT * FROM Products