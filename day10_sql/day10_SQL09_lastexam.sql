--조건 1. T_BOOK 테이블에는 다음과 같은 컬럼이 있다.
--	BOOK_NO(PK), BOOK_NAME(책 이름), BOOK_AUTHOR(저자), PRICE(가격)
--조건 3. T_USER 테이블에는 다음과 같은 컬럼이 있다.
--	USER_ID(PK), USER_NAME(이름), USER_ADDR(주소)
--조건 3. T_ORDER 테이블에는 다음과 같은 컬럼이 있다.
--	BOOK_NO(FK), USER_ID(FK), S_DATETIME(판매일시)


--문제 1. 유저별 평균 책 구매 금액을 구하는 쿼리를 작성하시오.(출력 컬럼 : 유저 이름, 구매 평균 금액)

SELECT O.USER_ID , U.USER_NAME , AVG(PRICE)
FROM T_BOOK B
INNER JOIN T_ORDER O ON B.BOOK.NO = O.BOOK_NO
INNER JOIN T_USER U ON U.USER_ID = O.USER_ID
GROUP BY O.USER_ID , U.USER_NAME;

/*
    문제 2. T_USER 테이블에는 USER_NAME이 '홍길동'인 레코드가 있다. 해당 유저가 구매한 
    책의 수 보다 많은 책을 구매한 사람의 정보를 출력하는 쿼리를 작성하시오. 
    (출력 컬럼 : 유저 이름, 구매한 책의 수)
	단, 유저의 이름 '홍길동'은 중복된 데이터가 없다고 가정한다.

                                                            */

SELECT COUNT(*) CNT , BOOK_NO
FROM T_ORDER O
INNER JOIN T_USER U ON U.USER_ID = O.USER_ID
GROUP BY USER_NAME
HAVING COUNT(*) >
                (
                SELECT COUNT(*)
                FROM T_ORDER
                INNER JOIN T_USER U ON U.USER_ID = O.USER_ID
                WHERE USER_NAME = '홍길동'
                )
;

/*  
    문제3. 트리거를 작성하고 T_BOARD 테이블을 대상으로 INSERT, UPDATE, DELETE 를 
    한번 이상씩 실행수 결과를 출력하시오.
    조건1. BOARD_TRIGGER 테이블 생성
        (컬럼 : L_BOARDNO, L_DATETIME, L_EVENT, L_USER)
    조건2. 트리거 실행시 T_BOARD 테이블을 참조하여 BOARD_TRIGGER 테이블에 데이터를
    INSERT 할것.
        (참고 1. BOARD_NO -> L_BOARDNO, 현재시간 -> L_DATETIME
                ,   실행종류 -> L_EVENT, 사용자아이디 -> L_USER )
        (참고 2. 실행종류는 다음과 같은. INSERT -> I , UPDATE -> U , DELETE ->D ) 
                                                                            */                                                              
create or replace NONEDITIONABLE TRIGGER TRIGGER_TEST6
    AFTER 
    UPDATE OR INSERT OR DELETE ON T_BOARD   
    FOR EACH ROW        -- TRIGGER 가 실행되는 시기
BEGIN

    IF INSERTING THEN           -- INSERT 면 밑에 실행
        INSERT INTO BOARD_TRIGGER
        VALUES (:NEW.BOARD_NO , SYSDATE , 'I', 
        SYS_CONTEXT('USERENV' , 'SESSION_USER') );
    ELSIF UPDATING  THEN       -- UPDATE 면 밑에 실행
        INSERT INTO BOARD_TRIGGER
        VALUES (:NEW.BOARD_NO , SYSDATE , 'U', 
        SYS_CONTEXT('USERENV' , 'SESSION_USER'));
    ELSIF DELETING THEN
        INSERT INTO BOARD_TRIGGER
        VALUES (:OLD.BOARD_NO , SYSDATE , 'D', 
        SYS_CONTEXT('USERENV' , 'SESSION_USER'));
    END IF;
END;
/

SELECT * FROM T_BOARD;
SELECT * FROM BOARD_TRIGGER;

UPDATE T_BOARD
SET CONTENT = '안녕하세요1'
WHERE BOARD_NO = 1;

