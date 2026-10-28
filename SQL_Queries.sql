#Table Preview
SELECT *
FROM Innomatics.default.sales_dataset
LIMIT 10;

#Task 1 Overall Sales Performance
SELECT
    SUM(Sales_Amount) AS Total_Sales_Revenue,
    SUM(Quantity_Sold) AS Total_Quantity_Sold,
    COUNT(*) AS Total_Sales_Records,
    COUNT(DISTINCT Product_ID) AS Distinct_Products
FROM Innomatics.default.sales_dataset;

#Task 2 Top 5 Products by Sales Revenue
SELECT
    Product_ID,
    SUM(Sales_Amount) AS Total_Sales_Revenue,
    SUM(Quantity_Sold) AS Total_Quantity_Sold
FROM Innomatics.default.sales_dataset
GROUP BY Product_ID
ORDER BY Total_Sales_Revenue DESC
LIMIT 5;

#Task 3 Regional Sales Performance (1)
SELECT
    Region,
    SUM(Sales_Amount) AS Total_Sales_Revenue,
    SUM(Quantity_Sold) AS Total_Quantity_Sold
FROM Innomatics.default.sales_dataset
GROUP BY Region
ORDER BY Total_Sales_Revenue DESC;

#Task 4 Monthly Sales Trend
SELECT
    DATE_TRUNC('MONTH', Sale_Date) AS Sales_Month,
    SUM(Sales_Amount) AS Total_Sales_Revenue
FROM Innomatics.default.sales_dataset
GROUP BY DATE_TRUNC('MONTH', Sale_Date)
ORDER BY Sales_Month;

#Task 5 Product Category Contribution
SELECT
    Product_Category,
    SUM(Sales_Amount) AS Total_Sales_Revenue,
    ROUND(
        SUM(Sales_Amount) * 100.0 /
        SUM(SUM(Sales_Amount)) OVER (),
        2
    ) AS Sales_Contribution_Percentage
FROM Innomatics.default.sales_dataset
GROUP BY Product_Category
ORDER BY Total_Sales_Revenue DESC;