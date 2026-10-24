CREATE OR REFRESH STREAMING TABLE bronze_decathlon
COMMENT "Bronze layer: Raw Decathlon product records"
AS
SELECT
    *,
    current_timestamp() AS ingestion_timestamp
FROM STREAM(workspace.default.decathlon_21439);

select * from bronze_decathlon;

SELECT *
FROM bronze_decathlon
LIMIT 10;

--ALTER TABLE workspace.default.decathlon_21439
--RENAME COLUMN `web page` TO web_page;
