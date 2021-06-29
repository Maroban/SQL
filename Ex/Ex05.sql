-- 단일행 subquery
/* ‘Den’ 보다 급여를 많은 사람의 이름과 급여는? */

/* 단일행 subquery 배우기 전 */
-- 1. 'Den' 의 급여의 값을 구한다.
SELECT
    salary
FROM
    employees
WHERE
    first_name = 'Den';
    
-- 2. 11000보다 많은 사람의 이름과 급여를 구한다.
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary > 11000;
    
/* subquery 배운 후 */
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT
            salary
        FROM
            employees
        WHERE
            first_name = 'Den'
    );

/* 예제 1 */
SELECT
    first_name,
    salary,
    employee_id
FROM
    employees
WHERE
    salary = (
        SELECT
            MIN(salary)
        FROM
            employees
    );
    
/* 예제 2 */
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
    );
 
-- 다중행 subquery 
/* 부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여는? */

/* 다중행 subquery 배우기 전 */
-- 1. 부서번호 110인 직원을 구한다.
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    department_id = 110;
    
-- 2. in 연산자를 이용해 '8300, 12008'와 같은 급여의 직원을 구한다.
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary IN ( '8300', '12008' );
    
/* 다중행 subquery 배운 후 */
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary IN (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 110
    );
    
/* 예제 */
/* 각 부서별로 최고급여를 받는 사원을 출력하세요. */

-- 1. 그룹별 최대 급여를 구한다.
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id;
    
-- 2. 부서별로 급여가 같은 직원의 정보를 구한다.
SELECT
    department_id,
    first_name,
    salary
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
    );
    
/* any 예제 */
/* 부서번호가 110인 직원의 급여보다 큰 모든 직원의 사번, 이름, 급여는?*/  

-- 1. 부서 번호가 110인 직원을 구한다.
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    department_id = 110;
    
-- 2. 부서 번호가 110인 직원의 급여보다 더 많이 받는 직원을 구한다.
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > 12008
    OR salary > 8300;
    
/* any 사용 */
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > ANY (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 110
    );
    
/* all 예제 */
/* 부서번호가 110인 직원의 급여보다 큰 모든 직원의 사번, 이름, 급여는?*/  

-- 1. 부서 번호가 110인 직원을 구한다.
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    department_id = 110;
    
-- 2. 부서 번호가 110인 직원의 급여보다 더 많이 받는 직원을 구한다.
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
        salary > 12008
    AND salary > 8300;
    
/* all 사용 */
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > ALL (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 110
    );
    
/* 예제 */
/* 각 부서별로 최고급여를 받는 사원을 출력하세요.*/ 

-- 1. 그룹별 최대 급여를 구한다.(in 연산자 사용)
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id;

-- 2. 부서별로 급여가 같은 직원의 정보를 구한다.(in 연산자 사용)
SELECT
    department_id,
    employee_id,
    first_name,
    salary
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
    );
    
-- 1. 그룹별 최대 급여를 구한다. ==> 테이블 s (join 사용)
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id;

-- 2. 부서별로 급여가 같은 직원의 정보를 구한다.(join 사용)
    -- e.부서 아이디 = s. 부서 아이디  /  e.급여 = s.급여(최대급여)
SELECT
    e.employee_id,
    e.department_id,
    e.first_name,
    e.salary
FROM
    employees  e,
    (
        SELECT
            department_id,
            MAX(salary) msalary  -- Max(salary)를 별칭 'mSalary'로 정해준다.
        FROM
            employees
        GROUP BY
            department_id
    )          s
WHERE
        e.department_id = s.department_id
    AND e.salary = s.msalary;
    
/**** rownum ****/
/* 예제 */ 
/* 급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오. */
-- rownum을 먼저 읽고 정렬하기 때문에 뒤죽박죽 섞인다.
SELECT
    ROWNUM,
    first_name,
    salary
FROM
    employees
ORDER BY
    salary DESC;
    
-- 정렬 하고 rownum 읽기(항상 1번이기에 가운데 숫자를 못 구한다.)
SELECT
    ROWNUM,
    ot.first_name,
    ot.salary
FROM
    (
        SELECT
            first_name,
            salary
        FROM
            employees
        ORDER BY
            salary DESC
    ) ot
WHERE
        ROWNUM >= 1
    AND ROWNUM <= 5;
    
-- 정렬 하고 rownum 읽기(해결책)

-- 1. 정렬한다.
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
ORDER BY
    salary DESC;
    
-- 2. 정렬한 것을 테이블로 묶는다.
SELECT
    ROWNUM,
    ot.employee_id,
    ot.first_name,
    ot.salary
FROM
    (
        SELECT
            employee_id,
            first_name,
            salary
        FROM
            employees
        ORDER BY
            salary DESC
    ) ot;
    
-- 정렬을 묶어 rownum을 사용했고, 다시 한 번더 묶는다.
SELECT
    rn, -- rownum을 넣으면 lownum을 새로 매긴다.
    ort.employee_id,
    ort.first_name,
    ort.salary
FROM
    (
        SELECT
            ROWNUM rn, -- 이 rownum을 사용해야 하기 때문에 별칭을 정해줘야 한다.
            ot.employee_id,
            ot.first_name,
            ot.salary
        FROM
            (
                SELECT
                    employee_id,
                    first_name,
                    salary
                FROM
                    employees
                ORDER BY
                    salary DESC
            ) ot
    ) ort
WHERE
        rn >= 3
    AND rn <= 6;
    
-- 예제
SELECT
    rn,
    ort.first_name,
    ort.salary,
    ort.hire_date
FROM
    (
        SELECT
            ROWNUM rn,
            ot.first_name,
            ot.salary,
            ot.hire_date
        FROM
            (
                SELECT
                    first_name,
                    salary,
                    hire_date
                FROM
                    employees
                WHERE
                        hire_date >= '07/01/01'
                    AND hire_date <= '07/12/31'
                ORDER BY
                    salary DESC
            ) ot
    ) ort
WHERE
        rn >= 3
    AND rn <= 7;