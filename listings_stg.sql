{{
    config(
        unique_key='listings_id'
    )
}}

with

source  as (

    select * from {{ ref('listings_snapshot') }}

),

renamed as (
    select
        listing_id as listing_id,
        scrape_id as scrape_id,
        scraped_date as scrape_date,
        host_id as host_id,
        case when host_name = 'NaN' then 0 else host_name end as host_name,
        case when host_since = 'NaN' then 0 else host_since end as host_since,
        host_is_superhost as host_is_superhost,
        case when host_neighbourhood = 'NaN' then 0 else host_neighbourhood end as host_neighbourhood,
        case when listing_neighbourhood = 'NaN' then 0 else listing_neighbourhood end as listing_neighbourhood,
        case when property_type = 'NaN' then 0 else property_type end as property_type,
        case when room_type = 'NaN' then 0 else room_type end as room_type,
        accommodates as accommodates,
        price as price,
        has_availability as has_availability,
        availability_30 as availability_30,
        case when number_of_reviews = 'NaN' then 0 else number_of_reviews end as number_of_reviews,
        review_scores_rating as review_scores_rating,
        review_scores_accuracy as review_scores_accuracy,
        review_scores_cleanliness as review_scores_cleanliness,
        review_scores_checkin as review_scores_checkin,
        review_scores_communication as review_scores_communication,
        review_scores_value as review_scores_value


    from source
),

-- unknown as (
--     select 
--         0 as brand_id,
--         'unknown' as brand_description,
--         '1900-01-01'::timestamp  as dbt_valid_from,
--         null::timestamp as dbt_valid_to

-- )
-- select * from unknown
-- union all 

select * from renamed