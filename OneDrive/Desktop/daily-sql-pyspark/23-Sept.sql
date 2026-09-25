# Q10 
# Approach - similar as top 3 highest_salary_dept_wise 
# Need to use DENSE_RANK() if we want unique second value
SELECT employee, Department_id, salary
FROM (
    SELECT employees, Department_id,salary,
    ROW_NUMBER()   OVER (
    PARTITION BY Department_id
    ORDER BY salary desc
    ) AS salary_rank
    FROM employees
)t
WHERE salary_rank =2;


# Q11
# here quantity is given to calculate total price pr product_id

SELECT product_id, SUM(quantity*price) AS total_sales
FROM sales 
GROUP BY product_id
ORDER BY total_sales desc
LIMIT 3;