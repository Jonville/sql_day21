
                            ---- ORACLE JOIN ----

-- ����Ŭ SQL ������ ��������
-- INNER JOIN ���� ����ȭ����

SELECT *
FROM STUDENT S, ENROL E
WHERE S.STU_NO = E.STU_NO;

/*
    SELECT *
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;
                                                 �̰Ŷ� ������      */

SELECT *
FROM STUDENT S, ENROL E
WHERE S.STU_NO = E.STU_NO AND STU_DEPT = '��ǻ������';  

                            ---- ����1 ----
-- EMP ���̺�                            
-- �μ� ��ȣ�� DEPT ���̺� ��ġ��    

SELECT *
FROM EMP E , DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--------------------------------------------------------------------------------

                        ---- ORACEL LEFT JOIN ----
                            
SELECT *
FROM T_PRODUCT;

SELECT *
FROM T_PIMAGE;

SELECT *
FROM T_PRODUCT P , T_PIMAGE I
WHERE P.P_ID = I.P_ID(+);       -- (+) �ϸ� LEFT JOIN ó�� ���� ������ NULL ������ ä���ش�.

/*
    SELECT *
    FROM T_PRODUCT P
    LEFT JOIN T_PIMAGE I ON P.P_ID = I.P_ID;
                                                 �̰Ŷ� ������      */

                            ---- ����1 ----
                            
-- T_CODE �� ���� Ȯ���ض�

SELECT *
FROM T_PRODUCT P , T_CODE C
WHERE P.KIND = C.CODE(+) AND C.KIND = 'CLOTH';

SELECT *
FROM T_CODE;

--------------------------------------------------------------------------------

                        ---- CROSS JOIN ----        ���� �Ⱦ�
                        
-- ������ ��� ����� ���� �������ִ°�
SELECT *
FROM EMP E
CROSS JOIN DEPT D;

SELECT *
FROM EMP E, DEPT D;     -- ����Ŭ ������ ������ ������ �ڵ����� ũ�ν� �����̵�.


--------------------------------------------------------------------------------

                            ---- ����Ǯ��1 ----
                            
-- 1. ��ǻ�� ���� ������ ��� �л����� ��� �������� ���� ������ ������ �ִ� ��ǻ�������� �л� ���

SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;
SELECT * FROM ENROL;

SELECT *
FROM
    (
    SELECT AVG(ENR_GRADE) AVG_G
    FROM ENROL E , SUBJECT S2
    WHERE E.SUB_NO = S2.SUB_NO AND SUB_NAME = '��ǻ�Ͱ���'
    )A , ENROL E , STUDENT S
WHERE S.STU_NO = E.STU_NO AND ENR_GRADE > AVG_G AND STU_DEPT = '��ǻ������' ;

