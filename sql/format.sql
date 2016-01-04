set timing on
set echo off
--pagesize=0 disables headers
--set pagesize 0
set pagesize  50000
set linesize  999
set arraysize 5000
set long 9000
set newpage none
set termout off
set feedback off
set trimspool on
set verify off
set serveroutput on

#predel
column acctnum            format a16;
column zip                format a5;
column notes              format a42;
column timestamp          format a28;
column CT_CL_TID          format '999999999999';
column CL_TID             format '999999999999';
column last4              format a5;
column ct_xid             format a20;
column xid                format a20;

#eprefs
column email              format a30;
column brand              format a40;
column BRAND_LOGO_URL     format a45;
column HARD_OPTOUT_LOGO   format a32;

#cxpi   
column AUDIT_TYPE_DESC    format a32;
column AUDIT_DESC         format a32;
column AUDIT_MESSAGE      format a32;
column TRANSACTION_ID     format a32;

#gemsoa
column transaction_id     format a24;
column jbossid            format a32;
--column duration           format a26;

#s4
column ACCOUNTNUMBER      format 9999999999999999;
column ACCOUNTID          format a16;
column last_update        format a28;
column USER_CODE          format a16;
column LOCATION_CODE      format a20;
