SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    departments;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;

-- 예제
SELECT
    first_name,
    phone_number,
    hire_date,
    salary
FROM
    employees;

SELECT
    first_name,
    last_name,
    salary,
    phone_number,
    email,
    hire_date
FROM
    employees;

-- 출력할 때 컬럼에 별명 사용하기. 
SELECT
    employee_id  empno,
    first_name   "f-name",
    salary       "급 여"
FROM
    employees;
    
-- 예제
SELECT
    first_name    "이 름",
    phone_number  "전화번호",
    hire_date     "입사일",
    salary        "급 여"
FROM
    employees;

SELECT
    employee_id   "사원번호",
    first_name    "이 름",
    last_name     "성",
    salary        "급 여",
    phone_number  "전화번호",
    email         "이메일",
    hire_date     "입사일"
FROM
    employees;
    
-- 연결 연산자로 컬럼들 붙이기
SELECT
    first_name
    || ' hire date is '
    || hire_date "입사일"
FROM
    employees;
    
-- 산술 연산자 사용
SELECT
    first_name   "이름",
    salary       "월급",
    salary * 12  "연봉"
FROM
    employees;

SELECT
    first_name             "이름",
    salary                 "월급",
    salary * 12            "연봉",
    ( salary + 300 ) * 12  "보너스 연봉"
FROM
    employees;
    
-- 예제
SELECT
    job_id * 12  -- 글자형태라 안된다.
FROM
    employees;

-- 예제
SELECT
    first_name
    || '_'
    || last_name            "성명",
    salary                  "급여",
    salary * 12             "연봉",
    ( salary + 5000 ) * 12  "연봉2",
    phone_number            "전화번호"
FROM
    employees;
    
-- where절 비교연산자
SELECT
    first_name
FROM
    employees
WHERE
    department_id = 10;
    
-- 예제
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary >= 15000;

SELECT
    first_name,
    hire_date
FROM
    employees
WHERE
    hire_date >= '07/01/01';

SELECT
    first_name
    || ' '
    || last_name   "성명",
    salary         "연봉"
FROM
    employees
WHERE
    first_name = 'Lex';

SELECT
    first_name,
    salary
FROM
    employees
WHERE
        salary >= 14000
    AND salary <= 17000;

SELECT
    first_name,
    hire_date
FROM
    employees
WHERE
        hire_date >= '04/01/01'
    AND hire_date <= '05/12/31';

-- between 연산자
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 14000 AND 17000;
    
-- in 연산자
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    first_name IN ( 'Neena', 'Lex', 'John' );
    
-- 예제
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary IN ( 2100, 3100, 4100, 5100 );
    
-- like 연산자
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    first_name LIKE 'L%';
    
-- 예제
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name LIKE '%am%';

SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name LIKE '_a%';

SELECT
    first_name
FROM
    employees
WHERE
    first_name LIKE '____a%';

SELECT
    first_name
FROM
    employees
WHERE
    first_name LIKE '_a__';