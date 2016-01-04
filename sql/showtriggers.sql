set echo off
--pagesize=0 disables headers
--set pagesize 0
set pagesize  50000
set linesize  999
set arraysize 5000
set long 9000
set newpage none
set termout on
set feedback off
set trimspool on
set verify off
set serveroutput on

column table_name       format a30
column column_name      format a20
column triggering_event format a20

select trigger_name, table_owner||'.'||table_name table_name, column_name, trigger_type, triggering_event 
from user_triggers 
where trigger_name not like 'BIN%'
order by trigger_name;
