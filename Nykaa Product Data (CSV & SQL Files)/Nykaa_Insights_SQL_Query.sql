CREATE database nykaa_insights_db;

USE nykaa_insights_db;

SELECT * FROM product_catalog;

SELECT COUNT(*) FROM product_catalog;

-- Retrieve Product Brand and their Product Category which has the Highest Reviews Count, Highest Ratings Count, Lowest Reviews Count and Lowest Ratings Count
SELECT Product_Brand, Product_Category, MAX(Product_Ratings_Count) AS Product_Ratings_Count 
FROM product_catalog 
GROUP BY Product_Brand, Product_Category
ORDER BY Product_Ratings_Count DESC
LIMIT 5;

-- Retrieve the Product Brand and Product Category which has the Highest Discount 
SELECT DISTINCT pc1.Product_Brand, pc1.Product_Category, pc1.Product_Discount 
FROM product_catalog pc1
WHERE pc1.Product_Discount != 0 AND pc1.Product_Discount = (SELECT MAX(pc2.Product_Discount) 
															  FROM product_catalog pc2 
															  WHERE pc1.Product_Brand = pc2.Product_Brand AND pc2.Product_Discount != 0) 
															  ORDER BY pc1.Product_Discount DESC;

-- SELECT DISTINCT pc1.Product_Brand, pc1.Product_Category, pc1.Product_Discount 
-- FROM product_catalog pc1
-- WHERE pc1.Product_Discount != "No Discount" AND CAST(REPLACE(pc1.Product_Discount, "%", "") AS UNSIGNED) = (SELECT MAX(CAST(REPLACE(pc2.Product_Discount, "%", "") AS UNSIGNED)) 
-- 															  FROM product_catalog pc2 
--                                                               WHERE pc1.Product_Brand = pc2.Product_Brand AND pc2.Product_Discount != "No Discount");

-- SELECT Product_Brand, Product_Category, CONCAT(MAX(CAST(REPLACE(Product_Discount, "%", "") AS UNSIGNED)), "%") AS Top_Discount
-- FROM product_catalog
-- GROUP BY Product_Brand, Product_Category;

-- Retrieve the Total Stock Count by Product Category
SELECT Product_Category, Product_Stock_Status, COUNT(Product_Stock_Status) AS Total_Stock
FROM product_catalog
GROUP BY Product_Category, Product_Stock_Status
ORDER BY Product_Stock_Status, Total_Stock DESC;

-- Find the Top 5 Products with the Largest Price Difference due to Offer Price
SELECT Product_Name, Product_Price_Difference 
FROM product_catalog
ORDER BY Product_Price_Difference DESC
LIMIT 5;

-- Retrieve the Product Rating Scale Count by Product Brand and Product Rating Scale
SELECT Product_Brand, Product_Rating_Scale, COUNT(Product_Rating_Scale) AS Rating_Scale_Count
FROM product_catalog
GROUP BY Product_Brand, Product_Rating_Scale
ORDER BY Product_Brand, Rating_Scale_Count DESC;

-- Find the Top 5 Brand which has the Highest Discount
SELECT Product_Brand, CONCAT(MAX(Product_Discount), "%") AS Product_Discount
FROM product_catalog
GROUP BY Product_Brand
ORDER BY Product_Discount DESC
LIMIT 5;

-- SELECT Product_Brand, CONCAT(MAX(CAST(REPLACE(Product_Discount, "%", "") AS UNSIGNED)), "%") AS Product_Discount
-- FROM product_catalog
-- GROUP BY Product_Brand
-- ORDER BY Product_Discount DESC
-- LIMIT 5;

-- Count the Total Number of Best Seller by Product Brand
SELECT Product_Brand, COUNT(Product_Highlight) AS Total_BestSeller
FROM product_catalog
GROUP BY Product_Brand 
ORDER BY Total_BestSeller DESC;

-- SELECT Product_Brand, Product_Highlight
-- FROM product_catalog 
-- WHERE Product_Highlight = "BESTSELLER";

-- Count the Total Product Stock Status
SELECT Product_Stock_Status, COUNT(Product_Stock_Status) AS Count
FROM product_catalog
GROUP BY Product_Stock_Status;