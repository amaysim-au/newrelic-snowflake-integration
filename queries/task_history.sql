-- https://docs.snowflake.com/en/sql-reference/account-usage/task_history
-- Latency of up to 45 minutes
SELECT * 
FROM snowflake.account_usage.task_history
WHERE
COMPLETED_TIME >= dateadd(minute, -180, getdate())
order by completed_time desc
;