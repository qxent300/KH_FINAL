----- FINAL 계정 생성 -----
-- CREATE USER FINAL IDENTIFIED BY FINAL;
-- GRANT RESOURCE, CONNECT TO FINAL;
-----  FINAL 계정 삭제 -----
-- DROP USER FINAL CASCADE;

----------------------------------------------------
----------------- MEMBER 테이블 ----------------
----------------------------------------------------
DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER (
    U_NO NUMBER PRIMARY KEY,
    U_ID VARCHAR2(100) NOT NULL UNIQUE,
    U_PWD VARCHAR2(100) ,
    U_NAME VARCHAR2(20) NOT NULL,
    U_NICKNAME VARCHAR2(30) NOT NULL UNIQUE,
    U_ADDRESS VARCHAR2(100),
    U_PHONE VARCHAR2(13),
    U_GRADE NUMBER NOT NULL,
    U_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(U_STATUS IN('Y', 'N')),
    U_ENROLL_DATE DATE DEFAULT SYSDATE,
    U_MODIFY_DATE DATE DEFAULT SYSDATE
);


DROP SEQUENCE SEQ_U_NO;
CREATE SEQUENCE SEQ_U_NO;

COMMENT ON COLUMN MEMBER.U_NO IS '사용자 번호';
COMMENT ON COLUMN MEMBER.U_ID IS '사용자 아이디';
COMMENT ON COLUMN MEMBER.U_PWD IS '사용자 비밀번호';
COMMENT ON COLUMN MEMBER.U_NAME IS '사용자 이름';
COMMENT ON COLUMN MEMBER.U_NICKNAME IS '사용자 닉네임';
COMMENT ON COLUMN MEMBER.U_ADDRESS IS '사용자 주소';
COMMENT ON COLUMN MEMBER.U_PHONE IS '사용자 연락처';
COMMENT ON COLUMN MEMBER.U_GRADE IS '사용자 등급';
COMMENT ON COLUMN MEMBER.U_STATUS IS '사용자 상태(Y/N)';
COMMENT ON COLUMN MEMBER.U_ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.U_MODIFY_DATE IS '정보수정일';

INSERT INTO MEMBER (
    U_NO, 
    U_ID, 
    U_PWD, 
    U_NAME, 
    U_NICKNAME,
    U_ADDRESS, 
    U_PHONE, 
    U_GRADE,
    U_STATUS,
    U_ENROLL_DATE, 
    U_MODIFY_DATE
) VALUES(
    SEQ_U_NO.NEXTVAL, 
    'admin', 
    '1234', 
    '관리자', 
    '나의닉네임은', 
    '서울시 강남구 역삼동',
    '010-1234-5678', 
    '99', 
    DEFAULT,
    DEFAULT,
    DEFAULT
);

COMMIT;
SELECT * FROM MEMBER;
----------------------------------------------------
------------------ BOOK 테이블 ------------------
----------------------------------------------------
DROP TABLE BOOK CASCADE CONSTRAINTS;
CREATE TABLE BOOK (
    B_NO NUMBER PRIMARY KEY,
    B_NAME VARCHAR2(200) NOT NULL,
    B_WRITER VARCHAR2(60) NOT NULL,
    B_IMAGE VARCHAR2(200) NOT NULL,
    B_CONTENT CLOB NOT NULL,
    B_CATEGORY VARCHAR2(40) NOT NULL,
    PUBLISH_DATE DATE NOT NULL,
    B_RENTCOUNT NUMBER DEFAULT 0,
    B_AVGSCORE NUMBER DEFAULT 0
);

DROP SEQUENCE SEQ_B_NO;
CREATE SEQUENCE SEQ_B_NO;

COMMENT ON COLUMN BOOK.B_NO IS '책 번호';
COMMENT ON COLUMN BOOK.B_NAME IS '책 이름';
COMMENT ON COLUMN BOOK.B_WRITER IS '책 저자';
COMMENT ON COLUMN BOOK.B_IMAGE IS '책 사진';
COMMENT ON COLUMN BOOK.B_CONTENT IS '책 소개';
COMMENT ON COLUMN BOOK.B_CATEGORY IS '책 분야';
COMMENT ON COLUMN BOOK.PUBLISH_DATE IS '출간일';
COMMENT ON COLUMN BOOK.B_RENTCOUNT IS '대여 횟수';
COMMENT ON COLUMN BOOK.B_AVGSCORE IS '평점';

SELECT * FROM BOOK;
------------------------------------------------
--------------- SCORE 테이블 ---------------
------------------------------------------------
DROP TABLE SCORE CASCADE CONSTRAINTS;
CREATE TABLE SCORE (
    S_NO NUMBER PRIMARY KEY,
    B_NO NUMBER NOT NULL,
    U_NO NUMBER NOT NULL,
    S_CONTENT VARCHAR2(400) NOT NULL,
    CREATE_DATE DATE NOT NULL,
    SCORE NUMBER NOT NULL,
    FOREIGN KEY (B_NO) REFERENCES BOOK,
    FOREIGN KEY (U_NO) REFERENCES MEMBER
);

DROP SEQUENCE SEQ_S_NO;
CREATE SEQUENCE SEQ_S_NO;

COMMENT ON COLUMN SCORE.S_NO IS '한줄평 번호';
COMMENT ON COLUMN SCORE.B_NO IS '책 번호';
COMMENT ON COLUMN SCORE.U_NO IS '사용자 번호';
COMMENT ON COLUMN SCORE.S_CONTENT IS '한줄평';
COMMENT ON COLUMN SCORE.CREATE_DATE IS '작성일';
COMMENT ON COLUMN SCORE.SCORE IS '평점';

SELECT * FROM SCORE;
----------------------------------------------
--------------- RENT 테이블 ---------------
----------------------------------------------
DROP TABLE RENT CASCADE CONSTRAINTS;
CREATE TABLE RENT (
    R_NO NUMBER PRIMARY KEY,
    B_NO NUMBER NOT NULL,
    U_NO NUMBER NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE NOT NULL,
    R_STATUS VARCHAR2(10) NOT NULL,
    FOREIGN KEY (B_NO) REFERENCES BOOK,
    FOREIGN KEY (U_NO) REFERENCES MEMBER
);

DROP SEQUENCE SEQ_RENT_NO;
CREATE SEQUENCE SEQ_RENT_NO;

COMMENT ON COLUMN RENT.R_NO IS '대여현황 번호';
COMMENT ON COLUMN RENT.B_NO IS '책 번호';
COMMENT ON COLUMN RENT.U_NO IS '사용자 번호';
COMMENT ON COLUMN RENT.START_DATE IS '대여날짜';
COMMENT ON COLUMN RENT.END_DATE IS '반납날짜';
COMMENT ON COLUMN RENT.R_STATUS IS '반납상태';

SELECT * FROM RENT;
----------------------------------------------
--------------- CART 테이블 ---------------
----------------------------------------------
DROP TABLE CART CASCADE CONSTRAINTS;
CREATE TABLE CART (
    C_NO NUMBER PRIMARY KEY,
    B_NO NUMBER NOT NULL,
    U_NO NUMBER NOT NULL,
    FOREIGN KEY (B_NO) REFERENCES BOOK,
    FOREIGN KEY (U_NO) REFERENCES MEMBER
);

DROP SEQUENCE SEQ_C_NO;
CREATE SEQUENCE SEQ_C_NO;

COMMENT ON COLUMN CART.C_NO IS '장바구니 번호';
COMMENT ON COLUMN CART.B_NO IS '책 번호';
COMMENT ON COLUMN CART.U_NO IS '사용자 번호';

SELECT * FROM CART;
---------------------------------------------
---------- BOOKBOARD 테이블 ----------
---------------------------------------------
DROP TABLE BOOKBOARD CASCADE CONSTRAINTS;
CREATE TABLE BOOKBOARD (
    BB_NO NUMBER PRIMARY KEY,
    B_NO NUMBER NOT NULL,
    U_NO NUMBER NOT NULL,
    BB_TITLE VARCHAR2(100) NOT NULL,
    BB_CONTENT CLOB NOT NULL,
    BB_READCOUNT NUMBER NOT NULL,
    BB_RECOMMENDCOUNT NUMBER NOT NULL,
    BB_STATUS VARCHAR2(1) NOT NULL,
    CREATE_DATE DATE NOT NULL,
    MODIFY_DATE DATE NOT NULL,
    FOREIGN KEY (B_NO) REFERENCES BOOK,
    FOREIGN KEY (U_NO) REFERENCES MEMBER
);

DROP SEQUENCE SEQ_BB_NO;
CREATE SEQUENCE SEQ_BB_NO;

COMMENT ON COLUMN BOOKBOARD.BB_NO IS '게시판 번호';
COMMENT ON COLUMN BOOKBOARD.B_NO IS '책 번호';
COMMENT ON COLUMN BOOKBOARD.U_NO IS '사용자 번호';
COMMENT ON COLUMN BOOKBOARD.BB_TITLE IS '게시판 제목';
COMMENT ON COLUMN BOOKBOARD.BB_CONTENT IS '게시판 내용';
COMMENT ON COLUMN BOOKBOARD.BB_READCOUNT IS '조회수';
COMMENT ON COLUMN BOOKBOARD.BB_RECOMMENDCOUNT IS '추천수';
COMMENT ON COLUMN BOOKBOARD.BB_STATUS IS '상태';
COMMENT ON COLUMN BOOKBOARD.CREATE_DATE IS '작성일';
COMMENT ON COLUMN BOOKBOARD.MODIFY_DATE IS '수정일';

SELECT * FROM BOOKBOARD;
------------------------------------------
---------- FREEBOARD 테이블----------
------------------------------------------
DROP TABLE FREEBOARD CASCADE CONSTRAINTS;
CREATE TABLE FREEBOARD (
    FB_NO NUMBER PRIMARY KEY,
    U_NO NUMBER NOT NULL,
    FB_CATEGORY VARCHAR2(20) NOT NULL,
    FB_TITLE VARCHAR2(100) NOT NULL,
    FB_CONTENT CLOB NOT NULL,
    ORIGINAL_FILENAME VARCHAR2(100),
    RENAMED_FILENAME VARCHAR2(100),
    FB_READCOUNT NUMBER NOT NULL,
    FB_REPLYCOUNT NUMBER NOT NULL,
    FB_STATUS VARCHAR2(1) NOT NULL,
    CREATE_DATE DATE NOT NULL,
    MODIFY_DATE DATE NOT NULL,
    FOREIGN KEY (U_NO) REFERENCES MEMBER
);

DROP SEQUENCE SEQ_FB_NO;
CREATE SEQUENCE SEQ_FB_NO;

COMMENT ON COLUMN FREEBOARD.FB_NO IS '게시판 번호';
COMMENT ON COLUMN FREEBOARD.U_NO IS '사용자 번호';
COMMENT ON COLUMN FREEBOARD.FB_CATEGORY IS '게시판 분류';
COMMENT ON COLUMN FREEBOARD.FB_TITLE IS '게시판 제목';
COMMENT ON COLUMN FREEBOARD.FB_CONTENT IS '게시판 내용';
COMMENT ON COLUMN FREEBOARD.ORIGINAL_FILENAME IS '기존 파일명';
COMMENT ON COLUMN FREEBOARD.RENAMED_FILENAME IS '수정 파일명';
COMMENT ON COLUMN FREEBOARD.FB_READCOUNT IS '조회수';
COMMENT ON COLUMN FREEBOARD.FB_REPLYCOUNT IS '댓글수';
COMMENT ON COLUMN FREEBOARD.FB_STATUS IS '상태';
COMMENT ON COLUMN FREEBOARD.CREATE_DATE IS '작성일';
COMMENT ON COLUMN FREEBOARD.MODIFY_DATE IS '수정일';

SELECT * FROM FREEBOARD;
---------------------------------------------
--------------- REPLY 테이블---------------
---------------------------------------------
DROP TABLE REPLY CASCADE CONSTRAINTS;
CREATE TABLE REPLY (
    R_NO NUMBER PRIMARY KEY,
    FB_NO NUMBER NOT NULL,
    U_NO NUMBER NOT NULL,
    R_CONTENT VARCHAR2(400) NOT NULL,
    R_STATUS VARCHAR2(1) NOT NULL,
    CREATE_DATE DATE NOT NULL,
    MODIFY_DATE DATE NOT NULL,
    FOREIGN KEY (FB_NO) REFERENCES FREEBOARD,
    FOREIGN KEY (U_NO) REFERENCES MEMBER
);

DROP SEQUENCE SEQ_R_NO;
CREATE SEQUENCE SEQ_R_NO;

COMMENT ON COLUMN REPLY.R_NO IS '댓글 번호';
COMMENT ON COLUMN REPLY.FB_NO IS '게시판 번호';
COMMENT ON COLUMN REPLY.U_NO IS '사용자 번호';
COMMENT ON COLUMN REPLY.R_CONTENT IS '댓글 내용';
COMMENT ON COLUMN REPLY.R_STATUS IS '댓글 상태';
COMMENT ON COLUMN REPLY.CREATE_DATE IS '댓글 작성일';
COMMENT ON COLUMN REPLY.MODIFY_DATE IS '댓글 수정일';

SELECT * FROM REPLY;
-------------------------------------------------
--------------- LIBRARY 테이블 ---------------
-------------------------------------------------
DROP TABLE LIBRARY CASCADE CONSTRAINTS;
CREATE TABLE LIBRARY (
    L_NO NUMBER PRIMARY KEY,
    L_NAME VARCHAR2(50) NOT NULL,
    L_ADDRESS VARCHAR2(100) NOT NULL,
    L_LAT VARCHAR2(15) NOT NULL,
    L_LNG VARCHAR2(15) NOT NULL
);
----------------------- 끝 -----------------------