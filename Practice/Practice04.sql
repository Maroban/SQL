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

-- 문제 6
SELECT
    job_title,
    se.ss
FROM
    jobs  j,
    (
        SELECT
            SUM(salary) ss,
            job_id
        FROM
            employees
        GROUP BY
            job_id
    )     se
WHERE
    se.job_id = j.job_id
ORDER BY
    se.ss DESC;

-- 문제 7
SELECT
    e.employee_id,
    e.first_name,
    e.salary
FROM
    employees  e,
    (
        SELECT
            department_id,
            round(AVG(salary), 0) ras
        FROM
            employees
        GROUP BY
            department_id
    )          aa
WHERE
        aa.department_id = e.department_id
    AND e.salary > aa.ras;

-- 문제 8
SELECT
    rm,
    rso.employee_id,
    rso.first_name,
    rso.salary,
    rso.hire_date
FROM
    (
        SELECT
            ROWNUM rm,
            so.employee_id,
            so.first_name,
            so.salary,
            so.hire_date
        FROM
            (
                SELECT
                    employee_id,
                    first_name,
                    salary,
                    hire_date
                FROM
                    employees
                ORDER BY
                    hire_date ASC
            ) so
    ) rso
WHERE
        rm < 16
    AND rm > 10;