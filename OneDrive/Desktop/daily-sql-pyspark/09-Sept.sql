# 1st approach

SELECT DISTINCT(salary) As second_highest_salary
FROM employee
ORDER BY salary desc
LIMIT 1
OFFSET 1;

# 2nd approach

SELECT MAX(salary) As second_highest_salary
FROM employee
where salary < (select 
    MAX(salary) 
    from employees);


