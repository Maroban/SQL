-- 문제 1
SELECT
    COUNT(manager_id) "haveMngCnt"
FROM
    employees;
    
-- 문제 2
SELECT
    MAX(salary)                      "최고임금",
    MIN(salary)                      "최저임금",
    MAX(salary) - MIN(salary)        "최고임금 - 최저임금"
FROM
    employees;
    
-- 문제 3
SELECT
    MAX(to_char(hire_date, 'yyyy"년" mm"월" dd"일"'))
FROM
    employees;

-- 문제 4
SELECT
    department_id                 "부서아이디",
    round(AVG(salary), 0)         "평균임금",
    MAX(salary)                   "최고임금",
    MIN(salary)                   "최저임금"
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id DESC;
    
-- 문제 5
SELECT
    job_id,
    AVG(salary),
    MAX(salary),
    MIN(salary)
FROM
    employees
GROUP BY
    job_id
ORDER BY
    MIN(salary) DESC,
    AVG(salary) ASC;
    
-- 문제 6
SELECT
    to_char(MIN(hire_date), 'yyyy-mm-dd day')
FROM
    employees;

-- 문제 7
SELECT
    department_id                                  "부서아이디",
    round(AVG(salary), 0)                          "평균임금",
    MIN(salary)                                    "최저임금",
    round(AVG(salary), 0) - MIN(salary)            "평균임금 - 최저임금"
FROM
    employees
GROUP BY
    department_id
HAVING
    round(AVG(salary), 0) - MIN(salary) < 2000
ORDER BY
    round(AVG(salary), 0) - MIN(salary) DESC;
    
-- 문제 8
SELECT
    job_id,
    MAX(salary) - MIN(salary)
FROM
    employees
GROUP BY
    job_id
ORDER BY
    MAX(salary) - MIN(salary) DESC;
    
-- 문제 9
SELECT
    manager_id,
    round(AVG(salary), 1),
    MIN(salary),
    MAX(salary)
FROM
    employees
GROUP BY
    manager_id
HAVING
    AVG(salary) >= 5000
ORDER BY
    AVG(salary) DESC;
    
-- 문제 10
SELECT
    hire_date,
    CASE
        WHEN hire_date < '03/01/01'  THEN
            '창립멤버'
        WHEN hire_date > '03/01/01'
             AND hire_date < '03/12/31' THEN
            '03년 입사'
        WHEN hire_date > '04/01/01'
             AND hire_date < '04/12/31' THEN
            '04년 입사'
        WHEN hire_date > '04/12/31'  THEN
            '상장이후입사'
    END "optDate"
FROM
    employees
ORDER BY
    hire_date ASC;