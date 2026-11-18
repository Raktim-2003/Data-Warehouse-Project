
-- transfar data from cust_imfo

INSERT INTO 
    silver_cust_info(
        cst_id,
        cst_key,
        cst_firstname,
        cst_lastname,
        cst_marital_status,
        cst_gndr
    )

    SELECT
    cst_id,
    cst_key,
    TRIM(cst_firstname) AS cst_firstname,
    TRIM(cst_lastname) AS cst_lastname,
    CASE 
        WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
        WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
        ELSE 'n/a'
    END AS cst_marital_status,
    CASE 
        WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
        WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
        ELSE 'n/a'
    END AS cst_gndr
    FROM (
        SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY  cst_create_date DESC ) AS RN
        FROM bronze_cust_info
    ) AS t
    WHERE t.rn = 1
    AND cst_id IS NOT NULL;


-- transfar data from prd_info.csv

INSERT INTO silver_prd_info (
    prd_id,
    cat_id,
    prd_key,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt
)

SELECT prd_id,
    REPLACE(
        SUBSTRING(prd_key, 1, 5),
        '-',
        '_'
    ) AS cat_id,    -- extract the category id
    SUBSTRING(prd_key, 7, LENGTH(prd_key)) AS prd_key,
    prd_nm,
    COALESCE(prd_cost, 0) AS prd_cost,
    CASE
        WHEN UPPER(TRIM(prd_line)) = 'M' THEN 'Mountain'
        WHEN UPPER(TRIM(prd_line)) = 'R' THEN 'Road'
        WHEN UPPER(TRIM(prd_line)) = 'S' THEN 'Other Sales'
        WHEN UPPER(TRIM(prd_line)) = 'T' THEN 'Touring'
        ELSE 'n/a'
    END AS prd_line,
    prd_start_dt,
    DATE_SUB(
        LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt),
        INTERVAL 1 DAY
    ) AS prd_end_dt

    FROM bronze_prd_info;

-- transforming data from sales details

INSERT INTO silver_sales_details (
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price
)

SELECT 
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    CASE 
        WHEN LENGTH(CAST(sls_order_dt AS CHAR)) != 8 THEN NULL
        ELSE STR_TO_DATE(
            CAST(sls_order_dt AS CHAR),
            '%Y%m%d'
        )
    END AS sls_order_dt,
    CASE
        WHEN LENGTH(CAST(sls_ship_dt AS CHAR)) != 8 THEN NULL 
        ELSE STR_TO_DATE(
            CAST(sls_ship_dt AS CHAR),
            '%Y%d%m'
        )
    END AS sls_ship_dt,
    CASE
        WHEN LENGTH(CAST(sls_due_dt AS CHAR)) != 8 THEN NULL 
        ELSE STR_TO_DATE(
            CAST(sls_due_dt AS CHAR),
            '%Y%d%m'
        )
    END AS sls_due_dt,
    CASE
        WHEN sls_sales IS NULL 
        OR sls_sales <= 0
        OR sls_sales != sls_quantity * ABS(sls_price) THEN sls_quantity * ABS(sls_price)
        ELSE sls_sales
    END AS sls_sales,
    sls_quantity,
    CASE
        WHEN sls_price IS NULL 
        OR sls_price <= 0 THEN ABS(sls_sales / sls_quantity)
        ELSE ABS(sls_price)
    END AS sls_price
FROM bronze_sales_details;


