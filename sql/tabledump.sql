set echo off feedback off timing off pause off verify off
set pagesize 0 linesize 4000 trimout on trimspool on
undef tbl
--accept tbl prompt "name of the table or view : "
--accept path prompt "path of output file (exact): "
define tbl = '&&1'
define path = '&&2'

set termout off
spool &&path/run_&&tbl..sql
prompt set echo off feedback off timing off pause off verify off termout off
prompt spool &&path/&&tbl..csv
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
@run_&&tbl
set termout on
set feedback 6 verify on

!rm &&path/run_&&tbl..sql

prompt
prompt
prompt


exit

