
                            ---- OVER ----

    -- �ߺ��Ǵ� ģ������ ������� ���Ҷ���
    
WITH TEMP(ENAME, BIRTH, JOB) AS (
  SELECT 'ȫ�浿', '1982-01-23', 'SALESMAN' FROM DUAL UNION ALL
  SELECT '���缮', '1987-04-19', 'CLERK'    FROM DUAL UNION ALL
  SELECT '��ȣ��', '1985-12-01', 'SALESMAN' FROM DUAL UNION ALL
  SELECT '���缮', '1986-12-10', 'CLERK'    FROM DUAL UNION ALL
  SELECT 'ȫ�浿', '1987-06-02', 'MANAGER'  FROM DUAL
)

SELECT ENAME , BIRTH, JOB ,
    COUNT(DISTINCT BIRTH) OVER (PARTITION BY ENAME) AS CNT
            -- ������ �̸� ������ ������ �ٸ��ֵ� ! �̶�� �ǹ�
FROM TEMP;

                            ---- ���� 1 ----
 
    -- ���������� ������ Y �� ����϶�
    
WITH TEMP(ENAME, BIRTH, JOB) AS (
  SELECT 'ȫ�浿', '1982-01-23', 'SALESMAN' FROM DUAL UNION ALL
  SELECT '���缮', '1987-04-19', 'CLERK'    FROM DUAL UNION ALL
  SELECT '��ȣ��', '1985-12-01', 'SALESMAN' FROM DUAL UNION ALL
  SELECT '���缮', '1986-12-10', 'CLERK'    FROM DUAL UNION ALL
  SELECT 'ȫ�浿', '1987-06-02', 'MANAGER'  FROM DUAL
)

SELECT ENAME , BIRTH, JOB ,
   DECODE(COUNT(DISTINCT BIRTH) OVER (PARTITION BY ENAME) ,1, 'N' ,'Y') AS CNT
            
FROM TEMP;