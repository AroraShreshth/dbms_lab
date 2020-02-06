/*CREATING TABLE*/
CREATE table EMP3505(EMPNO number(15), EMPName varchar(20), EMPJ0B varchar(16),EMPSALARY number(15), EMPDEPTTNo varchar(30));

/*SAMPLE INSERTION*/
INSERT INTO EMP3505 values(101715037, 'xyz','Salesperson' , '900', '10');
INSERT INTO EMP3505 values(101715035, '4t4','Clerk' , '90', '11');
INSERT INTO EMP3505 values(101715036, 'dfsdf','Manager' , '9000', '1');
INSERT INTO EMP3505 values(101715038, '4r3z','Salesperson' , '900', '10');
INSERT INTO EMP3505 values(101715039, 'efea','Clerk' , '90', '11');
INSERT INTO EMP3505 values(101715030, 'WEQTR','Clerk' , '90', '11');
INSERT INTO EMP3505 values(101715031, 'zsrbg','Salesperson' , '900', '10');

/* QUERIES*/
SELECT* FROM EMP3505 ;
SELECT EMPNO, EMPName FROM EMP3505 WHERE EMPDEPTTNo = '10';
SELECT EMPName FROM EMP3505 WHERE EMPJ0B='Clerk' and EMPSALARY < '3000';
SELECT EMPName, EMPSALARY FROM EMP3505 WHERE EMPJ0B = 'Clerk' OR EMPJ0B ='Salesperson';
SELECT EMPDEPTTNo, EMPSALARY FROM EMP3503 ORDER BY EMPDEPTTNo, EMPSALARY DESC;
