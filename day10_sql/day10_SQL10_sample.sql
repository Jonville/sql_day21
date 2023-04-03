--1. EMP ���̺��� �̸��� 3��°�� R�̸� �̸��� ���̰� 6������ ����� ������ ���

SELECT *
FROM EMP
WHERE SUBSTR(ENAME, 3, 1) = 'R' AND LENGTH(ENAME) = 6;

--2. ���� ��ĥ�� �������� ���

SELECT TO_DATE(SYSDATE) - TO_DATE('2023/01/01', 'YYYY/MM/DD')
FROM DUAL
;

-- 3. DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�

SELECT EMPNO, ENAME, JOB ,SAL ,
DECODE(JOB, 'ANALYST', SAL+200, 'SALESMAN', SAL+180, 'MANAGER', SAL+150
        , 'CLERK', SAL+100)
FROM EMP;

--4. �� �μ��� ���� �μ�ȣ �̸�, ������, �����, �μ����� ��� ����� ��ձ޿��� ���

SELECT DEPTNO, COUNT(*), ROUND(AVG(SAL), 0)
FROM EMP
GROUP BY DEPTNO;

--5. EMP ���̺��� ���� VIEW�� ����ÿ�. ( ��, COMM�� ������ O , ������ X )

CREATE VIEW VI_EMP123
AS          -- QUERY ��
        SELECT EMPNO , ENAME , JOB , DEPTNO, SAL , NVL2(COMM, 'O' , 'X') AS COMM
        FROM EMP
;

SELECT *
FROM VI_EMP123;

--6. �μ��� �� �⵵�� �Ի��� ��� �� ���ϱ�

SELECT COUNT(*) , TO_CHAR(HIREDATE , 'YYYY') , DEPTNO
FROM EMP
GROUP BY TO_CHAR(HIREDATE , 'YYYY') , DEPTNO
;

--7. Ŀ�̼� �޴� ����� ���� ���� ���ϴ� ����� ���� O,X�� �����ϱ�

SELECT COUNT(*) CNT , NVL2(COMM, 'O' , 'X') AS "Ŀ�̼� �޴»��"
FROM EMP
GROUP BY NVL2(COMM, 'O' , 'X')
;

--8. �� �⵵�� �Ի��� ������� �ְ� �޿��� �����޿�, ��ձ޿�, �ο��� ���ϱ�

SELECT TO_CHAR(HIREDATE , 'YYYY') AS HIRE_YEAR , AVG(SAL) AVG_S
        , MAX(SAL) , MIN(SAL) , COUNT(*)

FROM EMP
GROUP BY TO_CHAR(HIREDATE , 'YYYY') 
;
