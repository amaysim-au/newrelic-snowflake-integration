-- https://docs.snowflake.com/en/sql-reference/account-usage/query_history.html
select QUERY_ID, 
CASE
 WHEN QUERY_TYPE = 'INSERT' THEN '<redacted>'
 ELSE QUERY_TEXT
END AS QUERY_TEXT,
(EXECUTION_TIME / 60000) as EXEC_TIME,
WAREHOUSE_NAME,
USER_NAME,
EXECUTION_STATUS,
START_TIME
from "SNOWFLAKE"."ACCOUNT_USAGE"."QUERY_HISTORY" 
where EXECUTION_STATUS = 'SUCCESS' 
and start_time >= dateadd('hour',-4,current_timestamp());