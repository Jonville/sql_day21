
                            ---- LISTAGG ----
                            
    -- 원하는 컬럼 안에 값을 뽑아내는 것
    -- GROUP BY 랑 같이 쓰면 좋음
    
SELECT DEPTNO, LISTAGG(ENAME, ',')
FROM EMP
GROUP BY DEPTNO;

                            ---- 예제 1 ----

    -- 학과별 이름들 출력                            
SELECT LISTAGG(STU_NAME, ', ') AS 이름, STU_DEPT
FROM STUDENT
GROUP BY STU_DEPT;

