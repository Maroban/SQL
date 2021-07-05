-- 문제 1
SELECT
    COUNT(*)
FROM
    employees
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
    );
    
-- 문제 2
SELECT
    employee_id,
    first_name,
    salary,
    avgs,
    maxs
FROM
    employees,
    (
        SELECT
            round(AVG(salary), 0)         avgs,
            MAX(salary)                   maxs
        FROM
            employees
    )
WHERE
        salary >= (
            SELECT
                AVG(salary)
            FROM
                employees
        )
    AND salary <= (
        SELECT
            MAX(salary)
        FROM
            employees
    )
ORDER BY
    salary ASC;
    
-- 문제 3
SELECT
    ed.location_id,
    l.street_address,
    l.postal_code,
    l.city,
    l.state_province,
    l.country_id
FROM
    locations  l,
    (
        SELECT
            e.first_name,
            d.department_id,
            d.location_id
        FROM
            employees    e,
            departments  d
        WHERE
                e.department_id = d.department_id
            AND e.first_name = 'Steven'
            AND e.last_name = 'King'
    )          ed
WHERE
    l.location_id = ed.location_id;
    
-- 문제 4 
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary < ANY (
        SELECT
            salary
        FROM
            employees
        WHERE
            job_id = 'ST_MAN'
    )
ORDER BY
    salary DESC;
    
-- 문제 5

/* 조건절 비교 */
SELECT
    employee_id,
    first_name,
    salary,
    department_id
FROM
    employees
WHERE
    ( department_id, salary ) IN (
        SELECT
            department_id, MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
    )
ORDER BY
    salary DESC;
    
/* 테이블 조인 */
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id;

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    e.department_id
FROM
    employees  e,
    (
        SELECT
            department_id,
            MAX(salary) m
        FROM
            employees
        GROUP BY
            department_id
    )          s
WHERE
        e.department_id = s.department_id
    AND e.salary = s.m
ORDER BY
    e.salary DESC;