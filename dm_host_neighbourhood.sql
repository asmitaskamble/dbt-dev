CREATE VIEW dm_host_neighbourhood AS
SELECT
    DATE_TRUNC('month', date)::DATE AS month_year,
    CASE host_neighbourhood
        WHEN 'Bondi' THEN 'Waverley'
        ELSE host_neighbourhood
    END AS host_neighbourhood_lga,
    COUNT(DISTINCT host_id) AS number_of_distinct_hosts,
    SUM(price) AS estimated_revenue,
    SUM(price) / COUNT(DISTINCT host_id) AS estimated_revenue_per_host
FROM {{ ref('facts_orders') }}
GROUP BY 1, 2
ORDER BY host_neighbourhood_lga, month_year;
