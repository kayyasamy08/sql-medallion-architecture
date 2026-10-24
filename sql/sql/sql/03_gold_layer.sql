-- Gold Layer: Business-Level Aggregations
-- Source: silver_decathlon
-- Purpose: Create summary metrics for Decathlon product analysis

CREATE OR REFRESH MATERIALIZED VIEW gold_decathlon_summary
COMMENT "Gold layer: Aggregated Decathlon product metrics by brand"
CLUSTER BY (brand)
AS
SELECT
brand,
COUNT(*) AS product_count,
ROUND(AVG(sellingPrice), 2) AS avg_selling_price,
MIN(sellingPrice) AS min_selling_price,
MAX(sellingPrice) AS max_selling_price,
ROUND(AVG(mrp), 2) AS avg_mrp,
MIN(mrp) AS min_mrp,
MAX(mrp) AS max_mrp,
ROUND(AVG(rating), 2) AS avg_rating,
MAX(rating) AS max_rating,
SUM(reviews) AS total_reviews,
ROUND(AVG(reviews), 2) AS avg_reviews,
COUNT(
CASE
WHEN isExpressEligible = true THEN 1
END
) AS express_eligible_products
FROM silver_decathlon
GROUP BY ALL;

-- View Gold layer output
SELECT *
FROM gold_decathlon_summary;
