-- ADVENTURE WORKS SQL PROJECT

-- =========================================================
-- DATABASE CREATION
-- =========================================================
SET GLOBAL local_infile = 1;
DROP DATABASE IF EXISTS adventure_works;
CREATE DATABASE adventure_works;
USE adventure_works;

-- =========================================================
-- TABLE INSERTION SCRIPT
-- =========================================================

-- =========================================================
-- TABLE 1: Dimcustomer
-- =========================================================

CREATE TABLE Dimcustomer (
    CustomerKey INT,
    GeographyKey INT,
    CustomerAlternateKey VARCHAR(20),
    Title VARCHAR(10),
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    NameStyle BOOLEAN,
    BirthDate INT,
    MaritalStatus VARCHAR(5),
    Suffix VARCHAR(10),
    Gender VARCHAR(5),
    EmailAddress VARCHAR(100),
    YearlyIncome INT,
    TotalChildren INT,
    NumberChildrenAtHome INT,
    EnglishEducation VARCHAR(50),
    SpanishEducation VARCHAR(50),
    FrenchEducation VARCHAR(50),
    EnglishOccupation VARCHAR(50),
    SpanishOccupation VARCHAR(50),
    FrenchOccupation VARCHAR(50),
    HouseOwnerFlag INT,
    NumberCarsOwned INT,
    AddressLine1 VARCHAR(100),
    AddressLine2 VARCHAR(100),
    Phone VARCHAR(50),
    DateFirstPurchase INT,
    CommuteDistance VARCHAR(20)
);


-- =========================================================
-- TABLE 2: DimDate
-- =========================================================

CREATE TABLE DimDate (
    DateKey INT,
    FullDateAlternateKey DATETIME,
    DayNumberOfWeek INT,
    EnglishDayNameOfWeek VARCHAR(20),
    SpanishDayNameOfWeek VARCHAR(20),
    FrenchDayNameOfWeek VARCHAR(20),
    DayNumberOfMonth INT,
    DayNumberOfYear INT,
    WeekNumberOfYear INT,
    EnglishMonthName VARCHAR(20),
    SpanishMonthName VARCHAR(20),
    FrenchMonthName VARCHAR(20),
    MonthNumberOfYear INT,
    CalendarQuarter INT,
    CalendarYear INT,
    CalendarSemester INT,
    FiscalQuarter INT,
    FiscalYear INT,
    FiscalSemester INT
);


-- =========================================================
-- TABLE 3: DimProduct
-- =========================================================

CREATE TABLE DimProduct (
    ProductKey INT,
    `Unit price` DECIMAL(15,4),
    ProductAlternateKey VARCHAR(30),
    ProductSubcategoryKey INT,
    WeightUnitMeasureCode VARCHAR(10),
    SizeUnitMeasureCode VARCHAR(10),
    EnglishProductName VARCHAR(200),
    SpanishProductName VARCHAR(200),
    FrenchProductName VARCHAR(200),
    StandardCost DECIMAL(15,4),
    FinishedGoodsFlag BOOLEAN,
    Color VARCHAR(50),
    SafetyStockLevel INT,
    ReorderPoint INT,
    ListPrice DECIMAL(15,4),
    Size VARCHAR(50),
    SizeRange VARCHAR(50),
    Weight DECIMAL(15,4),
    DaysToManufacture INT,
    ProductLine VARCHAR(20),
    DealerPrice DECIMAL(15,4),
    Class VARCHAR(20),
    Style VARCHAR(20),
    ModelName VARCHAR(100),
    EnglishDescription TEXT,
    FrenchDescription TEXT,
    ChineseDescription TEXT,
    ArabicDescription TEXT,
    HebrewDescription TEXT,
    ThaiDescription TEXT,
    GermanDescription TEXT,
    JapaneseDescription TEXT,
    TurkishDescription TEXT,
    StartDate INT,
    EndDate INT,
    Status VARCHAR(30)
);


-- =========================================================
-- TABLE 4: DimProductCategory
-- =========================================================

CREATE TABLE DimProductCategory (
    ProductCategoryKey INT,
    ProductCategoryAlternateKey INT,
    EnglishProductCategoryName VARCHAR(100),
    SpanishProductCategoryName VARCHAR(100),
    FrenchProductCategoryName VARCHAR(100)
);


-- =========================================================
-- TABLE 5: DimProductSubCategory
-- =========================================================

CREATE TABLE DimProductSubCategory (
    ProductSubcategoryKey INT,
    ProductSubcategoryAlternateKey INT,
    EnglishProductSubcategoryName VARCHAR(100),
    SpanishProductSubcategoryName VARCHAR(100),
    FrenchProductSubcategoryName VARCHAR(100),
    ProductCategoryKey INT
);


-- =========================================================
-- TABLE 6: DimSalesterritory
-- =========================================================

CREATE TABLE DimSalesterritory (
    SalesTerritoryKey INT,
    SalesTerritoryAlternateKey INT,
    SalesTerritoryRegion VARCHAR(100),
    SalesTerritoryCountry VARCHAR(100),
    SalesTerritoryGroup VARCHAR(100)
);


-- =========================================================
-- TABLE 7: FactInternetSales
-- =========================================================

CREATE TABLE FactInternetSales (
    ProductKey INT,
    OrderDateKey INT,
    DueDateKey INT,
    ShipDateKey INT,
    CustomerKey INT,
    PromotionKey INT,
    CurrencyKey INT,
    SalesTerritoryKey INT,
    SalesOrderNumber VARCHAR(30),
    SalesOrderLineNumber INT,
    RevisionNumber INT,
    OrderQuantity INT,
    UnitPrice DECIMAL(18,4),
    ExtendedAmount DECIMAL(18,4),
    UnitPriceDiscountPct DECIMAL(18,4),
    DiscountAmount DECIMAL(18,4),
    ProductStandardCost DECIMAL(18,4),
    TotalProductCost DECIMAL(18,4),
    SalesAmount DECIMAL(18,4),
    TaxAmt DECIMAL(18,4),
    Freight DECIMAL(18,4),
    CarrierTrackingNumber VARCHAR(100),
    CustomerPONumber VARCHAR(100),
    OrderDate INT,
    DueDate INT,
    ShipDate INT
);


-- =========================================================
-- TABLE 8: Fact_Internet_Sales_New
-- =========================================================

CREATE TABLE Fact_Internet_Sales_New (
    ProductKey INT,
    OrderDateKey INT,
    DueDateKey INT,
    ShipDateKey INT,
    CustomerKey INT,
    PromotionKey INT,
    CurrencyKey INT,
    SalesTerritoryKey INT,
    SalesOrderNumber VARCHAR(30),
    SalesOrderLineNumber INT,
    RevisionNumber INT,
    OrderQuantity INT,
    UnitPrice DECIMAL(18,4),
    ExtendedAmount DECIMAL(18,4),
    UnitPriceDiscountPct DECIMAL(18,4),
    DiscountAmount DECIMAL(18,4),
    ProductStandardCost DECIMAL(18,4),
    TotalProductCost DECIMAL(18,4),
    SalesAmount DECIMAL(18,4),
    TaxAmt DECIMAL(18,4),
    Freight DECIMAL(18,4),
    CarrierTrackingNumber VARCHAR(100),
    CustomerPONumber VARCHAR(100),
    OrderDate INT,
    DueDate INT,
    ShipDate INT
);


-- =========================================================
-- CSV INSERTION
-- =========================================================

LOAD DATA LOCAL INFILE
'C:/Users/amath/OneDrive/Adventure Works Project/SQL Module Project/CSV FILES/Dimcustomer.csv'
INTO TABLE Dimcustomer
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE
'C:/Users/amath/OneDrive/Adventure Works Project/SQL Module Project/CSV FILES/DimDate.csv'
INTO TABLE DimDate
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE
'C:/Users/amath/OneDrive/Adventure Works Project/SQL Module Project/CSV FILES/DimProduct.csv'
INTO TABLE DimProduct
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE
'C:/Users/amath/OneDrive/Adventure Works Project/SQL Module Project/CSV FILES/DimProductCategory.csv'
INTO TABLE DimProductCategory
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE
'C:/Users/amath/OneDrive/Adventure Works Project/SQL Module Project/CSV FILES/DimProductSubCategory.csv'
INTO TABLE DimProductSubCategory
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE
'C:/Users/amath/OneDrive/Adventure Works Project/SQL Module Project/CSV FILES/DimSalesterritory.csv'
INTO TABLE DimSalesterritory
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE
'C:/Users/amath/OneDrive/Adventure Works Project/SQL Module Project/CSV FILES/FactInternetSales.csv'
INTO TABLE FactInternetSales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE
'C:/Users/amath/OneDrive/Adventure Works Project/SQL Module Project/CSV FILES/Fact_Internet_Sales_New.csv'
INTO TABLE Fact_Internet_Sales_New
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- =========================================================
-- CHECK ROW COUNTS
-- =========================================================

SELECT COUNT(*) AS Dimcustomer_Rows FROM Dimcustomer;
SELECT COUNT(*) AS DimDate_Rows FROM DimDate;
SELECT COUNT(*) AS DimProduct_Rows FROM DimProduct;
SELECT COUNT(*) AS DimProductCategory_Rows FROM DimProductCategory;
SELECT COUNT(*) AS DimProductSubCategory_Rows FROM DimProductSubCategory;
SELECT COUNT(*) AS DimSalesterritory_Rows FROM DimSalesterritory;
SELECT COUNT(*) AS FactInternetSales_Rows FROM FactInternetSales;
SELECT COUNT(*) AS FactInternetSalesNew_Rows
FROM Fact_Internet_Sales_New;

-- ADVENTURE WORKS SQL PROJECT

-- =========================================================
-- Q0. UNION OF FACT INTERNET SALES AND FACT INTERNET SALES NEW
-- =========================================================

USE ADVENTURE_WORKS;
CREATE TABLE Sales AS
SELECT * FROM FactInternetSales
UNION ALL
SELECT * FROM Fact_Internet_Sales_New;
select * from sales;
SELECT COUNT(*) AS TotalRows
FROM Sales;

-- =========================================================
-- Q1. LOOKUP PRODUCT NAME FROM PRODUCT TO SALES
-- =========================================================

CREATE TABLE Sales_Q1 AS
SELECT s.*,p.EnglishProductName AS ProductName
FROM Sales s LEFT JOIN DimProduct p
ON s.ProductKey = p.ProductKey;
DROP TABLE Sales;
RENAME TABLE Sales_Q1 TO Sales;

SELECT ProductKey,ProductName
FROM Sales;

-- =========================================================
-- Q2. LOOKUP CUSTOMER FULL NAME AND UNIT PRICE
-- =========================================================

CREATE TABLE Sales_Q2 AS
SELECT s.*,CONCAT_WS(' ',c.FirstName,c.MiddleName,c.LastName) AS CustomerFullName,p.`Unit price` AS ProductUnitPrice
FROM Sales s LEFT JOIN Dimcustomer c
ON s.CustomerKey = c.CustomerKey
LEFT JOIN DimProduct p
ON s.ProductKey = p.ProductKey;

DROP TABLE Sales;
RENAME TABLE Sales_Q2 TO Sales;

SELECT ProductKey,CustomerKey,ProductName,CustomerFullName,ProductUnitPrice
FROM Sales
LIMIT 10;

-- =========================================================
-- Q3. CALCULATE DATE FIELDS FROM ORDERDATEKEY
-- =========================================================
select * from sales;
ALTER TABLE Sales
ADD COLUMN OrderDateActual DATE,
ADD COLUMN Year INT,
ADD COLUMN MonthNo INT,
ADD COLUMN MonthFullName VARCHAR(20),
ADD COLUMN Quarter VARCHAR(10),
ADD COLUMN YearMonth VARCHAR(20),
ADD COLUMN WeekdayNo INT,
ADD COLUMN WeekdayName VARCHAR(20),
ADD COLUMN FinancialMonth INT,
ADD COLUMN FinancialQuarter VARCHAR(10);
select * from sales;
-- Create actual date from OrderDateKey
UPDATE Sales
SET OrderDateActual = STR_TO_DATE(CAST(OrderDateKey AS CHAR),'%Y%m%d');

-- Year, Month Number and Month Name
UPDATE Sales
SET Year = YEAR(OrderDateActual),
    MonthNo = MONTH(OrderDateActual),
    MonthFullName = MONTHNAME(OrderDateActual);

-- Quarter and YearMonth
UPDATE Sales
SET Quarter = CONCAT('Q',QUARTER(OrderDateActual)),
    YearMonth = DATE_FORMAT(OrderDateActual,'%Y-%b');

-- Weekday Number and Weekday Name
UPDATE Sales
SET WeekdayNo = DAYOFWEEK(OrderDateActual),
    WeekdayName = DAYNAME(OrderDateActual);

-- Financial Month
-- Financial Year starts from July
UPDATE Sales 
SET FinancialMonth =
                    CASE
                        WHEN MonthNo >= 7 THEN MonthNo - 6
                        ELSE MonthNo + 6
                    END;

-- Financial Quarter
-- July-September = Q1
-- October-December = Q2
-- January-March = Q3
-- April-June = Q4

UPDATE Sales
SET FinancialQuarter =
    CASE
        WHEN MonthNo BETWEEN 7 AND 9 THEN 'Q1'
        WHEN MonthNo BETWEEN 10 AND 12 THEN 'Q2'
        WHEN MonthNo BETWEEN 1 AND 3 THEN 'Q3'
        WHEN MonthNo BETWEEN 4 AND 6 THEN 'Q4'
    END;

SELECT OrderDateKey,OrderDateActual,Year,MonthNo,MonthFullName,Quarter,YearMonth,
    WeekdayNo,WeekdayName,FinancialMonth,FinancialQuarter
FROM Sales;

-- =========================================================
-- Q4. CALCULATE SALES AMOUNT
-- =========================================================
ALTER TABLE Sales
ADD COLUMN Sales_Amt DECIMAL(18,4);

UPDATE Sales
SET Sales_Amt = UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct);

SELECT UnitPrice,OrderQuantity,UnitPriceDiscountPct,Sales_Amt
FROM Sales
LIMIT 10;

-- =========================================================
-- Q5. CALCULATE PRODUCTION COST
-- =========================================================

ALTER TABLE Sales
ADD COLUMN ProductionCost DECIMAL(18,4);

UPDATE Sales
SET ProductionCost = TotalProductCost * OrderQuantity;

SELECT TotalProductCost,OrderQuantity,ProductionCost
FROM Sales
LIMIT 10;

-- =========================================================
-- Q6. CALCULATE PROFIT
-- =========================================================

ALTER TABLE Sales
ADD COLUMN Profit DECIMAL(18,4);

UPDATE Sales
SET Profit = Sales_Amt - ProductionCost;

SELECT Sales_Amt,ProductionCost,Profit
FROM Sales
LIMIT 10;

-- =========================================================
-- KPIs
-- =========================================================

-- Total Sales
SELECT CONCAT(ROUND(SUM(Sales_Amt) / 1000000, 2), 'M') AS TotalSales
FROM Sales;

-- Total Profit
SELECT CONCAT(ROUND(SUM(Profit) / 1000000, 2), 'M') AS TotalProfit
FROM Sales;

-- Profit Margin %
SELECT CONCAT(ROUND(SUM(Profit) / NULLIF(SUM(Sales_Amt), 0) * 100, 2),'%') AS ProfitMargin
FROM Sales;

-- Total Products
SELECT COUNT(DISTINCT ProductKey) AS TotalProducts
FROM Sales;

-- Total Customers
SELECT CONCAT(ROUND(COUNT(DISTINCT CustomerKey) / 1000, 2),'K') AS TotalCustomers
FROM Sales;

-- Maximum Sales
SELECT MAX(Sales_Amt) AS MaxSales
FROM Sales;

-- Minimum Sales
SELECT MIN(Sales_Amt) AS MinSales
FROM Sales;

-- Average Sales
SELECT AVG(Sales_Amt) AS AverageSales
FROM Sales;

-- Maximum Profit
SELECT MAX(Profit) AS MaxProfit
FROM Sales;

-- Minimum Profit
SELECT MIN(Profit) AS MinProfit
FROM Sales;

-- =========================================================
-- VISUAL / CHART QUERIES
-- =========================================================
use adventure_works;
-- Sales Amount vs Production Cost
SELECT Year,CONCAT(ROUND(SUM(Sales_Amt) / 1000000, 2), 'M') AS SalesAmount,
            CONCAT(ROUND(SUM(ProductionCost) / 1000000, 2), 'M') AS ProductionCost
FROM Sales
GROUP BY Year
ORDER BY Year;

-- Year-wise Sales
SELECT Year,CONCAT(ROUND(SUM(Sales_Amt) / 1000000, 2), 'M') AS TotalSales
FROM Sales
GROUP BY Year
ORDER BY Year;

-- Year-wise Profit
SELECT Year,CONCAT(ROUND(SUM(Profit) / 1000000, 2), 'M') AS TotalProfit
FROM Sales
GROUP BY Year
ORDER BY Year;

-- Month-wise Sales 
SELECT Year,MonthNo,MonthFullName,CONCAT(ROUND(SUM(Sales_Amt) / 1000000, 2), 'M') AS TotalSales
FROM Sales
GROUP BY Year, MonthNo, MonthFullName
ORDER BY Year, MonthNo;

-- Quarter-wise Sales
SELECT Year,Quarter,CONCAT(ROUND(SUM(Sales_Amt) / 1000000, 2), 'M') AS TotalSales
FROM Sales
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

-- Region-wise Sales  
SELECT t.SalesTerritoryRegion,CONCAT(ROUND(SUM(s.Sales_Amt) / 1000000, 2), 'M') AS TotalSales
FROM Sales s
JOIN DimSalesterritory t
ON s.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY t.SalesTerritoryRegion
ORDER BY SUM(s.Sales_Amt) DESC;

-- Top 10 Products by Sales
SELECT ProductName,CONCAT(ROUND(SUM(Sales_Amt) / 1000000, 2), 'M') AS TotalSales
FROM Sales
GROUP BY ProductName
ORDER BY SUM(Sales_Amt) DESC
LIMIT 10;

-- Top 5 Products by Sales
SELECT ProductName,CONCAT(ROUND(SUM(Sales_Amt) / 1000000, 2), 'M') AS TotalSales
FROM Sales
GROUP BY ProductName
ORDER BY SUM(Sales_Amt) DESC
LIMIT 5;

-- Top 10 Customers by Sales
SELECT CustomerFullName,CONCAT(ROUND(SUM(Sales_Amt) / 1000, 2), 'K') AS TotalSales
FROM Sales
GROUP BY CustomerFullName
ORDER BY SUM(Sales_Amt) DESC
LIMIT 10;

-- Product-wise Sales
SELECT ProductName,CONCAT(ROUND(SUM(Sales_Amt) / 1000000, 2), 'M') AS TotalSales
FROM Sales
GROUP BY ProductName
ORDER BY SUM(Sales_Amt) DESC;

-- Year with Highest Total Sales
SELECT Year,CONCAT(ROUND(SUM(Sales_Amt) / 1000000, 2), 'M') AS TotalSales
FROM Sales
GROUP BY Year
ORDER BY SUM(Sales_Amt) DESC
LIMIT 1;


-- Year with Highest Total Profit
SELECT Year,CONCAT(ROUND(SUM(Profit) / 1000000, 2), 'M') AS TotalProfit
FROM Sales
GROUP BY Year
ORDER BY SUM(Profit) DESC
LIMIT 1;