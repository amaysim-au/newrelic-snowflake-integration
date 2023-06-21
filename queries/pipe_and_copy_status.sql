-- for pipe_usage_history (credits related, check pipe_usage.sql -- https://docs.snowflake.com/en/sql-reference/functions/pipe_usage_history

-- this query uses copy history which has a latency of up to 2 hours
-- https://docs.snowflake.com/en/sql-reference/account-usage/copy_history
select * from snowflake.account_usage.copy_history
  where PIPE_NAME IS NOT NULL
  AND PIPE_RECEIVED_TIME  >= dateadd(minute, -180, getdate())
  order by PIPE_RECEIVED_TIME desc;