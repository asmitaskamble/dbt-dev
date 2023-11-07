CREATE VIEW dm_property_type AS
SELECT
    date_trunc('month', date_column)::date AS month_year,
    property_type,
    room_type,
    accommodates,
    COUNT(DISTINCT CASE WHEN listing_status = 'active' THEN listing_id END) AS active_listings,
    MIN(CASE WHEN listing_status = 'active' THEN price END) AS min_price_active,
    MAX(CASE WHEN listing_status = 'active' THEN price END) AS max_price_active,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CASE WHEN listing_status = 'active' THEN price END) AS median_price_active,
    AVG(CASE WHEN listing_status = 'active' THEN price END) AS avg_price_active,
    COUNT(DISTINCT CASE WHEN listing_status = 'active' THEN host_id END) AS distinct_hosts,
    AVG(CASE WHEN listing_status = 'active' THEN review_scores_rating END) AS avg_review_score_active,
    (COUNT(CASE WHEN listing_status = 'active' THEN listing_id END) FILTER(WHERE EXTRACT(YEAR FROM date_column) = EXTRACT(YEAR FROM date_column) - 1) - 1) / NULLIF(COUNT(CASE WHEN listing_status = 'active' THEN listing_id END), 0) AS pct_change_active_listings,
    (COUNT(CASE WHEN listing_status = 'inactive' THEN listing_id END) FILTER(WHERE EXTRACT(YEAR FROM date_column) = EXTRACT(YEAR FROM date_column) - 1) - 1) / NULLIF(COUNT(CASE WHEN listing_status = 'inactive' THEN listing_id END), 0) AS pct_change_inactive_listings,
    SUM(CASE WHEN listing_status = 'active' THEN total_stays END) AS total_stays,
    SUM(CASE WHEN listing_status = 'active' THEN estimated_revenue END) / NULLIF(COUNT(CASE WHEN listing_status = 'active' THEN listing_id END), 0) AS avg_estimated_revenue_active
FROM
    facts_orders
GROUP BY 1, 2, 3, 4
ORDER BY 2, 3, 4, 1;
