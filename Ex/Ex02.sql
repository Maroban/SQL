-- null
SELECT
    first_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NULL;

-- 예제 1
SELECT
    first_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

-- 예제 2
SELECT
    first_name
FROM
    employees
WHERE
    manager_id IS NULL
    AND commission_pct IS NULL;

-- order by절을 사용해 정렬
SELECT
    first_name,
    salary
FROM
    employees
ORDER BY
    salary DESC;

-- 예제 1
SELECT
    department_id,
    salary,
    first_name
FROM
    employees
ORDER BY
    department_id ASC;

-- 예제 2
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary > 10000
ORDER BY
    salary DESC;

-- 예제 3 
SELECT
    department_id,
    salary,
    first_name
FROM
    employees
ORDER BY
    department_id ASC,
    salary DESC;


/* 문자함수*/    
-- 문자함수(initcap()): 첫 글자를 대문자 변경하는 함수
SELECT
    email,
    initcap(email),
    department_id
FROM
    employees
WHERE
    department_id = 100;
    
-- 문자함수(Lower(), Upper()): 소문자/대문자로 변경하는 함수
SELECT
    first_name,
    lower(first_name),
    upper(first_name)
FROM
    employees
WHERE
    department_id = 100;
    
-- 문자함수(substr(컬럼명, 시작 위치, 글자수)): 특정길이의 문자열을 구하는 함수
SELECT
    substr('abcdefg', 3, 2)
FROM
    dual;

SELECT
    first_name,
    substr(first_name, 1, 3),
    substr(first_name, - 3, 2)
FROM
    employees
WHERE
    department_id = 100;
    
-- 문자함수(L,RPAD(컬럼명, 자리수, ‘채울문자’)): 공백에 특별한 문자로 채우는 함수
SELECT
    first_name,
    lpad(first_name, 10, '*'),
    rpad(first_name, 10, '_')
FROM
    employees;
    
-- 문자함수(REPLACE (컬럼명, 문자1, 문자2)): 컬럼명에서 문자1을 문자2로 바꾸는 함수
SELECT
    first_name,
    replace(first_name, 'a', '*')
FROM
    employees;

-- 아이디 모자이크 하기(replace, substr 활용)
SELECT
    first_name,
    replace(first_name, substr(first_name, 2, 3), '***')
FROM
    employees;
    
/* 숫자함수 */
-- 숫자함수(ROUND(숫자, 출력을 원하는 자리수)): 주어진 숫자의 반올림을 하는 함수
SELECT
    round(123.456, 2)          "r2",
    round(123.456, 0)          "r0",
    round(123.456, - 1)        "r-1"
FROM
    dual;
    
-- 숫자함수(TRUNC(숫자, 출력을 원하는 자리수)): 주어진 숫자의 버림을 하는 함수
SELECT
    trunc(123.456, 2),
    trunc(123.456, 0),
    trunc(123.456, - 1)
FROM
    dual;
    
/* 날짜함수 */
-- 날짜함수(sysdate()): 현재 날짜와 시간을 출력해주는 함수
SELECT
    sysdate
FROM
    dual;
    
-- 날짜함수(months_between(d1, d2)): d1날짜와 d2날짜의 개월수를 출력하는 함수
SELECT
    sysdate                                 "오늘 날짜",
    hire_date                               "입사일",
    months_between(sysdate, hire_date)      "오늘 날짜 - 입사일"
FROM
    employees;
    
-- 날짜함수(months_between(d1, d2), round 활용)
SELECT
    sysdate                                               "오늘 날짜",
    hire_date                                             "입사일",
    round(months_between(sysdate, hire_date), 0)          "오늘 날짜 - 입사일"
FROM
    employees;
    
/* 변환함수 */
-- 변환함수(to_char(숫자, '출력모양')): 숫자형  문자형으로 변환하는 함수
SELECT
    first_name,
    salary * 12,
    to_char(salary * 12, '$999,999.99')
FROM
    employees
WHERE
    department_id = 110;

-- 변환함수(to_char(날짜, ‘출력모양’)): 날짜  문자형으로 변환하는 함수
SELECT
    sysdate,
    to_char(sysdate, 'yyyy.mm.dd'),
    to_char(sysdate, 'yyyy'),
    to_char(sysdate, 'yy'),
    to_char(sysdate, 'MM'),
    to_char(sysdate, 'month'),
    to_char(sysdate, 'dd'),
    to_char(sysdate, 'day'),
    to_char(sysdate, 'hh'),
    to_char(sysdate, 'hh24'),
    to_char(sysdate, 'MI'),
    to_char(sysdate, 'ss')
FROM
    dual;
    
-- 변환함수(nvl(), nvl2())
SELECT
    first_name,
    commission_pct,
    nvl(commission_pct, 0),
    nvl2(commission_pct, 100, 0)
FROM
    employees;
