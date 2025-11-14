SELECT cst_id,
COUNT(*) FROM [bronze].[cust_info]
GROUP BY  cst_id 
HAVING COUNT(*) > 1 OR cst_id IS NULL;

SELECT cst_firstname FROM [bronze].[cust_info]
WHERE cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname FROM [bronze].[cust_info]
WHERE cst_lastname != TRIM(cst_lastname);

SELECT cst_key FROM [bronze].[cust_info]
WHERE cst_key != TRIM(cst_key);

SELECT cst_gndr FROM [bronze].[cust_info]
WHERE cst_gndr != TRIM(cst_gndr);
