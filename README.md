\# Customer Insights ETL (SSIS Project)



This project demonstrates how SSIS can be used to build ETL workflows for cleaning, transforming, and integrating business data.  

The solution is based on real-world scenarios such as \*\*customer data cleansing\*\*, \*\*sales aggregation\*\*, and \*\*inventory management\*\*.  



---



\## Task 1: Customer Data Cleansing  



\- \*\*Input File:\*\* `Customers.csv`  

\- \*\*Steps:\*\*  

&nbsp; - Validate email format (must contain `@`)  

&nbsp; - Replace missing phone numbers with `"Unknown"`  

&nbsp; - Standardize dates to `YYYY-MM-DD`  

&nbsp; - Ensure `CustomerID` is unique  

\- \*\*Output:\*\*  

&nbsp; - Cleaned records → `dbo.Customer`  

&nbsp; - Invalid records → `dbo.ErrorLog\_Customers`  



---



\## Task 2: Sales Aggregation  



\- \*\*Input Files:\*\* `Sales.csv`, `Products.csv`  

\- \*\*Steps:\*\*  

&nbsp; - Replace missing `Quantity` or `Price` with `0`  

&nbsp; - Match each `ProductID` in Sales with Products table  

&nbsp; - Flag transactions where Sale Price ≠ Product StandardPrice  

&nbsp; - Validate transaction dates  

\- \*\*Output:\*\*  

&nbsp; - Aggregated summary (by product and category) → `dbo.Sales\_Aggregated`  

&nbsp; - Invalid records → `UnitPrice\_Error.xlsx`  



---



\## Task 3: Inventory Validation \& Stock Adjustment  



\- \*\*Input Files:\*\* `Sales.csv`, `Products.csv`, `Inventory.csv`  

\- \*\*Steps:\*\*  

&nbsp; - Deduct sold `Quantity` from `StockQuantity` in Inventory  

&nbsp; - Ensure `ProductID` exists in all three datasets  

&nbsp; - Calculate `RemainingStock` per product  

&nbsp; - Classify stock levels:  

&nbsp;   - \*\*Sufficient Stock\*\* → `RemainingStock > ReorderLevel`  

&nbsp;   - \*\*Low Stock\*\* → `0 < RemainingStock ≤ ReorderLevel`  

&nbsp;   - \*\*Out of Stock\*\* → `RemainingStock = 0`  

\- \*\*Output:\*\*  

&nbsp; - Updated inventory → `dbo.Inventory\_updated`  

---

