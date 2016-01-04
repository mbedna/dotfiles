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

select   owner,
          db_link,
          host,
          username,
          to_char(created,'mm/dd/yy') created
from     dba_db_links
order by decode(owner,
                 'PUBLIC',1,
                 2),
          owner,
          db_link,
          host 

