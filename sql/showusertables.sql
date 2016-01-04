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

select table_name from all_tables where owner = '&&1' order by table_name;
