SELECT
    job_location AS JOB_LOCATION
    ,COUNT(*) AS POSTINGS
FROM
    {{ ref('job_postings') }}
GROUP BY
    JOB_LOCATION
ORDER BY
    POSTINGS DESC
