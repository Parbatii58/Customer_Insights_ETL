--CREATE DATABASE Customer_insights

USE Customer_insights


CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(100),
    Country VARCHAR(100)
);

-- Error log table
CREATE TABLE ErrorLog_Customers (
    CustomerID INT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    ErrorMessage VARCHAR(200),
    LogDate DATETIME DEFAULT GETDATE()
);

--SELECT * FROM Customer WHERE Email  LIKE  '%@%'


SELECT * FROM Customer
SELECT * FROM ErrorLog_Customers
