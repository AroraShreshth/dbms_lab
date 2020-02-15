select chr(55) from dual;
select concat('intel','del1') from dual
select TRANSLATE ('ltech','123','456') from dual;
select sign(-10) from dual;
select add_months(date'2012-10-11', 2) from dual;
select CURRENT_TIMESTAMP FROM dual;


select length('hello everyone') from dual
select rpad('Hello', 10, 'k') from dual;
select lpad('Hello', 10, 'k') from dual;
select NEXT_DAY(TRUNC(SYSDATE), 'MONDAY') from dual;
