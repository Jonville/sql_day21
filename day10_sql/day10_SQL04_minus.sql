
                            ---- MINUS ----
                            
     -- ������ ���� ������ �������� �ߺ� �Ǵ°��� ��������
     -- ������
                            
SELECT STU_NO, STU_NAME, STU_GENDER
FROM STUDENT
WHERE STU_HEIGHT >= 160

MINUS

SELECT STU_NO, STU_NAME , STU_GENDER
FROM STUDENT
WHERE STU_GENDER = 'M' 
;

                            ---- ���� 1 ----
                            
-- EMP ���̺��� �޿��� 1000�̻��� ���
-- �μ��� 10�� �μ��� ������ �ʰ�
-- 

SELECT *
FROM EMP
WHERE SAL >= 1000

MINUS

SELECT *
FROM EMP
WHERE DEPTNO = 10

MINUS

SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YYYY') <= '1982'
-- WHERE HIREDATE <= TO_DATE('1982', 'YYYY') �� �ᵵ��
;