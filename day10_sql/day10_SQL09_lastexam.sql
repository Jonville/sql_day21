--���� 1. T_BOOK ���̺��� ������ ���� �÷��� �ִ�.
--	BOOK_NO(PK), BOOK_NAME(å �̸�), BOOK_AUTHOR(����), PRICE(����)
--���� 3. T_USER ���̺��� ������ ���� �÷��� �ִ�.
--	USER_ID(PK), USER_NAME(�̸�), USER_ADDR(�ּ�)
--���� 3. T_ORDER ���̺��� ������ ���� �÷��� �ִ�.
--	BOOK_NO(FK), USER_ID(FK), S_DATETIME(�Ǹ��Ͻ�)


--���� 1. ������ ��� å ���� �ݾ��� ���ϴ� ������ �ۼ��Ͻÿ�.(��� �÷� : ���� �̸�, ���� ��� �ݾ�)

SELECT O.USER_ID , U.USER_NAME , AVG(PRICE)
FROM T_BOOK B
INNER JOIN T_ORDER O ON B.BOOK.NO = O.BOOK_NO
INNER JOIN T_USER U ON U.USER_ID = O.USER_ID
GROUP BY O.USER_ID , U.USER_NAME;

/*
    ���� 2. T_USER ���̺��� USER_NAME�� 'ȫ�浿'�� ���ڵ尡 �ִ�. �ش� ������ ������ 
    å�� �� ���� ���� å�� ������ ����� ������ ����ϴ� ������ �ۼ��Ͻÿ�. 
    (��� �÷� : ���� �̸�, ������ å�� ��)
	��, ������ �̸� 'ȫ�浿'�� �ߺ��� �����Ͱ� ���ٰ� �����Ѵ�.

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
                WHERE USER_NAME = 'ȫ�浿'
                )
;

/*  
    ����3. Ʈ���Ÿ� �ۼ��ϰ� T_BOARD ���̺��� ������� INSERT, UPDATE, DELETE �� 
    �ѹ� �̻� ����� ����� ����Ͻÿ�.
    ����1. BOARD_TRIGGER ���̺� ����
        (�÷� : L_BOARDNO, L_DATETIME, L_EVENT, L_USER)
    ����2. Ʈ���� ����� T_BOARD ���̺��� �����Ͽ� BOARD_TRIGGER ���̺� �����͸�
    INSERT �Ұ�.
        (���� 1. BOARD_NO -> L_BOARDNO, ����ð� -> L_DATETIME
                ,   �������� -> L_EVENT, ����ھ��̵� -> L_USER )
        (���� 2. ���������� ������ ����. INSERT -> I , UPDATE -> U , DELETE ->D ) 
                                                                            */                                                              
create or replace NONEDITIONABLE TRIGGER TRIGGER_TEST6
    AFTER 
    UPDATE OR INSERT OR DELETE ON T_BOARD   
    FOR EACH ROW        -- TRIGGER �� ����Ǵ� �ñ�
BEGIN

    IF INSERTING THEN           -- INSERT �� �ؿ� ����
        INSERT INTO BOARD_TRIGGER
        VALUES (:NEW.BOARD_NO , SYSDATE , 'I', 
        SYS_CONTEXT('USERENV' , 'SESSION_USER') );
    ELSIF UPDATING  THEN       -- UPDATE �� �ؿ� ����
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
SET CONTENT = '�ȳ��ϼ���1'
WHERE BOARD_NO = 1;

