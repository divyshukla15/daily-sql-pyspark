# Q1 inner join
#compare manager_id from emp table to emp_id from manager table

SELECT * 
FROM employees e , employees m
WHERE e.manager_id = m.emp_id 
AND e.salary > m.salary ;

# better to write INNER JOIN explicitely

SELECT * 
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

# Q2
# approach 
# find columns that make it duplicate
# group them, find more than 1 occurence
# compare output with present table

SELECT e.*
FROM employees e
JOIN (
    SELECT name, department_id, salary
    FROM employees
    GROUP BY name, department_id, salary
    HAVING COUNT(*)>1
) d
ON e.name = d.name
AND e.department_id = d.department_id
AND e.salary = d.salary ;

