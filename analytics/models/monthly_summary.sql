-- models/monthly_summary.sql: monthly totals + remote share from two refs
WITH totals AS (
    SELECT 
        MONTH
        ,SUM(POSTINGS) AS TOTAL_POSTINGS
    FROM 
        {{ ref('jobs_per_month') }}
    GROUP BY 
        MONTH
),
remote AS (
    SELECT 
        DATE_TRUNC('month', SEARCH_DATE) AS MONTH
        ,COUNT(*) AS REMOTE_POSTINGS
    FROM 
        {{ ref('job_postings') }}
    WHERE 
        JOB_WORK_FROM_HOME
    GROUP BY MONTH
)
SELECT 
    MONTH
    ,TOTAL_POSTINGS
    ,REMOTE_POSTINGS
    ,ROUND(100.0 * REMOTE_POSTINGS / TOTAL_POSTINGS, 1) AS PCT_REMOTE    
FROM 
    totals
JOIN 
    remote USING (MONTH)
ORDER BY 
    MONTH
