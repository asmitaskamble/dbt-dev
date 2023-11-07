{{
    config(
        unique_key='scraped_id'
    )
}}

select * from {{ ref('nsw_suburb_stg') }}