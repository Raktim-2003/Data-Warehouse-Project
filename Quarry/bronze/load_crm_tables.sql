
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Dataset\\source_crm\\cust_info.csv'
INTO TABLE bronze_cust_info
FIELDS TERMINATED  BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    @cst_id,@cst_key,@cst_firstname,@cst_lastname,
    @cst_marital_status,@cst_gndr,@cst_create_date
)
SET 
    cst_id = NULLIF(@cst_id, ''),
    cst_key = NULLIF(@cst_key, ''),
    cst_firstname = NULLIF(@cst_firstname, ''),
    cst_lastname = NULLIF(@cst_lastname, ''),
    cst_marital_status = NULLIF(@cst_marital_status, ''),
    cst_gndr = NULLIF(@cst_gndr, ''),
    cst_create_date = NULLIF(@cst_create_date, '');

-- check if data is loaded 
SELECT * FROM bronze_cust_info ;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Dataset\\source_crm\\prd_info.csv'
INTO TABLE bronze_prd_info
FIELDS TERMINATED  BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
  @prd_id,@prd_key,@prd_nm,@prd_cost,
  @prd_line,@prd_start_dt,@prd_end_dt
)
SET 
    prd_id = NULLIF(@prd_id, ''),
    prd_key = NULLIF(@prd_key, ''),
    prd_nm = NULLIF(@prd_nm, ''),
    prd_cost = NULLIF(@prd_cost, ''),
    prd_line = NULLIF(@prd_line, ''),
    prd_start_dt = NULLIF(@prd_start_dt, ''),
    prd_end_dt = NULLIF(@prd_end_dt, '');

-- check if data is loaded 
SELECT * FROM bronze_prd_info ;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Dataset\\source_crm\\sales_details.csv'
INTO TABLE bronze_sales_details
FIELDS TERMINATED  BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    @sls_ord_num,@sls_prd_key,@sls_cust_id,@sls_order_dt,
    @sls_ship_dt,@sls_due_dt,@sls_sales,@sls_quantity,@sls_price
)
SET 
    sls_ord_num = NULLIF(@sls_ord_num, ''),
    sls_prd_key = NULLIF(@sls_prd_key, ''),
    sls_cust_id = NULLIF(@sls_cust_id, ''),
    sls_order_dt = NULLIF(@sls_order_dt, ''),
    sls_ship_dt = NULLIF(@sls_ship_dt, ''),
    sls_due_dt = NULLIF(@sls_due_dt, ''),
    sls_sales = NULLIF(@sls_sales, ''),
    sls_quantity = NULLIF(@sls_quantity, ''),
    sls_price = NULLIF(@sls_price, '');

-- check if data is loaded 
SELECT * FROM bronze_sales_details ;

