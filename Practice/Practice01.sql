-- 1번 문제
SELECT
    first_name
    || ' '
    || last_name   "이름",
    salary         "월급",
    phone_number   "전화번호",
    hire_date      "입사일"
FROM
    employees
ORDER BY
    hire_date ASC;
    
-- 2번 문제
SELECT
    *
FROM
    jobs
ORDER BY
    job_title DESC,
    max_salary DESC;
    
-- 3번 문제
SELECT
    first_name,
    manager_id,
    commission_pct,
    salary
FROM
    employees
WHERE
    commission_pct IS NULL
    AND salary > 3000;
    
-- 4번 문제
SELECT
    job_title,
    max_salary
FROM
    jobs
WHERE
    max_salary >= 10000
ORDER BY
    max_salary DESC;
    
-- 5번 문제
SELECT
    first_name,
    salary,
    nvl(commission_pct, 0)
FROM
    employees
WHERE
        salary >= 10000
    AND salary < 14000
ORDER BY
    salary DESC;
    
-- 6번 문제
SELECT
    first_name,
    salary,
    to_char(hire_date, 'YYYY-MM'),
    department_id
FROM
    employees
WHERE
    department_id = 10
    OR department_id = 90
    OR department_id = 100;
    
-- 7번 문제
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name LIKE '%s%'
    OR first_name LIKE '%S%';
    
-- 8번 문제
SELECT
    department_name
FROM
    departments
ORDER BY
    length(department_name) DESC;

-- 9번 문제
SELECT
    upper(country_id)
FROM
    countries
WHERE
    region_id IS NOT NULL
ORDER BY
    country_id ASC;
    
-- 10번 문제
SELECT
    first_name,
    salary,
    replace(phone_number, '.', '-'),
    hire_date
FROM
    employees
WHERE hire_date <= '03/12/31';