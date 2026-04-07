# 🍽️ Zomato Restaurant Data Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing restaurant data from Zomato using SQL.
The goal is to extract meaningful insights such as customer preferences, restaurant performance, pricing trends, and business opportunities.

---

## 🛠️ Tools & Technologies

* SQL (MySQL)
* Database: ZomatoDB
* Dataset: Zomato Restaurant Dataset (CSV)

---

## 📂 Project Structure

```
zomato-sql-analysis/
│
├── data_cleaning.sql
├── analysis_queries.sql
├── zomato_dataset.csv
└── README.md
```

---

## 🧹 Data Cleaning Steps

* Removed null values
* Handled duplicate records
* Trimmed unnecessary spaces
* Renamed columns for better readability
* Converted data types where required

---

## 📊 Key Analysis Performed

### 🔹 Basic Analysis

* Top rated restaurants
* Most popular restaurants
* Average cost for two people

### 🔹 Business Insights

* Most common cuisines
* Area-wise restaurant distribution
* Impact of online ordering
* Cost vs rating insights

### 🔹 Advanced Analysis

* Top restaurant in each area
* Ranking using window functions
* Cost category analysis
* Rating segmentation

---

## 📈 Key Insights

* High-rated restaurants are not always the most expensive
* Areas with more restaurants show higher competition
* Online ordering and table booking impact ratings
* Budget-friendly restaurants can also have excellent ratings

---

## 🚀 How to Run the Project

1. Import the dataset into MySQL
2. Create database:

   ```sql
   CREATE DATABASE ZomatoDB;
   USE ZomatoDB;
   ```
3. Import CSV using Table Data Import Wizard
4. Run:

   * `data_cleaning.sql`
   * `analysis_queries.sql`

---

## 🎯 Project Objective

To demonstrate SQL skills including:

* Data cleaning
* Data analysis
* Aggregations & grouping
* Window functions
* Business problem solving

---

## 💼 Use Case

This project is useful for:

* Data Analyst beginners
* SQL practice
* Portfolio projects for freshers

