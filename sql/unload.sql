set echo off feedback off timing off pause off verify off
set pagesize 0 linesize 4000 trimout on trimspool on
undef tbl
--accept tbl prompt "name of the table or view : "
--accept path prompt "path of output file (exact): "
define tbl_nm = '&&1'
define outname = '&&2'

col dummy noprint new_value tbl
select table_name dummy from 
(select table_name from user_synonyms where synonym_name = upper('&&tbl_nm')
 union all
 select table_name from user_tables where table_name = upper('&&tbl_nm'))
where table_name is not null;

select '&&tbl' tbl from dual;

--variable ob_type char(32)
--variable tbl_var char(32)
--begin
--  select object_type into :ob_type from dba_objects where object_name=upper('&&tbl_nm') and owner='S4';
--  if :ob_type='SYNONYM' then
--     select table_name into :tbl_var from user_synonyms where synonym_name = upper('&&tbl_nm');
--     --get table
--  else
--     :tbl_var := upper('&&tbl_nm'); 
--     --set tbl
--  end if;
--end;
--/
--print :tbl_var;
--define tbl = :tbl_var
--select '&&tbl' from dual;

col dummy noprint new_value path
select substr('&&outname',1,(instr('&&outname.','/',-1,1)-1)) dummy from dual;

set termout off
spool &&path/run_&&tbl..sql
prompt set echo off feedback off timing off pause off verify off termout off
prompt spool &&outname
select  decode(column_id,1,'SELECT','')||chr(9)||
        decode(column_id,1,'','||''|''||')||
        decode(data_type,
                'CHAR', '''''||',
                'VARCHAR2', '''''||',
                'NCHAR', '''''||',
                'NVARCHAR2', '''''||''||',
                'LONG', '''''||',
                'CLOB', '''''||',
                        '')||
        column_name||
        decode(data_type,
                'CHAR', '||''''',
                'VARCHAR2', '||''''',
                'NCHAR', '||''''',
                'NVARCHAR2', '||''''',
                'LONG', '||''''',
                'CLOB', '||''''',
                        '') txt
from    user_tab_columns
where   table_name = upper('&&tbl')
order by column_id;
prompt from     &&tbl
prompt /
prompt spool off
set termout on
spool off
@&&path/run_&&tbl
set termout on
set feedback 6 verify on

!rm &&path/run_&&tbl..sql

prompt
prompt
prompt


exit

