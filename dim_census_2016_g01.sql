{{
    config(
        unique_key='scraped_id'
    )
}}

select * from {{ ref('nsw_code_stg') }}