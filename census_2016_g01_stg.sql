{{
    config(
        unique_key='lga_code_2016'
    )
}}

with

source  as (

    select * from {{ ref('census_2016_g01') }}

),

renamed as (
    select
        lga_code_2016 as lga_code_2016,
        tot_p_p as tot_p_p,
        age_0_4_yr_p as age_0_4_yr_p,
        age_5_14_yr_m as age_5_14_yr_m,
        age_5_14_yr_p as age_5_14_yr_p,
        age_15_19_yr_p as age_15_19_yr_p,
        age_20_24_yr_p as age_20_24_yr_p,
        age_25_34_yr_p as age_25_34_yr_p,
        age_35_44_yr_p as age_35_44_yr_p,
        age_45_54_yr_p as age_45_54_yr_p,
        age_55_64_yr_p as age_55_64_yr_p,
        age_65_74_yr_p as age_65_74_yr_p,
        age_75_84_yr_p as age_75_84_yr_p,
        age_85ov_p as age_85ov_p,
        counted_census_night_home_p,
        count_census_nt_ewhere_aust_p as count_census_nt_ewhere_aust_p,
        indigenous_psns_aboriginal_p as indigenous_psns_aboriginal_p,
        indig_psns_torres_strait_is_p as indig_psns_torres_strait_is_p,
        indig_bth_abor_torres_st_is_p as indig_bth_abor_torres_st_is_p,
        indigenous_p_tot_p as indigenous_p_tot_p,
        birthplace_australia_p as birthplace_australia_p,
        birthplace_elsewhere_p as birthplace_elsewhere_p,
        lang_spoken_home_eng_only_p as lang_spoken_home_eng_only_p,
        lang_spoken_home_oth_lang_p as lang_spoken_home_oth_lang_p,
        australian_citizen_p as australian_citizen_p,
        age_psns_att_educ_inst_0_4_p as age_psns_att_educ_inst_0_4_p,
        age_psns_att_educ_inst_5_14_p as age_psns_att_educ_inst_5_14_p,
        age_psns_att_edu_inst_15_19_p as age_psns_att_edu_inst_15_19_p,
        age_psns_att_edu_inst_20_24_p as age_psns_att_edu_inst_20_24_p,
        age_psns_att_edu_inst_25_ov_p as age_psns_att_edu_inst_25_ov_p,
        high_yr_schl_comp_yr_12_eq_p as high_yr_schl_comp_yr_12_eq_p,
        high_yr_schl_comp_yr_11_eq_p as high_yr_schl_comp_yr_11_eq_p,
        high_yr_schl_comp_yr_10_eq_p as high_yr_schl_comp_yr_10_eq_p,
        high_yr_schl_comp_yr_9_eq_p as high_yr_schl_comp_yr_9_eq_p,
        high_yr_schl_comp_yr_8_belw_p as high_yr_schl_comp_yr_8_belw_p,
        high_yr_schl_comp_d_n_g_sch_p as high_yr_schl_comp_d_n_g_sch_p,
        count_psns_occ_priv_dwgs_p as count_psns_occ_priv_dwgs_p,
        count_persons_other_dwgs_m as count_persons_other_dwgs_m,
        count_persons_other_dwgs_p as count_persons_other_dwgs_p
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