SELECT
     DATE_TRUNC('month', search_date)       AS MONTH
    ,search_term                            AS ROLE
    ,count(*)                               AS POSTINGS
FROM 
    {{ ref('job_postings') }}
GROUP BY
     MONTH 
    ,ROLE
ORDER BY
     MONTH 
    ,ROLE
