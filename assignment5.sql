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

SELECT * FROM EMP;

-- LOOPING OVER A TABLE

DECLARE
    CURSOR C1 IS SELECT EMPNO,ENAME,JOB FROM EMP ;
    REC C1%ROWTYPE;
BEGIN 
    OPEN C1;
    LOOP
        FETCH C1 INTO REC;
        EXIT WHEN C1%NOTFOUND;
        dbms_output.put_line('EMPNO :' || REC.EMPNO);
        dbms_output.put_line('ENAME :' || REC.ENAME);
        dbms_output.put_line('JOB :' || REC.JOB);
    END LOOP;
    CLOSE C1;
END;
        
-- CURSOR FOOR LOOP

DECLARE
    CURSOR C1 IS SELECT EMPNO,ENAME,JOB,SAL FROM EMP ;
    REC C1%ROWTYPE;
BEGIN 
    FOR REC IN C1 LOOP
        dbms_output.put_line(' EMPNO :' || REC.EMPNO || ' | ENAME :' || REC.ENAME || ' | JOB :' || REC.JOB || ' | SALARY: ' || REC.SAL);
    END LOOP;
END;
        
-- Cursor with Parameters Normie method
DECLARE
    CURSOR C1 (d number) IS 
    SELECT * FROM EMP WHERE DEPTNO=d;
    REC C1%ROWTYPE;
BEGIN 
    OPEN C1(23);
    LOOP
        FETCH C1 INTO REC;
        EXIT WHEN C1%NOTFOUND;
        dbms_output.put_line('EMPNO :' || REC.EMPNO);
        dbms_output.put_line('ENAME :' || REC.ENAME);
        dbms_output.put_line('JOB :' || REC.JOB);
    END LOOP;
    CLOSE C1;
END;

-- Cursor with parameters For LOOP method

DECLARE
    CURSOR C1 (d number) IS 
    SELECT * FROM EMP WHERE DEPTNO=d;
    REC C1%ROWTYPE;
BEGIN 
    FOR REC IN C1(23) LOOP
        dbms_output.put_line(' EMPNO :' || REC.EMPNO || ' | ENAME :' || REC.ENAME || ' | JOB :' || REC.JOB || ' | SALARY: ' || REC.SAL);
    END LOOP;
END;


-- Cursor with multiple parameters For LOOP method

DECLARE
    CURSOR C1 (d number, n char ) IS 
    SELECT * FROM EMP WHERE DEPTNO=d AND ENAME=n;
    REC C1%ROWTYPE;
BEGIN 
    FOR REC IN C1(23, 'SHRESHTH') LOOP
        dbms_output.put_line(' EMPNO :' || REC.EMPNO || ' | ENAME :' || REC.ENAME || ' | JOB :' || REC.JOB || ' | SALARY: ' || REC.SAL);
    END LOOP;
END;


DECLARE
    CURSOR C1 IS SELECT * FROM EMP WHERE DEPTNO=10;
    REC C1%ROWTYPE;
BEGIN 
    OPEN C1;
    LOOP
        FETCH C1 INTO REC;
        EXIT WHEN C1%NOTFOUND;
        dbms_output.put_line(' EMPNO :' || REC.EMPNO || ' | ENAME :' || REC.ENAME || ' | JOB :' || REC.JOB || ' | SALARY: ' || REC.SAL || ' | DEPTNO: ' || REC.DEPTNO);
    END LOOP;
    CLOSE C1;
END;

INSERT INTO EMP VALUES(17, 'JAMIE DOE' ,'PROF',90345,10);
INSERT INTO EMP VALUES(11, 'MEGAN DOE' ,'PROF',80345,23);
INSERT INTO EMP VALUES(13, 'FOX BROWN' ,'PROF',70345,21);
INSERT INTO EMP VALUES(15, 'R. HASTINGS' ,'PROF',60345,10);


DECLARE
    CURSOR C1 IS SELECT * FROM EMP ORDER BY SAL DESC;
    REC C1%ROWTYPE;
BEGIN 
    OPEN C1;
    LOOP
        FETCH C1 INTO REC;
        EXIT WHEN (C1%ROWCOUNT > 5) OR (C1%NOTFOUND);
        dbms_output.put_line(' EMPNO :' || REC.EMPNO || ' | ENAME :' || REC.ENAME || ' | JOB :' || REC.JOB || ' | SALARY: ' || REC.SAL);
    END LOOP;
    CLOSE C1;
END;


DECLARE
    CURSOR C1 IS SELECT * FROM EMP WHERE DEPTNO=10;
    REC C1%ROWTYPE;
BEGIN 
    FOR REC IN C1 LOOP
        dbms_output.put_line(' EMPNO :' || REC.EMPNO || ' | ENAME :' || REC.ENAME || ' | JOB :' || REC.JOB || ' | SALARY: ' || REC.SAL || ' | DEPTNO: ' || REC.DEPTNO);
    END LOOP;

END;


DECLARE
    CURSOR C1 IS SELECT * FROM EMP ORDER BY SAL DESC;
BEGIN 
    FOR REC IN C1 LOOP
        EXIT WHEN (C1%ROWCOUNT > 5) ;
        dbms_output.put_line(' EMPNO :' || REC.EMPNO || ' | ENAME :' || REC.ENAME || ' | JOB :' || REC.JOB || ' | SALARY: ' || REC.SAL);
    END LOOP;
END;

INSERT INTO EMP VALUES(100, 'SHRESHTH' ,'STUD',23545,23);
BEGIN
DELETE EMP where EMPNO=100;
if sql%found then
    dbms_output.put_line('record deleted has been deleted');
end if;
end;

INSERT INTO EMP VALUES(100, 'SHRESHTH' ,'STUD',23545,23);
INSERT INTO EMP VALUES(101, 'S' ,'STUD',23545,23);
INSERT INTO EMP VALUES(102, 'A' ,'STUD',23545,23);

BEGIN 
DELETE EMP where EMPNO > 90;
    if sql%FOUND then
        dbms_output.put_line('number of rows deleted: ' || sql%ROWCOUNT);
    end if;
end;