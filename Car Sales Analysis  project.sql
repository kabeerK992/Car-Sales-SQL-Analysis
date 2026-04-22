/*
=========================================================================================================
                                    CAR SALES ANALYSIS PROJECT
=========================================================================================================
 Author        : Kabeer Khan
 Date          : April 2026
 Database      : PostgreSQL
 Dataset       : Car Sales Records

------------------------------------------------
 DATASET OVERVIEW
------------------------------------------------
 Table         : car_sales
 Columns       : 13
 Key Fields    : price, dealer_region, company,
                 model, transmission, body_style,
                 gender, color, annual_income

------------------------------------------------
*/

DROP TABLE IF EXISTS car_sales;

--Create a table
CREATE TABLE car_sales (
    car_id VARCHAR(20) PRIMARY KEY,
    date DATE,
    customer_name VARCHAR(50),
    gender VARCHAR(10),
    annual_income Numeric(12,2),
    company VARCHAR(50),
    model VARCHAR(50),
    transmission VARCHAR(20),
    color VARCHAR(20),
    price Numeric(10,2),
    dealer_name VARCHAR(50),
    dealer_region VARCHAR(50),
    body_style VARCHAR(20)
);

--Import data here
SELECT * FROM car_sales;

---Business Insight Find now
--Q1. What is Total Revenue?
SELECT '$ ' || ROUND(SUM(price)/1000000.0, 2) || ' M' AS total_revenue
FROM car_sales;

/* Insight - Shows overall business performance
   Recommendation - Focus on high-selling models to maximize revenue further */ 

--Q2. Which Region Generates Highest Sales?
SELECT dealer_region, '$ '|| ROUND(SUM(price)/1000000.0, 2) || 'M' AS total_sales
FROM car_sales
GROUP by dealer_region 
ORDER BY  SUM(price)/1000000.0 DESC;

/* Insight - Identifies top-performing regions
Recommendation - 1.Invest more marketing in low-performing regions 
                 2.Expand operations in top regions */

--Q3. Customer Income vs Purchase Behavior
SELECT 
  CASE 
      WHEN annual_income < 200000 THEN 'Low Income'
	  WHEN annual_income BETWEEN 200000 AND 800000 THEN 'Middle Income'
	  ELSE 'High Income'
  END AS income_group,
  COUNT(*) AS customers,
  ROUND(AVG(price),2) AS avg_purchase
FROM car_sales
GROUP BY income_group;

/* Insight - Understand customer segmentation
Recommendation - 1.Target premium cars to high-income group
                2.Offer financing for low-income group */

--Q4. Top 3 Selling Cars in Each Region
WITH top_sales as (
 SELECT 
  dealer_region, model, COUNT(*) AS total_selling,
  RANK() OVER(PARTITION BY dealer_region ORDER BY COUNT(*) DESC) AS rank
  FROM car_sales
  GROUP BY dealer_region, model
)
SELECT * FROM top_sales
WHERE rank <= 3;

/* Insight - Each region has different top-selling cars
Recommendation - Customize inventory based on region demand */

--Q5. Sales Growth Month-over-Month
WITH monthly_sales AS (
 SELECT 
   DATE_TRUNC('month', date)::DATE AS month,
   SUM(price) AS revenue
   FROM car_sales
   GROUP BY month 
)
SELECT month, revenue, 
LAG(revenue) OVER(ORDER BY month) AS prev_month,
ROUND(
(revenue - LAG(revenue) OVER(ORDER BY month)) * 100.0
/LAG(revenue) OVER(ORDER BY month),2) AS growth_percentage
FROM monthly_sales;

/* Insight - Some months show decline → unstable sales.
Recommendation - 1.Promotions during low months
                2.Seasonal campaigns */

--Q6. Most Popular Car Model Overal
SELECT company, model, COUNT(*) AS total_sales
FROM car_sales
GROUP BY company, model
ORDER BY total_sales DESC
LIMIT 1;


/* Insight -Absolute top-selling model
Recommendation - Focus more marketing on best model */


--Q7.Which Dealers Perform Above Average?
WITH dealer_sales AS (
  SELECT dealer_name, SUM(price) AS revenue
  FROM car_sales
  GROUP BY dealer_name
)
SELECT *
FROM dealer_sales
WHERE revenue > (SELECT AVG(revenue) FROM dealer_sales);

/* Insight - Only few dealers outperform others
Recommendation - 1.Learn from top dealers
                 2. Train underperformers */

--Q8. Which Body Style is Most Popular?
SELECT body_style, COUNT(*) AS total_sales
FROM car_sales
GROUP BY body_style
ORDER BY total_sales DESC;

/* Insight - SUV & Hatchback most demand 
Recommendation - Increase SUV & Hatchback inventory */

--Q9. Which Transmission Type is Customer More Preferred?
SELECT transmission, COUNT(*) AS total_sales
FROM car_sales
GROUP BY transmission;

/* Insight - Automatic vs Manual preference. Not big different between this in sales
Recommendation  - Focus on both (Manual & Automatic) */

--Q10. Which car models are underperforming compared to their regional average sales
WITH model_sales AS (
 SELECT
   dealer_region, model, COUNT(*) AS total_sales
   FROM car_sales
   GROUP BY dealer_region, model
),
regional_avg_sales AS (
 SELECT
    dealer_region, ROUND(AVG(total_sales),2) AS avg_sales
	FROM model_sales
	GROUP BY dealer_region
)
SELECT m.dealer_region, m.model, m.total_sales,
r.avg_sales, 
(m.total_sales - r.avg_sales) AS performance_gap
FROM model_sales m
JOIN regional_avg_sales r
ON m.dealer_region = r.dealer_region
WHERE m.total_sales < r.avg_sales
ORDER BY performance_gap;

/* Insight - Some models are dragging down overall regional performance
Recommendation - 1. Remove or reduce stock of underperforming models
                 2. Replace with regionally popular models */

--Q11.Gender Based Purchase Behavior
SELECT gender, COUNT(*) AS total_purchases,
'$ ' || ROUND(SUM(price)/1000000.0, 2) || 'M' AS total_revenue
FROM car_sales
GROUP BY gender
ORDER BY total_revenue DESC;

/* Insight - Shows which gender drives more revenue
   Recommendation - 1. Target marketing campaigns by gender
                    2. Stock preferred models for each gender */

--Q12 — Most Popular Color by Body Style:
SELECT body_style, color,
COUNT(*) AS total_sales
FROM car_sales
GROUP BY body_style, color
ORDER BY body_style, total_sales DESC;

/* Insight - Different body styles have different color preferences
   Recommendation - 1. Stock popular colors per body style
                    2. Avoid ordering slow-moving color combinations */






