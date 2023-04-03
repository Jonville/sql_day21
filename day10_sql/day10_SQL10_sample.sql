--1. EMP 테이블에서 이름의 3번째가 R이며 이름의 길이가 6글자인 사원의 정보를 출력

SELECT *
FROM EMP
WHERE SUBSTR(ENAME, 3, 1) = 'R' AND LENGTH(ENAME) = 6;

--2. 올해 며칠이 지났는지 출력

SELECT TO_DATE(SYSDATE) - TO_DATE('2023/01/01', 'YYYY/MM/DD')
FROM DUAL
;

-- 3. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오

SELECT EMPNO, ENAME, JOB ,SAL ,
DECODE(JOB, 'ANALYST', SAL+200, 'SALESMAN', SAL+180, 'MANAGER', SAL+150
        , 'CLERK', SAL+100)
FROM EMP;

--4. 각 부서에 대해 부서호 이름, 지역명, 사원수, 부서내의 모든 사원의 평균급여를 출력

SELECT DEPTNO, COUNT(*), ROUND(AVG(SAL), 0)
FROM EMP
GROUP BY DEPTNO;

--5. EMP 테이블을 통해 VIEW를 만드시오. ( 단, COMM이 있으면 O , 없으면 X )

CREATE VIEW VI_EMP123
AS          -- QUERY 문
        SELECT EMPNO , ENAME , JOB , DEPTNO, SAL , NVL2(COMM, 'O' , 'X') AS COMM
        FROM EMP
;

SELECT *
FROM VI_EMP123;

--6. 부서별 각 년도에 입사한 사람 수 구하기

SELECT COUNT(*) , TO_CHAR(HIREDATE , 'YYYY') , DEPTNO
FROM EMP
GROUP BY TO_CHAR(HIREDATE , 'YYYY') , DEPTNO
;

--7. 커미션 받는 사람의 수와 받지 못하는 사람의 수를 O,X로 구분하기

SELECT COUNT(*) CNT , NVL2(COMM, 'O' , 'X') AS "커미션 받는사람"
FROM EMP
GROUP BY NVL2(COMM, 'O' , 'X')
;

--8. 각 년도별 입사한 사람들의 최고 급여와 최저급여, 평균급여, 인원수 구하기

SELECT TO_CHAR(HIREDATE , 'YYYY') AS HIRE_YEAR , AVG(SAL) AVG_S
        , MAX(SAL) , MIN(SAL) , COUNT(*)

FROM EMP
GROUP BY TO_CHAR(HIREDATE , 'YYYY') 
;
