set echo off
--pagesize=0 disables headers
--set pagesize 0
set pagesize  50000
set linesize  80 
set arraysize 5000
set long 9000
set newpage none
set termout on 
set feedback off
set trimspool on
set verify off
set serveroutput on

column table_name format a40;

set pagesize 0
select '&&1' table_name from dual;

set pagesize 999
desc &&1;


set linesize  999

