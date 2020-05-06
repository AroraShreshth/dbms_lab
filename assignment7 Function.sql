
--ADDING TWO NUMBERS
DECLARE
    A NUMBER;
    B NUMBER;
    RES NUMBER;
    FUNCTION ADDN( FIRST IN NUMBER, SECOND IN NUMBER) RETURN NUMBER IS
    BEGIN
    RES:=FIRST + SECOND;
    RETURN(RES);
    END;
BEGIN
    A:=3; --A:=&FIRSTNUMBER
    B:=5; --B:=&SECONDNUMBER
    RES:=ADDN(A,B);
    DBMS_OUTPUT.PUT_LINE('ADDITION IS ' || RES);
END;

--- --

-- DROP TABLE CUST;
CREATE TABLE CUST(
    acc_no number(3),
    name varchar(30),
    balance number(9));
INSERT INTO CUST VALUES(100, 'SHRESHTH', 6098090);
INSERT INTO CUST VALUES(101, 'John Doe', 9098090);
DECLARE
    acc_no NUMBER ;
    bal NUMBER;
        FUNCTION balance(acct_id NUMBER) RETURN NUMBER IS
        acct_bal CUST.BALANCE%TYPE;
        BEGIN
        SELECT BALANCE INTO acct_bal FROM CUST WHERE acc_no=acct_id;
        RETURN acct_bal;
        END balance;
BEGIN
    acc_no:=101 ;
    bal:= balance(acc_no);
    DBMS_OUTPUT.PUT_LINE('BALANCE IS. ' || bal);
END;

-- FUNCTION WITH EXCEPTIONS 
DROP TABLE CUST;
CREATE TABLE CUST(
    acc_no number(3),
    name varchar(30),
    balance number(9));
INSERT INTO CUST VALUES(100, 'SHRESHTH', 6098090);
INSERT INTO CUST VALUES(101, 'John Doe', 9098090);
DECLARE
    acc_no NUMBER ;
    bal NUMBER;
        FUNCTION balance(acct_id NUMBER) RETURN NUMBER IS
        acct_bal CUST.BALANCE%TYPE;
        BEGIN
        SELECT BALANCE INTO acct_bal FROM CUST WHERE acc_no=acct_id;
        RETURN acct_bal;
        exception 
        when no_data_found then
        RETURN -100;
        END balance;
BEGIN
    acc_no:=100 ;
    bal:= balance(acc_no);
    if bal= -100 then
    DBMS_OUTPUT.PUT_LINE('No record for account no.');
    else
    DBMS_OUTPUT.PUT_LINE('BALANCE IS. ' || bal);
    end if;
END;

---- 
DROP TABLE EMP;
CREATE TABLE EMP (
    ENO NUMBER(4)
);

INSERT INTO EMP VALUES(1);
INSERT INTO EMP VALUES(2);
INSERT INTO EMP VALUES(3);
DECLARE 
    FUNCTION TOTAL_EMP RETURN NUMBER IS
    TOTAL NUMBER;
    BEGIN 
    SELECT COUNT(*) INTO TOTAL FROM EMP;
    RETURN(TOTAL);
    END;
begin
  DBMS_OUTPUT.PUT_LINE('TOTAL NUMBER OF EMPLOYEES : '|| TOTAL_EMP());
end;

-- TOTAL NUMBER OF EMPLOYEES IN TABLE
DROP TABLE EMP;
CREATE TABLE EMP (
    ENO NUMBER(4)
);

INSERT INTO EMP VALUES(1);
INSERT INTO EMP VALUES(2);
SELECT * FROM EMP;
DECLARE 
    FUNCTION TOTAL_EMP RETURN NUMBER IS
    TOTAL NUMBER;
    BEGIN 
    SELECT COUNT(*) INTO TOTAL FROM EMP;
    RETURN(TOTAL);
    END;
BEGIN
  DBMS_OUTPUT.PUT_LINE('TOTAL NUMBER OF EMPLOYEES'|| TOTAL_EMP());
END;

-- STORED FUNCTION TO CREATE ADD TWO NUMBERS
CREATE OR REPLACE FUNCTION ADDN ( A IN NUMBER, B IN NUMBER) RETURN NUMBER IS
C NUMBER;
begin
  C:=A+B;
  RETURN(C);
end;

DECLARE 
A NUMBER;
B NUMBER;
C NUMBER;
begin
  A:=3;
  B:=4;
  C:= ADDN(A,B);
  DBMS_OUTPUT.PUT_LINE('ADDITION IS '|| C);
end;


--- SALARY FUNCTION
CREATE OR REPLACE FUNCTION SALARY (dno NUMBER)
RETURN NUMBER IS
total_salary NUMBER;
begin
  SELECT sum(salary) into total_salary from emp where deptno=deptno;
  RETURN (total_salary);
end;
DROP TABLE EMP;
CREATE TABLE EMP(
    eno number(3) primary key,
    ename varchar(20),
    job varchar(20),
    salary number(9),
    deptno number(2)
);

INSERT INTO EMP VALUES(1, 'RAM', 'PROF',200,10);
INSERT INTO EMP VALUES(2, 'SHYAM', 'PROF',970,20);
INSERT INTO EMP VALUES(3, 'RJ', 'ASSOC PROF',450,10);
DECLARE 
    D NUMBER;
    total_salary number;
begin
  D:=10;
  total_salary:=SALARY(D);
  DBMS_OUTPUT.PUT_LINE("Salary of Department Number "|| d || " is " || total_salary);
end;


-- Sub Prog ASSignment 1
CREATE OR REPLACE PROCEDURE INSERT_EMP ( ENO NUMBER, ENAME CHAR, JOB CHAR, SALARY NUMBER, DEPTNO NUMBER) IS
begin
    insert into EMP VALUES( ENO, ENAME, JOB, SALARY,DEPTNO);
end;


begin
  INSERT_EMP(5,'RAM', 'PROF', 20000, 10);
  DBMS_OUTPUT.PUT_LINE('1 ROW HAS BEEN INSERTED');
end;


--- FIRE EMPLOYEE STORED FUNCTION
CREATE OR REPLACE FUNCTION fire_employee( dep_id IN NUMBER )RETURN NUMBER AS
begin
  DELETE FROM EMP WHERE deptno= dep_id;
  RETURN (SQL%ROWCOUNT);
end;

Declare 
    N Number;
begin
  N:= fire_employee(20);
  DBMS_OUTPUT.PUT_LINE('Number of Records Deleted ' || N);
end;


DROP TABLE EMP;
CREATE TABLE EMP(
    eno number(3) primary key,
    ename varchar(20),
    job varchar(20),
    salary number(9),
    deptno number(2)
);

INSERT INTO EMP VALUES(1, 'RAM', 'PROF',200,10);
INSERT INTO EMP VALUES(2, 'SHYAM', 'PROF',970,20);
INSERT INTO EMP VALUES(3, 'RJ', 'ASSOC PROF',450,10);

CREATE OR REPLACE FUNCTION SALARY (dno NUMBER)
RETURN NUMBER IS
total_salary NUMBER;
begin
  SELECT sum(salary) into total_salary from emp where deptno=deptno;
  RETURN (total_salary);
end;

DECLARE 
    D NUMBER;
    total_salary number;
begin
  D:=10;
  total_salary:=SALARY(D);
  DBMS_OUTPUT.PUT_LINE('Salary of Department Number '|| d || ' is ' || total_salary);
end;