#Q7 - using window function
# RANK and do partition over deptarment_id then order by salary then add filter for 3 employees
# Note- RANK () can give more than 3 values if employees have same salary 
# for exact 3 rows output per department , ROW_NUMBER()

SELECT employees, Department_id, salary
FROM (
    SELECT employees, Department_id,salary,
    RANK()  OVER (
    PARTITION BY Department_id
    ORDER BY salary desc
    ) AS salary_rank
    FROM employees
)t
WHERE salary_rank <=3;

# Q8
#approach - customers LEFT JOIN with date interval filter
# it will give all customer data for last  6months
# then filter where no transactions happened in last 6 MONTHS

SELECT c.customer_id ,c.name 
FROM customers c 
LEFT JOIN transactions t
ON c.customer_id = t.customer_id
AND transaction_date >= CURRENT_DATE - INTERVAL 6 MONTHS
WHERE transaction_date IS NULL;
