
                            ---- ORACLE JOIN ----

-- 오라클 SQL 에서만 쓸수있음
-- INNER JOIN 으로 습관화하자

SELECT *
FROM STUDENT S, ENROL E
WHERE S.STU_NO = E.STU_NO;

/*
    SELECT *
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;
                                                 이거랑 같은거      */

SELECT *
FROM STUDENT S, ENROL E
WHERE S.STU_NO = E.STU_NO AND STU_DEPT = '컴퓨터정보';  

                            ---- 예제1 ----
-- EMP 테이블                            
-- 부서 번호로 DEPT 테이블 합치기    

SELECT *
FROM EMP E , DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--------------------------------------------------------------------------------

                        ---- ORACEL LEFT JOIN ----
                            
SELECT *
FROM T_PRODUCT;

SELECT *
FROM T_PIMAGE;

SELECT *
FROM T_PRODUCT P , T_PIMAGE I
WHERE P.P_ID = I.P_ID(+);       -- (+) 하면 LEFT JOIN 처럼 값이 없으면 NULL 값으로 채워준다.

/*
    SELECT *
    FROM T_PRODUCT P
    LEFT JOIN T_PIMAGE I ON P.P_ID = I.P_ID;
                                                 이거랑 같은거      */

                            ---- 예제1 ----
                            
-- T_CODE 가 뭔지 확인해라

SELECT *
FROM T_PRODUCT P , T_CODE C
WHERE P.KIND = C.CODE(+) AND C.KIND = 'CLOTH';

SELECT *
FROM T_CODE;

--------------------------------------------------------------------------------

                        ---- CROSS JOIN ----        많이 안씀
                        
-- 가능한 모든 경우의 수는 조인해주는거
SELECT *
FROM EMP E
CROSS JOIN DEPT D;

SELECT *
FROM EMP E, DEPT D;     -- 오라클 조인은 조건이 없으면 자동으로 크로스 조인이됨.


--------------------------------------------------------------------------------

                            ---- 문제풀이1 ----
                            
-- 1. 컴퓨터 개론 수업을 듣는 학생들의 평균 점수보다 높은 점수를 가지고 있는 컴퓨터정보과 학생 출력

SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;
SELECT * FROM ENROL;

SELECT *
FROM
    (
    SELECT AVG(ENR_GRADE) AVG_G
    FROM ENROL E , SUBJECT S2
    WHERE E.SUB_NO = S2.SUB_NO AND SUB_NAME = '컴퓨터개론'
    )A , ENROL E , STUDENT S
WHERE S.STU_NO = E.STU_NO AND ENR_GRADE > AVG_G AND STU_DEPT = '컴퓨터정보' ;

