
                            ---- MERGE ----
                            
    -- �ΰ��� ���̺��� �ϳ��� ��ġ�µ� (����)
    -- ���ǿ� ���� UPDATE , DELETE �� �� �����ϴ�

SELECT * FROM EMP;

MERGE
INTO EMP E
USING DUAL
ON ( E.EMPNO = 1500 )       -- ���ǹ�
WHEN MATCHED THEN       -- �ش����ǹ��� �ش��� �Ǹ�
    UPDATE 
        SET E.DEPTNO = 10
WHEN NOT MATCHED THEN       -- �ش����ǹ��� �ش��� �ȵǸ�
    INSERT (EMPNO , ENAME , DEPTNO)
    VALUES (2345 , 'KANG' , 40);
    
--------------------------------------------------------------------------------

                            ---- ����Ǯ��1 ----  
                            
    -- 1. ȫ�浿�̶�� �л��� ������ ��� �г��� 1, ���� A�� ����
    -- ���� ��� �й��� 20201234, �̸��� ȫ�浿, �а��� ���, �г��� 1, ���� A�� ����

SELECT  * FROM STUDENT;

MERGE
INTO STUDENT S
USING DUAL
ON ( S.STU_NAME = 'ȫ�浿' )       -- ���ǹ�
WHEN MATCHED THEN       -- �ش����ǹ��� �ش��� �Ǹ�
    UPDATE 
        SET S.STU_GRADE = 1, S.STU_CLASS = 'A'
WHEN NOT MATCHED THEN       -- �ش����ǹ��� �ش��� �ȵǸ�
    INSERT (STU_NO , STU_NAME , STU_DEPT , S.STU_GRADE , S.STU_CLASS)
    VALUES (20201234 , 'ȫ�浿' , '���' , 1 , 'A');