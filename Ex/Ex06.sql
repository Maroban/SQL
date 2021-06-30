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
    
    
/*** 실습 ***/

/* 테이블 삭제 */
DROP TABLE book;

DROP TABLE author;

/* 스퀀시 삭제 */
DROP SEQUENCE seq_book_id;

DROP SEQUENCE seq_author_id;

/* 시퀀시 생성 */
CREATE SEQUENCE seq_author_id INCREMENT BY 1 START WITH 1 NOCACHE;

/* author 테이블 생성 */
CREATE TABLE author (
    author_id    NUMBER(10),
    author_name  VARCHAR2(100),
    author_desc  VARCHAR2(100),
    PRIMARY KEY ( author_id )
);

/* author 값 입력 */
INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '김문열',
    '경북 영양'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '박경리',
    '경상남도 통영'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '유시민',
    '17대 국회의원'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '기안84',
    '기안동에서 산 84년생'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '강풀',
    '온라인 만화가 1세대'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '김영하',
    '알쓸신잡'
);

/* 시퀀시 생성 */
CREATE SEQUENCE seq_book_id INCREMENT BY 1 START WITH 1 NOCACHE;

/* book 테이블 생성 */
CREATE TABLE book (
    book_id    NUMBER(10),
    title      VARCHAR2(100),
    pubs       VARCHAR2(100),
    pub_date   DATE,
    author_id  NUMBER(10),
    PRIMARY KEY ( book_id ),
    CONSTRAINT book_fk FOREIGN KEY ( author_id )
        REFERENCES author ( author_id )
);

/* book 값 입력 */
INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '우리들의 일그러진 영웅',
    '다림',
    1998 - 02 - 22,
    1
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '삼국지',
    '민음사',
    '2002-03-01',
    1
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '토지',
    '마로니에북스',
    '2012-08-15',
    2
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '유시민의 글쓰기 특강',
    '생각의 길',
    '2015-04-01',
    3
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '패션왕',
    '중앙북스(books)',
    '2012-02-22',
    4
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '순정만화',
    '재미주의',
    '2011-08-03',
    5
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '오직 두 사람',
    '문학동네',
    '2017-05-04',
    6
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '26년',
    '재미주의',
    '2012-02-04',
    5
);

/* 테이블 join */
SELECT
    b.book_id,
    b.title,
    b.pubs,
    b.pub_date,
    b.author_id,
    a.author_name,
    a.author_desc
FROM
    book    b,
    author  a
WHERE
    b.author_id = a.author_id;
    
/* 강풀 값 변경 */
UPDATE author
SET
    author_desc = '서울특별시'
WHERE
    author_id = 5;
    
/* 기안84 값 삭제 */
DELETE FROM author
WHERE
    author_id = 4;  -- book에서 기안84 값을 사용하고 있기 때문에 안 된다.