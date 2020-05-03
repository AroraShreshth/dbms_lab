
-- STORED ADDITION MULTIPLICATION AND DIVISION
CREATE OR REPLACE PROCEDURE PROCESS ( A IN NUMBER, B IN NUMBER, C OUT NUMBER, D OUT NUMBER, E OUT NUMBER, F OUT NUMBER) IS

BEGIN 
    C:=A+B;
    D:=A-B;
    E:=A*B;
    F:=A/B;

END;

DECLARE 
    FIRST_NUMBER NUMBER;
    SECOND_NUMBER NUMBER;
    ADDN NUMBER;
    SUB NUMBER;
    MUL NUMBER;
    DIV NUMBER;
begin
  
  FIRST_NUMBER:=4;
  SECOND_NUMBER:=2;
  PROCESS(FIRST_NUMBER, SECOND_NUMBER, ADDN, SUB, MUL,DIV);
  DBMS_OUTPUT.PUT_LINE('ADDITION : ' || ADDN || ' Subtraction : '|| SUB || ' Multiplication : '|| MUL ||' DIVISION: '|| DIV);
end;

-- STORED FIRE EMPLOYEE

select * from EMP

CREATE OR REPLACE PROCEDURE fire_employee( emp_id IN NUMBER ) AS
begin
  DELETE FROM EMP WHERE eno= emp_id;
  DBMS_OUTPUT.PUT_LINE('Number of Records Deleted ' || SQL%ROWCOUNT);
end;

Declare 
    N Number;
begin
   N:=1;
   fire_employee(N);
end;

-- Local Procedure ADDITION SUBTRACTION DIV AND MULTIPLICATION Question 1
DECLARE 
    FIRST_NUMBER NUMBER;
    SECOND_NUMBER NUMBER;
    ADDN NUMBER;
    SUB NUMBER;
    MUL NUMBER;
    DIV NUMBER;
    PROCEDURE PROCESS ( A IN NUMBER, B IN NUMBER, C OUT NUMBER, D OUT NUMBER, E OUT NUMBER, F OUT NUMBER) IS
    BEGIN 
        C:=A+B;
        D:=A-B;
        E:=A*B;
        F:=A/B;
    END;

begin
  FIRST_NUMBER:=4;
  SECOND_NUMBER:=2;
  PROCESS(FIRST_NUMBER, SECOND_NUMBER, ADDN, SUB, MUL,DIV);
  DBMS_OUTPUT.PUT_LINE('ADDITION : ' || ADDN || ' Subtraction : '|| SUB || ' Multiplication : '|| MUL ||' DIVISION: '|| DIV);
end;

-- Local Procedure Raise Salary Question2


Declare 
    N Number;
    B NUMBER;
    PROCEDURE raise_salary( emp_id IN NUMBER, bonus IN NUMBER )IS
    begin
    UPDATE EMP SET salary=salary+bonus WHERE eno=emp_id;
    DBMS_OUTPUT.PUT_LINE('UPDATED SALARY BONUS: '|| bonus || ' EMP ID : ' || emp_id );
    end;
begin
   N:=3;
   B:=5000;
   raise_salary(N,B);
end;
SELECT * FROM EMP