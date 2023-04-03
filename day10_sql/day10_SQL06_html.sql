
                            ---- HTML ----
                            
WITH TEMP_TABLE AS(     -- WITH 로 임시 테이블만듬                         
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
        
SELECT REGEXP_SUBSTR(HTML, '<H1>.* </H1>') AS TAG     -- REGEXP_SUBSTR 은 정규식 
                                            -- .* 하나이상의 모든 것들을 출력한다는의미
FROM TEMP_TABLE;