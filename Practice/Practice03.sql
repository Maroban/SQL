-- 문제 1
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM
    employees    e,
    departments  d
WHERE
    e.department_id = d.department_id
ORDER BY
    d.department_name ASC,
    e.employee_id DESC;
    
-- 문제 2
SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name,
    j.job_title
FROM
    employees    e,
    departments  d,
    jobs         j
WHERE
        e.department_id = d.department_id
    AND e.job_id = j.job_id
ORDER BY
    e.employee_id ASC;
    
-- 문제 2-1
SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name,
    j.job_title
FROM
    employees    e,
    departments  d,
    jobs         j
WHERE
        e.department_id = d.department_id (+)
    AND e.job_id = j.job_id
ORDER BY
    e.employee_id ASC;

-- 문제 3
SELECT
    d.location_id,
    l.city,
    d.department_name,
    d.department_id
FROM
    departments  d,
    locations    l
WHERE
    d.location_id = l.location_id
ORDER BY
    l.location_id ASC;

-- 문제 3-1
SELECT
    d.location_id,
    l.city,
    d.department_name,
    d.department_id
FROM
    departments  d,
    locations    l
WHERE
    d.location_id (+) = l.location_id
ORDER BY
    l.location_id ASC;

-- 문제 4
SELECT
    r.region_name,
    c.country_name
FROM
    regions    r,
    countries  c
WHERE
    c.region_id = r.region_id
ORDER BY
    c.country_name ASC,
    r.region_name DESC;
    
-- 문제 5
SELECT
    em.employee_id,
    em.first_name,
    em.hire_date,
    ma.first_name,
    ma.hire_date
FROM
    employees  em,
    employees  ma
WHERE
        em.manager_id = ma.employee_id
    AND ma.hire_date > em.hire_date;

-- 문제 6
SELECT
    c.country_name,
    c.country_id,
    l.city,
    l.location_id,
    d.department_id,
    d.department_name
FROM
    departments  d,
    locations    l,
    countries    c
WHERE
        d.location_id = l.location_id
    AND l.country_id = c.country_id
ORDER BY
    c.country_name ASC;

-- 문제 7
SELECT
    e.employee_id,
    e.first_name
    || ' '
    || e.last_name,
    j.job_id,
    jh.start_date,
    jh.end_date
FROM
    employees    e,
    job_history  jh,
    jobs         j
WHERE
        e.employee_id = jh.employee_id
    AND jh.job_id = j.job_id
    AND jh.job_id = 'AC_ACCOUNT';

-- 문제 8
SELECT
    e.department_id,
    d.department_name,
    e.first_name,
    l.city,
    c.country_name,
    r.region_name
FROM
    employees    e,
    departments  d,
    locations    l,
    countries    c,
    regions      r
WHERE
      e.employee_id = d.manager_id  
    AND e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND l.country_id = c.country_id
    AND c.region_id = r.region_id;

-- 문제 9
SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    ma.first_name
FROM
    employees    e,
    employees    ma,
    departments  d
WHERE
        e.manager_id = ma.employee_id
    AND e.department_id = d.department_id (+);
