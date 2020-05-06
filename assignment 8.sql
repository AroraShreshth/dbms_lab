CREATE TABLE CUST(
    Cno NUMBER(5) PRIMARY KEY,
    MeterNo Number(5) UNIQUE,
    Prev_Reading NUMBER(5),
    Current_Reading NUMBER(5),
    Units Number(5),
    Bill_Amount Number(5)
    );
    
INSERT INTO CUST VALUES(89, 100, 300, 800,0,0);
INSERT INTO CUST VALUES(67, 101, 790, 1000,0,0);
INSERT INTO CUST VALUES(90, 200, 800, 1200,0,0);
INSERT INTO CUST VALUES(62, 789, 200, 800,0,0);
INSERT INTO CUST VALUES(70, 899, 3200, 8700,0,0);
INSERT INTO CUST VALUES(66, 500, 3000, 9800,0,0);

SELECT * FROM CUST;
 -- Question 6 on Assignment
 -- UPdate the units and bill of specific customer number in CUST table

CREATE OR REPLACE PROCEDURE BILL(CUST_NO IN NUMBER) IS
    REC CUST%ROWTYPE;
    B NUMBER;
    U NUMBER;
    EXTRA NUMBER;
BEGIN
     SELECT * INTO REC FROM CUST WHERE Cno =CUST_NO;
    U:= REC.Current_Reading - REC.Prev_Reading;
        IF U<100 THEN
            B:=U*0.5;
        ELSE 
            EXTRA:=U-100;
            B:=100*0.5 + EXTRA*0.75; 
        END IF;
    UPDATE CUST SET Units=U, Bill_Amount=B WHERE Cno=CUST_NO;
END;

-- calling stored procedure 
begin
  BILL(89);
end;
-- PRINTING ALL OUTPUT TO SCREEN
SELECT * FROM CUST;
--- Question 7 Stored Procedure to Update all elemensts

CREATE OR REPLACE PROCEDURE BILL_ALL IS 
    CURSOR C1 IS SELECT * FROM CUST;
    B NUMBER;
    U NUMBER;
    EXTRA NUMBER;
BEGIN
    FOR REC IN C1 LOOP
        U:= REC.Current_Reading - REC.Prev_Reading;
        IF U<100 THEN
            B:=U*0.5;
        ELSE 
            EXTRA:=U-100;
            B:=100*0.5 + EXTRA*0.75; 
        END IF;
        UPDATE CUST SET Units=U, Bill_Amount=B WHERE Cno=REC.Cno;
    END LOOP;
END;  
begin
  BILL_ALL;
end;
SELECT * FROM CUST;
-- Question 5 


-- Question1 
CREATE TABLE EMP(
    EMPNO NUMBER(3) PRIMARY KEY,
    ENAME CHAR(30),
    JOB CHAR(20),
    SAL NUMBER(10),
    );
INSERT INTO EMP VALUES(3, 'SHRESHTH' ,'STUD',23545);
create or replace procedure INSERT_EMP(eno in number,ename char, job char,,salary in number) is
begin
INSERT into EMP values(eno,ename,job,salary);
end;

SELECT * FROM EMP;
begin
INSERT_EMP(1,'akhil','CFO',100000); 
DBMS_OUTPUT.PUT_LINE('EMPLOYEE INSERTED')

end;
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

-- Answer Question1 

-- CREATE STORED PROCEDURE
create or replace procedure INSERT_EMP(eno in number,ename char, job char,salary in number, dept in number) is
begin
INSERT into EMP values(eno,ename,job,salary,dept);
end;
-- CODE TO RUN PROCEDURE 
begin
INSERT_EMP(101,'shreshth arora','stud',43895); 
dbms_output.put_line('Employee Inserted'); 
INSERT_EMP(102,'R.H.','ast prof.',90000); 
dbms_output.put_line('Employee Inserted'); 
end;

-- Question 2 
-- CREATE STORED FUNCTION
CREATE OR REPLACE FUNCTION DELETE_REC(dept_id number) return number is
begin
  DELETE FROM EMP WHERE DEPTNO=dept_id;
  return(SQL%ROWCOUNT);
end;
-- RUN FUNCTION
DECLARE 
    N NUMBER;
begin
  N:=DELETE_REC(10);
  DBMS_OUTPUT.PUT_LINE('DELTED No. of Records: '||N);
end;

-- Answer 3 STORED Function
-- STORED FUNCTION TO UPDATE
CREATE OR REPLACE FUNCTION update_salary( dept_id NUMBER, bonus NUMBER ) RETURN NUMBER IS
    begin
    UPDATE EMP SET SAL=SAL+bonus WHERE DEPTNO=dept_id;
    DBMS_OUTPUT.PUT_LINE('UPDATED SALARY BONUS: '|| bonus || ' DEPT ID : ' || dept_id );
    return (SQL%ROWCOUNT);
    end;
-- RUNNING STORED FUNCTION
Declare 
    N Number;
    B NUMBER;
    UP NUMBER;
begin
   N:=21;
   B:=5000;
   UP:=update_salary(N,B);
   DBMS_OUTPUT.PUT_LINE('No. Of Updated Fields are :'|| UP);
end;
SELECT * FROM EMP


-- Answer 3 Local Function
Declare 
    N Number;
    B NUMBER;
    UP NUMBER;
    -- Local Function Def
    FUNCTION raise_salary( dept_id NUMBER, bonus NUMBER ) RETURN NUMBER IS
    begin
    UPDATE EMP SET SAL=SAL+bonus WHERE DEPTNO=dept_id;
    DBMS_OUTPUT.PUT_LINE('UPDATED SALARY BONUS: '|| bonus || ' DEPT ID : ' || dept_id );
    return (SQL%ROWCOUNT);
    end;
begin
   N:=21;
   B:=5000;
   -- Running as Local Function
   UP:=raise_salary(N,B);
   DBMS_OUTPUT.PUT_LINE('No. Of Updated Fields are :'|| UP);
end;
SELECT * FROM EMP


-- Answer 4 

--- Initial Table Code 
create table item(
    item_code number(5) primary key, 
    name char(20), 
    rate number(10));
insert into item values(1,'cricket ball',7000);
insert into item values(2,'cricket bat',1000);
insert into item values(3,'football',900);
insert into item values(4,'shuttle',200);
insert into item values(5,'racquet',1100);
create table sale(
    item_code number(5) primary key,
    cno number(5), 
    qty number(5));
insert into sale values(1,101,5); 
insert into sale values(2,102,15); 
insert into sale values(3,103,10); 
insert into sale values(4,104,12); 
insert into sale values(5,105,4); 

declare
n number;
-- Function Def.
function cal_item(item_id number) return number is
    it_rate number;
    it_qty number;
    begin
        select rate into it_rate from item where item_code=item_id;
        select qty into it_qty from sale where item_code=item_id; 
        dbms_output.put_line('rate is '||it_rate||' and its quantity is '||it_qty); 
        return(it_rate*it_qty);
    end;
begin
n:=cal_item(1); -- Result Returned from Function
dbms_output.put_line('rate * qty= '||n);
end;


DECLARE
N NUMBER;
TOTAL NUMBER:=0;
-- FUCTION FOR CALCULATING INDIVIDUAL ITEMS
function calculate_items(item_id number) return number is
    it_rate number;
    it_qty number;
    begin
    select rate into it_rate from item where item_code=item_id; 
    select qty into it_qty from sale where item_code=item_id; 
    return(it_rate*it_qty);
    end;
begin
    for i in 1..5 loop
        N:=calculate_items(i);-- Result Returned from Function
        DBMS_OUTPUT.PUT_LINE('FOR ITEM CODE '|| i || ' TOTAL IS ' || N); 
        TOTAL:=TOTAL+N; -- Added to TOTAL
    end loop;
DBMS_OUTPUT.PUT_LINE('FINAL TOTAL IS: '||TOTAL); 
end;


-- Answer 5 
-- Initial Table Code
CREATE TABLE STUD(
    RNO NUMBER(3) PRIMARY KEY,
    NAME CHAR(20),
    MST NUMBER(3),
    QUIZ NUMBER(3),
    EST NUMBER(3),
    TOTAL NUMBER(3)
    );
INSERT INTO STUD VALUES(1 ,'S',100,90,30,NULL);
INSERT INTO STUD VALUES(2 ,'A',34,80,20,NULL);
INSERT INTO STUD VALUES(3 ,'B',40,30,90,NULL);
INSERT INTO STUD VALUES(4 ,'C',50,30,40,NULL);
INSERT INTO STUD VALUES(5 ,'D',70,30,20,NULL);

-- STORED FUNCTION
CREATE OR REPLACE FUNCTION TOTAL( MST NUMBER, QUIZ NUMBER, EST NUMBER) RETURN NUMBER IS
    T NUMBER;
    begin
      T:=MST + QUIZ + EST;
      return (T);
    end;
SELECT * FROM STUD;

-- FOR LOOP
DECLARE 
    N Number;
    CURSOR C1 IS SELECT * FROM STUD;
begin
    FOR REC IN C1 loop
      N:=TOTAL(REC.MST, REC.QUIZ, REC.EST);
      UPDATE STUD set TOTAL=N where RNO=REC.RNO;
    end loop;
end;