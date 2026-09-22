# Q1
Select DISCTINCT (salary) as third_highest_salary
FROM employees
ORDER BY salary desc
OFFSET 2
LIMIT 1;

# Q2 
# Approach -without window- Group by
Select Department_id, MAX(salary) as highest_salary_dept_wise
FROM employees
GROUP BY Department_id;

# Approach - with window,
# Partion on Department_id, order by salary , give rank, print only whose rank is 1

Select Department_id, salary 
FROM (
    Select Department_id, salary,
    RANK() OVER (
        PARTITION BY Department_id
        ORDER BY salary DESC
                ) 
    AS salary_rank
    FROM employees
) t 
WHERE salary_rank = 1;

#Q3 
#Approach - get customer >5000 transation
# then filter cutomer who have more than 1 transaction

Select customer_id 
FROM transactions
    WHERE amount > 5000
    GROUP BY customer_id
    HAVING COUNT(*) > 1;


