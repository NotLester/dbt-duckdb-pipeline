{{  config(materialized='ephemeral') }}

SELECT 
     job_id                 AS JOB_ID
    ,job_title              AS JOB_TITLE
    ,company_name           AS COMPANY_NAME
    ,job_location           AS JOB_LOCATION
    ,job_via                AS JOB_VIA
    ,job_schedule_type      AS JOB_SCHEDULE_TYPE
    ,job_work_from_home     AS JOB_WORK_FROM_HOME
    ,search_date            AS SEARCH_DATE
    ,search_term            AS SEARCH_TERM
FROM 
    {{ source('raw', 'job_postings') }}
WHERE 1=1 
    AND error IS NULL
