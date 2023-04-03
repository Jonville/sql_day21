SELECT *
FROM T_PRODUCT;

CREATE OR REPLACE FUNCTION WON_TEST1
    (P_PRICE IN T_PRODUCT.PRICE%TYPE)
    RETURN VARCHAR2       -- RETURN Ÿ���� ��������Ѵ� . �ڹ�ó��
IS
    PRICE_WON VARCHAR2(50); -- RETURN ���� Ÿ���̶� ���� �������
BEGIN
    PRICE_WON := TO_CHAR(P_PRICE , 'FML999,999,999');
    RETURN PRICE_WON      -- MAX_SAL �� �ٽ� ���� ���ش�
    ;
        
END;
/

SELECT WON_TEST1(PRICE)
FROM T_PRODUCT;
