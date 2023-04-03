
                            ---- MERGE ----
                            
    -- 두개의 테이블을 하나로 합치는데 (병합)
    -- 조건에 따라 UPDATE , DELETE 등 이 가능하다

SELECT * FROM EMP;

MERGE
INTO EMP E
USING DUAL
ON ( E.EMPNO = 1500 )       -- 조건문
WHEN MATCHED THEN       -- 해당조건문이 해당이 되면
    UPDATE 
        SET E.DEPTNO = 10
WHEN NOT MATCHED THEN       -- 해당조건문이 해당이 안되면
    INSERT (EMPNO , ENAME , DEPTNO)
    VALUES (2345 , 'KANG' , 40);
    
--------------------------------------------------------------------------------

                            ---- 문제풀이1 ----  
                            
    -- 1. 홍길동이라는 학생이 존재할 경우 학년을 1, 반을 A로 변경
    -- 없을 경우 학번이 20201234, 이름을 홍길동, 학과는 기계, 학년은 1, 반은 A로 삽입

SELECT  * FROM STUDENT;

MERGE
INTO STUDENT S
USING DUAL
ON ( S.STU_NAME = '홍길동' )       -- 조건문
WHEN MATCHED THEN       -- 해당조건문이 해당이 되면
    UPDATE 
        SET S.STU_GRADE = 1, S.STU_CLASS = 'A'
WHEN NOT MATCHED THEN       -- 해당조건문이 해당이 안되면
    INSERT (STU_NO , STU_NAME , STU_DEPT , S.STU_GRADE , S.STU_CLASS)
    VALUES (20201234 , '홍길동' , '기계' , 1 , 'A');