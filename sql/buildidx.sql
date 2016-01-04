set serveroutput on
set termout on
set feedback on

alter session set events '10046 trace name context forever, level 12';

set verify off

col asp new_value thetable 

select table_name asp from user_synonyms where synonym_name = 'ASP_NEXT';

select '&&thetable' from dual;


CREATE UNIQUE INDEX PK_ASP_WWR
ON &&thetable
          (AccountSuggestedProductID,ACCOUNTID)
         NOLOGGING
         PARALLEL (DEGREE 16)
         PCTFREE 5
         INITRANS 15
         MAXTRANS 255
         STORAGE(
           MINEXTENTS 1
           MAXEXTENTS UNLIMITED
           PCTINCREASE 0
           FREELISTS 1 FREELIST GROUPS 1
           BUFFER_POOL DEFAULT)
         COMPUTE STATISTICS
TABLESPACE CUSTOMER_INDEX_TS;




alter session set events '10046 trace name context off';
