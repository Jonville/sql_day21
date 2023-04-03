
                            ---- MINUS ----
                            
     -- 위에서 나온 데이터 기준으로 중복 되는값을 지워버림
     -- 차집합
                            
SELECT STU_NO, STU_NAME, STU_GENDER
FROM STUDENT
WHERE STU_HEIGHT >= 160

MINUS

SELECT STU_NO, STU_NAME , STU_GENDER
FROM STUDENT
WHERE STU_GENDER = 'M' 
;

                            ---- 예제 1 ----
                            
-- EMP 테이블에서 급여가 1000이상인 사람
-- 부서가 10번 부서에 속하지 않고
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
-- WHERE HIREDATE <= TO_DATE('1982', 'YYYY') 로 써도됨
;