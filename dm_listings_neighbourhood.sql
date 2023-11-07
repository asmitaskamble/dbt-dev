SELECT
    date_trunc('month', date_column)::date AS month_year,
    listing_neighbourhood,
    SUM(CASE WHEN listing_status = 'active' THEN 1 ELSE 0 END) / COUNT(DISTINCT order_id) AS active_listings_rate,
    MIN(CASE WHEN listing_status = 'active' THEN price END) AS min_price_active_listings,
    MAX(CASE WHEN listing_status = 'active' THEN price END) AS max_price_active_listings,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CASE WHEN listing_status = 'active' THEN price END) AS median_price_active_listings,
    AVG(CASE WHEN listing_status = 'active' THEN price END) AS avg_price_active_listings,
    COUNT(DISTINCT CASE WHEN listing_status = 'active' THEN host_id END) AS distinct_hosts_active,
    AVG(CASE WHEN listing_status = 'active' AND host_is_superhost THEN 1.0 ELSE 0.0 END) AS superhost_rate,
    AVG(CASE WHEN listing_status = 'active' THEN review_scores_rating END) AS avg_review_scores_active,
    ((COUNT(DISTINCT CASE WHEN listing_status = 'active' THEN listing_id END) - LAG(COUNT(DISTINCT CASE WHEN listing_status = 'active' THEN listing_id END)) OVER (ORDER BY date_column)) / LAG(COUNT(DISTINCT CASE WHEN listing_status = 'active' THEN listing_id END)) OVER (ORDER BY date_column)) * 100 AS pct_change_active_listings,
    ((COUNT(DISTINCT CASE WHEN listing_status = 'inactive' THEN listing_id END) - LAG(COUNT(DISTINCT CASE WHEN listing_status = 'inactive' THEN listing_id END)) OVER (ORDER BY date_column)) / LAG(COUNT(DISTINCT CASE WHEN listing_status = 'inactive' THEN listing_id END)) OVER (ORDER BY date_column)) * 100 AS pct_change_inactive_listings,
    COUNT(order_id) AS total_stays,
    SUM(CASE WHEN listing_status = 'active' THEN estimated_revenue END) / COUNT(DISTINCT CASE WHEN listing_status = 'active' THEN listing_id END) AS avg_estimated_revenue_active_listings
FROM
    facts_listings
GROUP BY 1, 2
ORDER BY listing_neighbourhood, month_year;
