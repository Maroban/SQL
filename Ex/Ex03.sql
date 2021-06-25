/* 그룹 함수와 단일행 함수 차이 */
-- 단일행 함수
SELECT
    first_name,
    round(salary, - 4)
FROM
    employees;
    
-- 그룹 함수 --> 오류 발생
SELECT
    first_name,
    AVG(salary)
FROM
    employees;
    
/* 그룹 함수 */   
-- 그룹 함수 - count()
SELECT
    COUNT(*),
    COUNT(first_name),
    COUNT(commission_pct)
FROM
    employees;
    
-- where절 사용
SELECT
    COUNT(*)
FROM
    employees
WHERE
    salary >= 16000;
    
-- 그룹 함수 - sum()
SELECT
    COUNT(*),
    SUM(salary)
FROM
    employees;
    
-- 그룹 함수 - avg() / null일 때 0으로 변환해서 사용
SELECT
    COUNT(*),  -- 총 개수
    COUNT(commission_pct * salary),  -- null값 제외한 개수
    SUM(commission_pct),  -- 전체 합계

    AVG(commission_pct),  -- null 제외한 평균 값
    SUM(commission_pct) / COUNT(commission_pct),  -- null 제외

    AVG(nvl(commission_pct, 0)),  -- null 값을 0으로 변경된 평균값
    SUM(commission_pct) / COUNT(*)  -- null 포함
FROM
    employees;

-- 그룹 함수 - max() / min()
SELECT
    MAX(salary),
    MIN(salary)
FROM
    employees;
    
/* group by절 */
SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id,
    job_id
ORDER BY
    department_id ASC;
    
-- 예제 1
SELECT
    department_id   "부서 번호",
    COUNT(*)        " 인원 수",
    SUM(salary)     "급여 합계"
FROM
    employees
GROUP BY
    department_id;
    
-- 예제 2 > where절에는 그룹 함수를 사용할 수 없다.
SELECT
    department_id   "부서 번호",
    COUNT(*)        " 인원 수",
    SUM(salary)     "급여 합계"
FROM
    employees
WHERE
    SUM(salary) >= 20000
GROUP BY
    department_id;
    
/* having 절 */
SELECT
    department_id   "부서 번호",
    COUNT(*)        " 인원 수",
    SUM(salary)     "급여 합계"
FROM
    employees
GROUP BY
    department_id
HAVING
    SUM(salary) >= 20000;

/* case ~ end문 */
SELECT
    employee_id,
    job_id,
    salary,
    CASE
        WHEN job_id = 'AC_ACCOUNT'  THEN
            salary + salary * 0.1
        WHEN job_id = 'SA_REP'      THEN
            salary + salary * 0.2
        WHEN job_id = 'ST_CLERK'    THEN
            salary + salary * 0.3
        ELSE
            salary
    END "rSalary"
FROM
    employees;
    
/* decode()문 */
SELECT
    job_id,
    salary,
    decode(job_id, 'AC_ACCOUNT', salary + salary * 0.1, 'SA_REP', salary + salary * 0.2,
           'ST_CLERK',
           salary + salary * 0.3,
           salary) "rSalay"
FROM
    employees;