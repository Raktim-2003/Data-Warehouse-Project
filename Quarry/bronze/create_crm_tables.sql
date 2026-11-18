

CREATE TABLE IF NOT EXISTS bronze_cust_info
(
    cst_id VARCHAR(255),
    cst_key VARCHAR(255),
    cst_firstname VARCHAR(255),
    cst_lastname VARCHAR(255),
    cst_marital_status VARCHAR(255),
    cst_gndr VARCHAR(255),
    cst_create_date VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS bronze_prd_info
(
    prd_id VARCHAR(255),
    prd_key VARCHAR(255),
    prd_nm VARCHAR(255),
    prd_cost VARCHAR(255),
    prd_line VARCHAR(255),
    prd_start_dt VARCHAR(255),
    prd_end_dt VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS bronze_sales_details
(
   sls_ord_num VARCHAR(255),
   sls_prd_key VARCHAR(255),
   sls_cust_id VARCHAR(255),
   sls_order_dt VARCHAR(255),
   sls_ship_dt VARCHAR(255),
   sls_due_dt VARCHAR(255),
   sls_sales VARCHAR(255),
   sls_quantity VARCHAR(255),
   sls_price VARCHAR(255)
);