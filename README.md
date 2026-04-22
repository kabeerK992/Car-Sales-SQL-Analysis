# 🚗 Car Sales Analysis — SQL Project

> **A complete SQL data analysis project solving 12 real business problems using PostgreSQL**

---

## 📌 Project Overview

AutoDrive Motors is a mid-sized automobile dealership network operating across multiple regions.
Despite growing operations, the management team lacked a clear, data-driven view of sales performance,
customer behavior, and inventory efficiency.

This project uses **pure SQL** to analyze car sales transaction data and deliver actionable business insights.

---

## ❓ Business Problem

The company was facing these key challenges:

- ❌ Could not identify which **regions, dealers, or models** were driving revenue
- ❌ **Inventory was misaligned** — wrong models stocked in wrong regions
- ❌ **Customer segments** were not being targeted with the right products
- ❌ **Monthly sales fluctuated** with no early warning system
- ❌ **Underperforming dealers** were not being identified in time

---

## 🎯 What This Project Solves

| # | Business Question | Problem Solved |
|---|---|---|
| Q1 | Total Revenue | Understand overall business scale |
| Q2 | Region-wise Sales | Find top & weak performing regions |
| Q3 | Income vs Purchase Behavior | Segment customers for targeting |
| Q4 | Top 3 Models per Region | Optimize regional inventory |
| Q5 | Month-over-Month Growth | Detect sales decline early |
| Q6 | Most Popular Car Model | Focus marketing resources |
| Q7 | Above Average Dealers | Identify top performers |
| Q8 | Body Style Popularity | Stock the right vehicle types |
| Q9 | Transmission Preference | Balance automatic vs manual stock |
| Q10 | Underperforming Models | Remove or replace poor sellers |
| Q11 | Gender Purchase Behavior | Gender-targeted campaigns |
| Q12 | Color vs Body Style | Color-specific inventory decisions |

---

## 🗃️ Dataset Overview

| Field | Detail |
|---|---|
| **Table** | car_sales |
| **Total Columns** | 13 |
| **Database** | PostgreSQL |
| **Key Fields** | price, dealer_region, company, model, transmission, body_style, gender, color, annual_income |

---

## 🛠️ Tools & Skills Used

- **Database** — PostgreSQL
- **Aggregations** — SUM, AVG, COUNT
- **Window Functions** — RANK(), LAG()
- **CTEs** — WITH clause for complex queries
- **CASE WHEN** — Customer segmentation
- **Subqueries** — Dealer performance comparison
- **Date Functions** — DATE_TRUNC for time series
- **Error Handling** — NULLIF for division safety
- **JOINs** — Regional performance analysis

---

## 📁 Project Files

| File | Description |
|---|---|
| `car_sales_analysis.sql` | All 12 SQL queries with insights & recommendations |
| `Car_Sales_SQL_Analysis_Kabeer_Khan.pdf` | Full project report with business case study |

---

## 🚀 How to Run

1. Install **PostgreSQL** on your system
2. Open **pgAdmin** or any SQL client
3. Create a new database
4. Run the `CREATE TABLE` query from the `.sql` file
5. Import your CSV dataset
6. Run queries one by one and view results

---

## 👤 Author

**Kabeer Khan**
- 📅 Date: April 2026
- 🛠️ Tool: PostgreSQL
- 📊 Type: SQL Data Analysis Portfolio Project

---

## 📄 Project Report

> 📥 **[Download Full PDF Report](./Car_Sales_SQL_Analysis_Kabeer_Khan.pdf)**
> 
> The PDF includes the complete business case study, all queries, insights, recommendations and key findings summary.

---

*⭐ If you found this project helpful, feel free to star the repository!*

