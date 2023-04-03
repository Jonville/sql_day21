
                            ---- UNION ----
                            
-- 두개이상의 테이블의 결과를 합쳐서 출력해준다
-- 성능적으로 좋지 못해서 잘 사용하지않음 정말 가끔 사용함

SELECT * FROM STUDENT WHERE STU_HEIGHT >= 170
UNION                   -- 중복을 제거해서 출력해줌
SELECT * FROM STUDENT WHERE STU_WEIGHT >= 60;

SELECT * FROM STUDENT WHERE STU_HEIGHT >= 170
UNION ALL               -- 중복 제거 안함
SELECT * FROM STUDENT WHERE STU_WEIGHT >= 60;

SELECT STU_NO AS TEST, STU_NAME       -- 별칭은 첫번째 컬럼에 영향을 받음
FROM STUDENT
WHERE STU_HEIGHT >= 170
UNION                   -- 중복을 제거해서 출력해줌
SELECT STU_NO AS HAHAHA, STU_NAME
FROM STUDENT
WHERE STU_WEIGHT >= 60;

                            ---- 예제 1 ----
                            
-- EMP 테이블에서 급여가 1500 이상이거나  COMM 을 받는 사람의 사번, 이름, 직업

SELECT *
FROM EMP
WHERE SAL >= 1500
UNION
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

--------------------------------------------------------------------------------

                            ---- 문제풀이1 ----

-- 부서별 평균을 구하고 전체 평균을 행에 추가해라

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT D.DNAME , AVG(SAL) AVG_S 
FROM EMP E 
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
GROUP BY  D.DNAME

UNION

SELECT '전체', AVG(SAL)       -- 행에 '전체'라고 해줘야 DNAME 열에 들어갈수있다.
FROM EMP E 
;


                            
