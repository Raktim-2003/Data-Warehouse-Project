-- transforming cust_az12
INSERT INTO
    silver_cust_az12(cid, bdate, gen)

SELECT 
    CASE
        WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LENGTH(cid))
        ELSE   cid
    END AS cid,
    CASE
        WHEN bdate > CURRENT_DATE() THEN NULL 
        ELSE bdate
    END AS bdate,
    CASE
        WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
        WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
        ELSE 'n/a'
    END AS gen 
FROM bronze_cust_az12;

-- transforming loc_a101
INSERT INTO 
    silver_loc_a101(cid, cntry)
SELECT 
    REPLACE(cid, '-', '') AS cid,
    CASE
        WHEN TRIM(cntry) = 'DE' THEN 'GERMANY'
        WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
        WHEN TRIM(cntry) = ''
        OR cntry IS NULL THEN 'n/a'
        ELSE TRIM(cntry)
    END AS cntry
FROM bronze_loc_a101;

-- transforming px_cat_g1v2

INSERT INTO 
    silver_px_cat_g1v2 (id, cat, subcat, maintenance)
SELECT
    TRIM(id) AS id,
    TRIM(cat) AS cat,
    TRIM(subcat) AS subcat,
    CASE
        WHEN TRIM(maintenance) = 'Yes' THEN 'Y'
        WHEN TRIM(maintenance) = 'No' THEN 'N'
        ELSE 'n/a'
    END AS maintenance
FROM bronze_px_cat_g1v2;