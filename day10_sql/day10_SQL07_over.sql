
                            ---- OVER ----

    -- 중복되는 친구들이 몇명인지 구할때씀
    
WITH TEMP(ENAME, BIRTH, JOB) AS (
  SELECT '홍길동', '1982-01-23', 'SALESMAN' FROM DUAL UNION ALL
  SELECT '유재석', '1987-04-19', 'CLERK'    FROM DUAL UNION ALL
  SELECT '강호동', '1985-12-01', 'SALESMAN' FROM DUAL UNION ALL
  SELECT '유재석', '1986-12-10', 'CLERK'    FROM DUAL UNION ALL
  SELECT '홍길동', '1987-06-02', 'MANAGER'  FROM DUAL
)

SELECT ENAME , BIRTH, JOB ,
    COUNT(DISTINCT BIRTH) OVER (PARTITION BY ENAME) AS CNT
            -- 동일한 이름 내에서 생일이 다른애들 ! 이라는 의미
FROM TEMP;

                            ---- 예제 1 ----
 
    -- 동명이인이 있으며 Y 로 출력하라
    
WITH TEMP(ENAME, BIRTH, JOB) AS (
  SELECT '홍길동', '1982-01-23', 'SALESMAN' FROM DUAL UNION ALL
  SELECT '유재석', '1987-04-19', 'CLERK'    FROM DUAL UNION ALL
  SELECT '강호동', '1985-12-01', 'SALESMAN' FROM DUAL UNION ALL
  SELECT '유재석', '1986-12-10', 'CLERK'    FROM DUAL UNION ALL
  SELECT '홍길동', '1987-06-02', 'MANAGER'  FROM DUAL
)

SELECT ENAME , BIRTH, JOB ,
   DECODE(COUNT(DISTINCT BIRTH) OVER (PARTITION BY ENAME) ,1, 'N' ,'Y') AS CNT
            
FROM TEMP;