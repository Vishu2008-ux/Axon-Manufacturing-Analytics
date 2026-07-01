USE manufacturing_db;

1. Total Manufactured Quantity: 

SELECT 
    SUM(Produced_Qty) AS Total_Manufacture_Qty
FROM fact_production;

------------------------------------------------------------------------------------------------------------

2. Total Rejected Quantity: 

SELECT 
    SUM(Rejected_Qty) AS Total_Rejected_Qty
FROM fact_production;

---------------------------------------------------------------------------------------------------------

3. Total Processed Quantity : 

SELECT 
    SUM(Processed_Qty) AS Total_Processed_Qty
FROM fact_production;

----------------------------------------------------------------------------------------------------------

4. Total Wastage : 

SELECT 
    SUM(Produced_Qty - Processed_Qty) AS Wastage_Qty
FROM fact_production;

--------------------------------------------------------------------------------------------------------

5.Employee Rejection Analysis : 

SELECT 
    e.Employee_Name,
    SUM(f.Rejected_Qty) AS Total_Rejected_Qty
FROM fact_production f
INNER JOIN dim_employee e
ON f.Employee_Code = e.Employee_Code
GROUP BY e.Employee_Name
ORDER BY Total_Rejected_Qty DESC;

---------------------------------------------------------------------------------------------------------

6.Machine Wise Rejected Qty :

SELECT 
    m.Machine_type,
    SUM(f.Rejected_Qty) AS Total_Rejected_Qty
FROM fact_production f
INNER JOIN dim_machine m
ON f.Machine_Code = m.Machine_Code
GROUP BY m.Machine_type
ORDER BY Total_Rejected_Qty DESC;

----------------------------------------------------------------------------------------------------------

7. Production Comparison Trend KPI : 

SELECT 
    c.Month_Name,
    SUM(f.Produced_Qty) AS Total_Production
FROM fact_production f
INNER JOIN dim_calendar c
ON f.Date_FK = c.Date_FK
GROUP BY c.Month_Name
ORDER BY Total_Production DESC;
---------------------------------------------------------------------------------------------------------

8. Manufacture Vs Rejected KPI : 

SELECT 
    c.Month_Name,
    SUM(f.Produced_Qty) AS Total_Manufactured,
    SUM(f.Rejected_Qty) AS Total_Rejected
FROM fact_production f
INNER JOIN dim_calendar c
ON f.Date_FK = c.Date_FK
GROUP BY c.Month_Name
ORDER BY c.Month_Name;
---------------------------------------------------------------------------------------------------------

9. Department Wise Manufacture Vs Rejected KPI : 

SELECT 
    d.Dept_Name,
    SUM(f.Produced_Qty) AS Total_Manufactured,
    SUM(f.Rejected_Qty) AS Total_Rejected
FROM fact_production f
INNER JOIN dim_department d
ON f.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name
ORDER BY Total_Rejected DESC;

---------------------------------------------------------------------------------------------------------
