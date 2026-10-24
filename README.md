# SQL Medallion Architecture Using Databricks

## Project Overview

This project demonstrates the Medallion Architecture using SQL in Databricks to process Decathlon product data through Bronze, Silver, and Gold layers.

The goal is to organize raw product data, clean incomplete records, and generate brand-level business metrics.

## Architecture

Source Data → Bronze Layer → Silver Layer → Gold Layer

### 1. Bronze Layer

* Reads raw data from the source table `workspace.default.decathlon_21439`.
* Adds an `ingestion_timestamp` column to track ingestion time.
* Stores data in the `bronze_decathlon` streaming table.

### 2. Silver Layer

* Removes exact duplicate rows using `SELECT DISTINCT`.
* Filters records with missing or empty product names and brand names.
* Excludes records where `sellingPrice` is NULL.
* Stores the cleaned records in the `silver_decathlon` streaming table.

### 3. Gold Layer

Creates a materialized view named `gold_decathlon_summary` with brand-level metrics:

* Product count
* Average, minimum, and maximum selling price
* Average, minimum, and maximum MRP
* Average and maximum rating
* Total and average reviews
* Express-delivery-eligible product count

## Technologies Used

* SQL
* Databricks
* Medallion Architecture
* Streaming Tables
* Materialized Views

## Project Structure

```text
sql-medallion-architecture/
├── README.md
└── sql/
    ├── 01_bronze_layer.sql
    ├── 02_silver_layer.sql
    └── 03_gold_layer.sql
```

## Key Learnings

* Organizing data into Bronze, Silver, and Gold layers
* Applying SQL-based data cleaning
* Creating aggregate metrics for business analysis
* Using streaming tables and materialized views in Databricks

## Output

The Gold layer summarizes product metrics by brand and can support product-price and rating analysis.

## Author

Ayyasamy
