
                            ---- UNION ----
                            
-- �ΰ��̻��� ���̺��� ����� ���ļ� ������ش�
-- ���������� ���� ���ؼ� �� ����������� ���� ���� �����

SELECT * FROM STUDENT WHERE STU_HEIGHT >= 170
UNION                   -- �ߺ��� �����ؼ� �������
SELECT * FROM STUDENT WHERE STU_WEIGHT >= 60;

SELECT * FROM STUDENT WHERE STU_HEIGHT >= 170
UNION ALL               -- �ߺ� ���� ����
SELECT * FROM STUDENT WHERE STU_WEIGHT >= 60;

SELECT STU_NO AS TEST, STU_NAME       -- ��Ī�� ù��° �÷��� ������ ����
FROM STUDENT
WHERE STU_HEIGHT >= 170
UNION                   -- �ߺ��� �����ؼ� �������
SELECT STU_NO AS HAHAHA, STU_NAME
FROM STUDENT
WHERE STU_WEIGHT >= 60;

                            ---- ���� 1 ----
                            
-- EMP ���̺��� �޿��� 1500 �̻��̰ų�  COMM �� �޴� ����� ���, �̸�, ����

SELECT *
FROM EMP
WHERE SAL >= 1500
UNION
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

--------------------------------------------------------------------------------

                            ---- ����Ǯ��1 ----

-- �μ��� ����� ���ϰ� ��ü ����� �࿡ �߰��ض�

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT D.DNAME , AVG(SAL) AVG_S 
FROM EMP E 
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
GROUP BY  D.DNAME

UNION

SELECT '��ü', AVG(SAL)       -- �࿡ '��ü'��� ����� DNAME ���� �����ִ�.
FROM EMP E 
;


                            
