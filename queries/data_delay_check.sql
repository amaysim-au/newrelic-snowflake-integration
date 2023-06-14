select * from amaysimdw.monitoring.compass_rs_sf_count_check 
where 
-- temporarily trying with previous 100 days since there's no data for a while
jobruntime >= date_trunc(day, current_date-1) 
AND (DR_COUNT <> SF_COUNT
OR  SF_COUNT <> COMPASS_COUNT
OR DR_COUNT <> COMPASS_COUNT)
order by JOBRUNTIME desc; 