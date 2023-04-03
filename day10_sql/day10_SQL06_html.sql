
                            ---- HTML ----
                            
WITH TEMP_TABLE AS(     -- WITH �� �ӽ� ���̺���                         
    SELECT
        '<HTML>'
        ||  '<HEAD>'
        || '<TITLE> TEST </TITLE>'
        ||  ' </HEAD>'
        ||   '<BODY>'
        ||   '<H1> TEST123 </H1>'    
        ||  '</BODY>'
        ||  '</HTML>' AS HTML
        FROM DUAL
)
        
SELECT REGEXP_SUBSTR(HTML, '<H1>.* </H1>') AS TAG     -- REGEXP_SUBSTR �� ���Խ� 
                                            -- .* �ϳ��̻��� ��� �͵��� ����Ѵٴ��ǹ�
FROM TEMP_TABLE;