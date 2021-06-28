-- 예제
SELECT
    e.department_id,
    e.first_name,
    d.department_name,
    e.job_id
FROM
    employees    e,
    departments  d,
    jobs         j
WHERE
        e.department_id = d.department_id
    AND e.job_id = j.job_id;
    
-- left outer join
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    d.department_name
FROM
    employees    e
    LEFT OUTER JOIN departments  d ON e.department_id = d.department_id;
    
-- (+)
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    d.department_name
FROM
    employees    e,
    departments  d
WHERE
    e.department_id = d.department_id (+);

-- right outer join
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    d.department_name
FROM
    employees    e
    RIGHT OUTER JOIN departments  d ON e.department_id = d.department_id;
    
-- (+)
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    d.department_name
FROM
    employees    e,
    departments  d
WHERE
    e.department_id (+) = d.department_id;
    
-- full outer join
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    d.department_name
FROM
    employees    e
    FULL OUTER JOIN departments  d ON e.department_id = d.department_id;

-- self join
SELECT
    e.employee_id,
    e.first_name,
    man.manager_id,
    man.first_name as manager 
FROM
    employees  e,
    employees  man
WHERE
    e.manager_id = man.employee_id;