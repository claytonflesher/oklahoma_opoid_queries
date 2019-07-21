CREATE TABLE arcos_wp_oklahoma (
    REPORTER_DEA_NO TEXT,
    REPORTER_BUS_ACT TEXT,
    REPORTER_NAME TEXT,
    REPORTER_ADDL_CO_INFO TEXT,
    REPORTER_ADDRESS1 TEXT,
    REPORTER_ADDRESS2 TEXT,
    REPORTER_CITY TEXT,
    REPORTER_STATE TEXT,
    REPORTER_ZIP INT,
    REPORTER_COUNTY TEXT,
    BUYER_DEA_NO TEXT,
    BUYER_BUS_ACT TEXT,
    BUYER_NAME TEXT,
    BUYER_ADDL_CO_INFO TEXT,
    BUYER_ADDRESS1 TEXT,
    BUYER_ADDRESS2 TEXT,
    BUYER_CITY TEXT,
    BUYER_STATE TEXT,
    BUYER_ZIP INT,
    BUYER_COUNTY TEXT,
    TRANSACTION_CODE TEXT,
    DRUG_CODE INT,
    NDC_NO TEXT,
    DRUG_NAME TEXT,
    QUANTITY NUMERIC(20, 16),
    UNIT TEXT,
    ACTION_INDICATOR TEXT,
    ORDER_FORM_NO TEXT,
    CORRECTION_NO TEXT,
    STRENGTH TEXT,
    TRANSACTION_DATE INT,
    CALC_BASE_WT_IN_GM NUMERIC(20, 16),
    DOSAGE_UNIT numeric,
    TRANSACTION_ID INT,
    Product_Name TEXT,
    Ingredient_Name TEXT,
    Measure TEXT,
    MME_Conversion_Factor NUMERIC(2, 1),
    Combined_Labeler_Name TEXT,
    Revised_Company_Name TEXT,
    Reporter_family TEXT,
    dos_str TEXT
);

drop table arcos_wp_oklahoma;

copy arcos_wp_oklahoma from '/Users/claytonflesher/Downloads/arcos_ok.tsv' delimiter E'\t';

select buyer_name, buyer_address1, buyer_address2,
       buyer_city, sum(calc_base_wt_in_gm) / sum(dosage_unit) as average_dosage_in_grams,
       sum(calc_base_wt_in_gm) as total_grams, sum(dosage_unit) as doses_purchased
from public.arcos_wp_oklahoma
where buyer_county = 'OKLAHOMA'
group by buyer_name, buyer_address1, buyer_address2, buyer_city
order by total_grams desc;
