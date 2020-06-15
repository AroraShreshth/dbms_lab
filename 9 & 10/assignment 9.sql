--  Assignment 9 and 10 code for college assignment

CREATE TABLE EMP(
    EMPNO NUMBER(3) PRIMARY KEY,
    ENAME CHAR(30),
    JOB CHAR(20),
    SAL NUMBER(5),
    DEPTNO NUMBER(2)
    );
INSERT INTO EMP VALUES(3, 'SHRESHTH' ,'STUD',23545,23);
INSERT INTO EMP VALUES(5, 'JOHN DOE' ,'PROF',92645,26);
INSERT INTO EMP VALUES(7, 'SARAH DOE' ,'AS. PROF',20345,21);
INSERT INTO EMP VALUES(9, 'JANE DOE' ,'PROF',90345,10);
INSERT INTO EMP VALUES(17, 'JAMIE DOE' ,'PROF',90345,10);
INSERT INTO EMP VALUES(11, 'MEGAN DOE' ,'PROF',80345,23);
INSERT INTO EMP VALUES(13, 'FOX BROWN' ,'PROF',70345,21);
INSERT INTO EMP VALUES(15, 'R. HASTINGS' ,'PROF',60345,10);


CREATE OR REPLACE TRIGGER emp_upper
BEFORE INSERT OR UPDATE OF ENAME
ON EMP
FOR EACH ROW
BEGIN 
    :new.ENAME :=UPPER(:new.ENAME);
END;

INSERT INTO EMP VALUES(1,'ram', 'prof',90000,10);
SELECT * FROM USER_TRIGGERS WHERE TABLE_NAME ='EMP';
SELECT * FROM EMP;

CREATE OR REPLACE TRIGGER EMP_UPDATE
AFTER UPDATE OF ENAME
ON EMP
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('OLD NAME: '|| :OLD.ENAME);
    DBMS_OUTPUT.PUT_LINE('NEW NAME: '|| :NEW.ENAME);
END;


UPDATE EMP SET ENAME='raj'
SELECT * FROM USER_TRIGGERS WHERE TABLE_NAME ='EMP'


-- Answer 4 no operation on sunday
CREATE OR REPLACE TRIGGER EMP_SUNDAY
BEFORE 
INSERT OR UPDATE OR DELETE
ON EMP
DECLARE 
DAY VARCHAR(20);
BEGIN 
    DAY:= TRIM((TO_CHAR(SYSDATE,'DAY'));
    IF DAY='SUNDAY' THEN
   raise_application_error (-20456,'NO chnages Allowed on Sunday');
    END IF;
END;

create or replace trigger holiday before
insert or delete or update
on EMP
declare
day varchar(25);
begin
select to_char(sysdate,'day') into day from dual;
if day = 'sunday' then
raise_application_error (-20456,'Sunday is holiday!!');
end if;
end;

-- Answer 4 
create or replace trigger holiday before
insert or delete or update
on EMP
declare
day varchar(25);
begin
select to_char(sysdate,'day') into day from dual;
if day = 'sunday' then
raise_application_error (-2046,' Sunday NOt Allowed');
end if;
end;

SELECT * FROM USER_TRIGGERS WHERE TABLE_NAME ='EMP';

--  Answer 3 

CREATE TABLE EMP(
    EMPNO NUMBER(3) PRIMARY KEY,
    ENAME CHAR(30),
    JOB CHAR(20),
    SAL NUMBER(5),
    DEPTNO NUMBER(2)
    );
INSERT INTO EMP VALUES(3, 'SHRESHTH' ,'STUD',23545,23);
INSERT INTO EMP VALUES(5, 'JOHN DOE' ,'PROF',92645,26);
INSERT INTO EMP VALUES(7, 'SARAH DOE' ,'AS. PROF',20345,21);
INSERT INTO EMP VALUES(9, 'JANE DOE' ,'PROF',90345,10);
INSERT INTO EMP VALUES(17, 'JAMIE DOE' ,'PROF',90345,10);
create table emp_audit(eno number(2),name_of_operation varchar(20),
date_of_operation date);
create or replace trigger e_audit
after
insert or delete or update on EMP
REFERENCING OLD AS old, NEW as new
for each row
begin
if inserting then
insert into emp_audit values(new.eno,'insert',SYSDATE);
elsif deleting then
insert into emp_audit values(old.eno,'delete',SYSDATE);
elsif updating then
insert into emp_audit values(new.eno,'update',SYSDATE);
end if;
end;
SELECT * FROM USER_TRIGGERS WHERE TABLE_NAME ='EMP';
INSERT INTO EMP VALUES(11, 'MEGAN DOE' ,'PROF',80345,23);
INSERT INTO EMP VALUES(13, 'FOX BROWN' ,'PROF',70345,21);
INSERT INTO EMP VALUES(15, 'R. HASTINGS' ,'PROF',60345,10);
update EMP set ename = 'michael' where deptno =5;
SELECT * FROM emp_audit;


-- Answer 5 
create or replace trigger bonus before
insert
on emp
for each row declare
day varchar(25); begin
if (:new.sal < :new.commision) then
raise_application_error (-20457,'Salary should not be less than commission'); end if;
end;

begin
insert into EMP values(1,'Kunal','CEO',135000,145000,10);
update EMP set commision = 150000;
end;

-- Answer 7
create table cust(Cno number(5) primary key,Meterno number(5) Unique,
prev_reading number(5),current_reading number(5), units number(5),Bill_Amount number(10));
create or replace trigger calculate before
insert
on cust
for each row declare
u number;
b number; begin
u:= :new.current_reading - :new.prev_reading; if u <= 100 then
b:=u * 0.5;
else
b:= 50 + (u - 100)*0.75; end if;
:new.units:= u; :new.Bill_Amount:= b; end;

insert into cust values(89,100,300,800,NULL,NULL); insert into cust values(67,101,790,1000,NULL,NULL); insert into cust values(90,200,800,1200,NULL,NULL); insert into cust values(62,789,200,800,NULL,NULL); insert into cust values(70,899,3200,8700,NULL,NULL); insert into cust values(66,500,3000,9800,NULL,NULL); /
select * from cust;
 
-- Answer 8

create table department(deptno number(3),deptname varchar(20));
create or replace trigger pk
before
insert or delete or update of deptno
on department
for each row
declare
cursor cur is select * from emp;

begin
if (:new.deptno is NULL) then
raise_application_error (-20357,'PK cant be null');
end if;
for c in cur loop
if (c.deptno = :new.deptno) then
raise_application_error (-20367,'PK should be unique'); end if;
end loop;
end;
create or replace trigger fk
before
insert or delete or update of deptno
on EMP
for each row
declare
cursor cur1 is select * from department; val number:= 0;
begin
for c in cur1 loop
if (c.deptno = :new.deptno) then :new.deptno:=c.deptno;
val:=1;
end if;
end loop;
if val = 0 then
raise_application_error (-20387,'the entered dept. doesnt exist'); end if;
end;
insert into department values(10,'Sales'); insert into department values(9,'Managing'); select * from department;
insert into EMP values(1,'kunal','CEO',270000,9);
insert into EMP values(2,'manav','salesperson',130000,10); insert into EMP values(3,'divesh','advisor',210000,11);
select * from EMP;


--- Answer 9
create table emp_bak as select * from emp;
create or replace trigger updt
before
insert or delete or update
on emp
for each row

begin
if inserting then
insert into emp_bak values(:new.eno,:new.ename,:new.job,:new.sal,:new.deptno);
elsif deleting then
delete emp_bak
where eno=:old.eno or ename=:old.ename or job=:old.job or sal=:old.sal or deptno=:old.deptno;
elsif updating then update emp_bak
set eno=:new.eno, ename=:new.ename, job=:new.job, sal=:new.sal,
deptno=:new.deptno
where eno=:old.eno or ename=:old.ename or job=:old.job or sal=:old.sal or deptno=:old.deptno;
end if;
end;

INSERT INTO EMP VALUES(3, 'SHRESHTH' ,'STUD',23545,23);
INSERT INTO EMP VALUES(5, 'JOHN DOE' ,'PROF',92645,26);
INSERT INTO EMP VALUES(7, 'SARAH DOE' ,'AS. PROF',20345,21);
INSERT INTO EMP VALUES(9, 'JANE DOE' ,'PROF',27000,10);
update EMP set ename = 'ABCD' where sal = 27000;
delete EMP where ename ='SHRESHTH';
select * from emp; select * from emp_bak;

-- Answer 5
create table emp(eno number(2),ename varchar(20),job varchar(20),sal number(10), commision number(10),dptno number(3));
create or replace trigger bonus before
insert
on emp
for each row declare
day varchar(25); begin
if (:new.sal < :new.commision) then
raise_application_error (-20457,'Salary should not be less than commission'); end if;
end;

begin
insert into emp values(1,'Shreshth','CEO',135000,145000,10);
update emp set commision = 150000;
end;

-- Answer 6

create or replace trigger Bat before
insert or delete or update of eno on emp
for each row
declare
cursor cur is select * from emp;
begin
if (:new.eno is NULL) then
raise_application_error (-20357,'Bat cant be null');
end if;
for c in cur loop
if (c.eno = :new.eno) then
raise_application_error (-20367,'Bat should be unique');
end if;
end loop;
end;

insert into emp values(1,'SHRESHTH','CEO',500000,12);
insert into emp values(2,'ARORA','salesperson',320000,10); insert into emp values(2,'manan','manager',250000,9);

select * from emp;