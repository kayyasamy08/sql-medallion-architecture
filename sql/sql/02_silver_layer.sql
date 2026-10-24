CREATE OR REFRESH STREAMING TABLE silver_decathlon
COMMENT "Silver layer: Cleaned Decathlon product data"
AS
SELECT DISTINCT
objectID,
modelId,
brand,
productName,
slug,
web_page,
image,
rating,
reviews,
sellingPrice,
mrp,
discount,
isExpressEligible,
ingestion_timestamp
FROM STREAM(bronze_decathlon)
WHERE productName IS NOT NULL
AND TRIM(productName) <> ''
AND brand IS NOT NULL
AND TRIM(brand) <> ''
AND sellingPrice IS NOT NULL;
