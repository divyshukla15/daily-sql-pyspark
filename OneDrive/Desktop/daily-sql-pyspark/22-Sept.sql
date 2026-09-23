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