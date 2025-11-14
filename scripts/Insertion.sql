TRUNCATE TABLE [silver].[crm_cust_info];

INSERT INTO [silver].[crm_cust_info] (
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_material_status,
    cst_gndr,
    cst_create_date,
    dw_create_date
)
SELECT
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
         WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
         ELSE 'Not Available'
    END AS cst_marital_status,
    CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
         WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
         ELSE 'Not Available'
    END AS cst_gndr,
    cst_create_date,
    GETDATE() AS dw_create_date
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
    FROM [bronze].[cust_info] 
    WHERE cst_id IS NOT NULL
      AND cst_id > 0     
) t
WHERE flag_last = 1;
