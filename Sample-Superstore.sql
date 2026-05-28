USE sample_superstore;
SELECT * 
FROM sales
LIMIT 10;
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM sales;
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM sales;
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM sales;
SELECT Region,
       ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY Region
ORDER BY Revenue DESC;
SELECT Category,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT Category,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM sales
GROUP BY Category
ORDER BY Total_Profit DESC;
SELECT `Product Name`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT `Customer Name`,
       ROUND(SUM(Sales),2) AS Total_Purchase
FROM sales
GROUP BY `Customer Name`
ORDER BY Total_Purchase DESC
LIMIT 10;
SELECT MONTH(`Order Date`) AS Month_Number,
       ROUND(SUM(Sales),2) AS Monthly_Sales
FROM sales
GROUP BY Month_Number
ORDER BY Month_Number;
SELECT YEAR(`Order Date`) AS Year,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY Year
ORDER BY Year;
SELECT Segment,
       ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY Segment
ORDER BY Revenue DESC;
SELECT State,
       ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY State
ORDER BY Profit DESC;
SELECT `Sub-Category`,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM sales
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;
SELECT `Product Name`,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM sales
GROUP BY `Product Name`
ORDER BY Total_Profit ASC
LIMIT 10;
SELECT Category,
       ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM sales
GROUP BY Category;
SELECT `Product Name`,
       ROUND(SUM(Sales),2) AS Total_Sales,
       RANK() OVER(ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM sales
GROUP BY `Product Name`;
WITH regional_sales AS (
    SELECT Region,
           SUM(Sales) AS Revenue
    FROM sales
    GROUP BY Region
)

SELECT *
FROM regional_sales
ORDER BY Revenue DESC;