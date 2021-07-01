/* 테이블 book 만들기 */
CREATE TABLE book (
    book_id   NUMBER(5),
    title     VARCHAR2(50),
    author    VARCHAR2(10),
    pub_date  DATE
);
/* 테이블 컬럼 */
-- 테이블 컬럼 추가
ALTER TABLE book ADD (
    pubs VARCHAR2(50)
);

-- 테이블 컬럼 타입 수정
ALTER TABLE book MODIFY (
    title VARCHAR2(100)
);

-- 테이블 컬럼 이름 수정
ALTER TABLE book RENAME COLUMN subproject TO subject;

-- 테이블 컬럼 삭제
ALTER TABLE book DROP ( author );

/* 테이블 */
-- 테이블 이름 수정
RENAME book TO article;

-- 테이블 삭제
DROP TABLE article;

/* 테이블 author 만들기 */
CREATE TABLE author (
    author_id    NUMBER(10),
    author_name  VARCHAR2(100) NOT NULL,
    author_desc  VARCHAR2(500),
    PRIMARY KEY ( author_id )
);

/* 테이블 book 만들고 author의 PK와 book의 FK 연결하기 */
CREATE TABLE book (
    book_id    NUMBER(10),
    title      VARCHAR2(100) NOT NULL,
    pubs       VARCHAR2(100),
    pub_date   DATE,
    author_id  NUMBER(10),
    PRIMARY KEY ( book_id ),
    CONSTRAINT book_fk FOREIGN KEY ( author_id )
        REFERENCES author ( author_id )
);

/* author 테이블에 값 넣기(묵시적) */ -- 한번 더 실행시키면 오류가 생긴다.
INSERT INTO author VALUES (  -- 오류가 생긴 이유는 pk값이 중복되었기 때문
    1,
    '박경리',
    '토지 작가'
);

/* author 테이블에 값 넣기(명시적) */ -- 3개의 값 넣기, 자료형 바꿔서 넣기, not null 실험해볼 것
INSERT INTO author (
    author_id,
    author_name
) VALUES (
    2,
    '이문열'
); 

/* author 테이블 값 수정 */
UPDATE author
SET
    author_name = '기안84',
    author_desc = '웹툰작가'
WHERE
    author_id = 1;

UPDATE author
SET
    author_name = '강풀',
    author_desc = '인기작가'
WHERE
    author_id = 2;
 
 /* author 테이블 값 삭제 */
DELETE FROM author
WHERE
    author_id = 2;
    
-- 전체 삭제
DELETE FROM author;
    
/* 시퀀스 생성 */
CREATE SEQUENCE seq_author_id INCREMENT BY 1 START WITH 1 NOCACHE;

/* 시퀀스 사용 */
INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '이문열',
    '작가'
);

/* 시퀀스 전체 조회 */
SELECT
    *
FROM
    user_sequences;

/* 현재 시퀀스 조회 */
SELECT
    seq_author_id.CURRVAL
FROM
    dual;
    
/* 다음 시퀀스 조회 */
SELECT
    seq_author_id.NEXTVAL
FROM
    dual;

/* 시퀀스 삭제 */
DROP SEQUENCE seq_author_id;

/* author 테이블 조회 */
SELECT
    *
FROM
    author;