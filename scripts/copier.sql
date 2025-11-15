INSERT INTO [silver].[crm_prd_info] (
    prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt
)
SELECT
    prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt
FROM [bronze].[prd_info];

INSERT INTO [silver].[crm_sales_details] (
    sls_ord_num, sls_prd_key, sls_cust_id,
    sls_order_dt, sls_ship_dt, sls_due_dt,
    sls_sales, sls_quantity, sls_price
)
SELECT
    sls_ord_num, sls_prd_key, sls_cust_id,
    sls_order_dt, sls_ship_dt, sls_due_dt,
    sls_sales, sls_quantity, sls_price
FROM [bronze].[sales_details];

INSERT INTO [silver].[erp_loc_a101] (
    cid, cntry
)
SELECT
    cid, cntry
FROM [bronze].[LOC_A101];


INSERT INTO [silver].[erp_cust_az12] (
    cid, bdate, gen
)
SELECT
    cid, bdate, gen
FROM [bronze].[CUST_AZ12];
