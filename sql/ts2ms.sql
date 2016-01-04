create or replace function ts2ms
  (
    ts        IN      timestamp
  )
RETURN number
IS
 ms    number;

CURSOR c1 is
select sum(
    (extract(hour   from ts)*3600)+
    (extract(minute from ts)*60)+
    (extract(second from ts)))*1000 ms from dual;

BEGIN
  open c1;
  fetch c1 into ms;


RETURN ms;

EXCEPTION
when no_data_found then
   return NULL;

end ts2ms;
/
show errors;

