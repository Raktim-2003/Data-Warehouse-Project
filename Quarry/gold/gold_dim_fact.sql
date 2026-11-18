-- gold customers

CREATE VIEW V_gold_dim_customer AS
WITH 
    customer_data AS (
        SELECT
        ci.cst_id AS customer_id,
        ci.cst_key AS customer_key,
        ci.cst_firstname AS first_name,
        ci.cst_lastname AS last_name,
        la.cntry AS country,
        ci.cst_marital_status AS marital_status,
        CASE
            WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr
            ELSE COALESCE(ca.gen, 'n/a')
        END AS gender,
        ca.bdate AS birthdate,
        ci.cst_create_date AS create_date,
        ROW_NUMBER() OVER(PARTITION BY ci.cst_id ORDER BY ci.cst_create_date DESC) AS rn
        FROM silver_cust_info AS ci
        LEFT JOIN silver_cust_az12 AS ca 
        ON ci.cst_id = ca.cid
        LEFT JOIN silver_loc_a101 AS la
        ON ci.cst_key = la.cid
    ) 

SELECT 
    ROW_NUMBER() 
    OVER(ORDER BY  customer_id) AS customer_key,
    customer_id,
    customer_number,
    first_name,
    last_name,
    country,
    marital_status,
    gender,
    birthdate,
    create_date
    FROM customer_data
    WHERE rn = 1;

-- dimentation product

CREATE VIEW V_gold_dim_product AS 

    WITH 
    product_data AS(
        SELECT 
        pi.prd_id AS product_id,
        pi.prd_key AS product_key,
        pi.prd_nm AS product_name,
        pi.cat_id AS category_id,
        pcg.CAT AS category,
        pcg.SUBCAT AS subcategory,
        pcg.MAINTENANCE AS MAINTENANCE,
        pi.prd_cost AS cost,
        pi.prd_line AS product_line,
        ROW_NUMBER() OVER(PARTITION BY pi.prd_key ORDER BY pi.prd_start_dt DESC) AS rn
        FROM silver_prd_info AS pi
        LEFT JOIN silver_px_cat_g1v2 AS pcg
        ON pi.cat_id = pcg.id
    )

    SELECT 
    ROW_NUMBER() OVER(
        ORDER BY  product_id
    ) AS product_key,
    product_id,
    product_number,
    product_name,
    category_id,
    category,
    subcategory,
    maintenance,
    cost,
    product_line
    FROM product_data
    WHERE rn = 1;

-- fact sales
CREATE VIEW V_gold_fact_sales AS 

SELECT 
    sd.sls_order_num AS order_number,
    pr.product_key AS product_key,
    cu.customer_key AS customer_key,
    sd.sls_order_dt AS order_date,
    sd.sls_ship_dt AS shipping_date,
    sd.sls_due_dt AS due_date,
    sd.sls_sales AS sales_amount,
    sd.sls_quantity AS quantity,
    sd.sls_price AS price
    FROM 
        silver_sales_details AS sd
        LEFT JOIN V_gold_dim_product AS pr
        ON sd.sls_prd_key = pr.product_number
        LEFT JOIN V_gold_dim_customer AS cu
        ON sd.sls_cust_id = cu.customer_id;

-- check 
SELECT * FROM V_gold_dim_customer;

SELECT * FROM V_gold_dim_product ;

SELECT * FROM  V_gold_fact_sales;

SELECT *
FROM V_gold_fact_sales AS s 
    JOIN V_gold_dim_customer AS c 
    ON s.customer_key = c.customer_id
    JOIN V_gold_dim_product AS p 
    ON s.product_key = p.product_id