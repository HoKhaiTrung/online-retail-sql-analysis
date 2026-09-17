-- Calculate total revenue from product sales across the entire dataset

SELECT SUM(Quantity * UnitPrice) AS Revenue
FROM InvoiceLine il
WHERE Quantity > 0
  AND UnitPrice > 0
  AND il.StockCode GLOB "[0-9]*";


-- Analyze revenue by month

SELECT SUM(Quantity * UnitPrice) AS Revenue,
       strftime("%Y-%m", "InvoiceDate") AS Month
FROM InvoiceLine
JOIN "Invoice"
    ON "Invoice"."InvoiceNo" = "InvoiceLine"."InvoiceNo"
WHERE Quantity > 0
  AND UnitPrice > 0
  AND StockCode GLOB "[0-9]*"
GROUP BY "Month"
ORDER BY "Month";


-- Analyze sales volume by month

SELECT SUM(il.Quantity) AS Total_Sales,
       strftime("%Y-%m", "InvoiceDate") AS Month
FROM InvoiceLine il
JOIN Invoice i
    ON i.InvoiceNo = il.InvoiceNo
WHERE il.Quantity > 0
  AND il.UnitPrice > 0
  AND il.StockCode GLOB "[0-9]*"
GROUP BY "Month"
ORDER BY "Month";


-- Identify products generating the highest revenue

SELECT Product."StockCode",
       Product."Description",
       SUM(Quantity * UnitPrice) AS Revenue
FROM Product
JOIN "InvoiceLine"
    ON "InvoiceLine"."StockCode" = "Product"."StockCode"
WHERE InvoiceLine.Quantity > 0
  AND InvoiceLine.UnitPrice > 0
  AND Product.StockCode GLOB "[0-9]*"
GROUP BY Product."StockCode"
ORDER BY Revenue DESC;


-- Identify products with the highest sales volume

SELECT Product."StockCode",
       Product."Description",
       SUM(InvoiceLine.Quantity) AS Total_Solds
FROM Product
JOIN "InvoiceLine"
    ON "InvoiceLine"."StockCode" = "Product"."StockCode"
WHERE InvoiceLine.Quantity > 0
  AND InvoiceLine.UnitPrice > 0
  AND Product.StockCode GLOB "[0-9]*"
GROUP BY Product."StockCode"
ORDER BY Total_Solds DESC;


-- Identify customers generating the highest revenue

SELECT c.CustomerID,
       SUM(Quantity * UnitPrice) AS Revenue
FROM Customer c
JOIN Invoice i
    ON i.CustomerID = c.CustomerID
JOIN InvoiceLine il
    ON il.InvoiceNo = i.InvoiceNo
WHERE il.Quantity > 0
  AND il.UnitPrice > 0
  AND il.StockCode GLOB "[0-9]*"
GROUP BY c.CustomerID
ORDER BY Revenue DESC;


-- Analyze revenue by country

SELECT c.Country,
       SUM(Quantity * UnitPrice) AS Revenue
FROM Customer c
JOIN Invoice i
    ON i.CustomerID = c.CustomerID
JOIN InvoiceLine il
    ON il.InvoiceNo = i.InvoiceNo
WHERE il.Quantity > 0
  AND il.UnitPrice > 0
  AND il.StockCode GLOB "[0-9]*"
GROUP BY c.Country
ORDER BY Revenue DESC;


-- Analyze sales volume by country

SELECT c.Country,
       SUM(il.Quantity) AS Total_Quantities
FROM Customer c
JOIN Invoice i
    ON i.CustomerID = c.CustomerID
JOIN InvoiceLine il
    ON il.InvoiceNo = i.InvoiceNo
WHERE il.Quantity > 0
  AND il.UnitPrice > 0
  AND il.StockCode GLOB "[0-9]*"
GROUP BY c.Country
ORDER BY Total_Quantities DESC;


-- Analyze cancellation/return quantity by month

SELECT strftime("%Y-%m", "InvoiceDate") AS Month,
       ABS(SUM(il.Quantity)) AS Total_Cancellation
FROM InvoiceLine il
JOIN "Invoice" i
    ON i.InvoiceNo = il.InvoiceNo
WHERE il.InvoiceNo LIKE "C%"
  AND il.Quantity < 0
GROUP BY "Month"
ORDER BY Month;


-- Analyze cancellation/return value by month

SELECT strftime("%Y-%m", "InvoiceDate") AS Month,
       ABS(SUM(il.Quantity * il.UnitPrice)) AS Cancellation_Return_Value
FROM InvoiceLine il
JOIN "Invoice" i
    ON i.InvoiceNo = il.InvoiceNo
WHERE il.InvoiceNo LIKE "C%"
  AND il.Quantity < 0
GROUP BY "Month"
ORDER BY Month;
