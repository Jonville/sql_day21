SELECT *
FROM T_PRODUCT;

CREATE OR REPLACE FUNCTION WON_TEST1
    (P_PRICE IN T_PRODUCT.PRICE%TYPE)
    RETURN VARCHAR2       -- RETURN 타입을 정해줘야한다 . 자바처럼
IS
    PRICE_WON VARCHAR2(50); -- RETURN 값에 타입이랑 같게 해줘야함
BEGIN
    PRICE_WON := TO_CHAR(P_PRICE , 'FML999,999,999');
    RETURN PRICE_WON      -- MAX_SAL 을 다시 리턴 해준다
    ;
        
END;
/

SELECT WON_TEST1(PRICE)
FROM T_PRODUCT;
