
                            ---- LISTAGG ----
                            
    -- ���ϴ� �÷� �ȿ� ���� �̾Ƴ��� ��
    -- GROUP BY �� ���� ���� ����
    
SELECT DEPTNO, LISTAGG(ENAME, ',')
FROM EMP
GROUP BY DEPTNO;

                            ---- ���� 1 ----

    -- �а��� �̸��� ���                            
SELECT LISTAGG(STU_NAME, ', ') AS �̸�, STU_DEPT
FROM STUDENT
GROUP BY STU_DEPT;

