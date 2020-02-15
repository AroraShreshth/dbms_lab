create table emp_table ( 
    empno_int int NOT NULL PRIMARY KEY, 
    ename varchar(30), 
    jobs varchar(30) check( jobs='Prof' or jobs='AP' or jobs='Lect'), 
    sal int NOT NULL,
    deptno int DEFAULT 10, 
    CONSTRAINT en UNIQUE(enmae)
    );

create table emp_table ( 
    empno_int int NOT NULL PRIMARY KEY, 
    ename varchar(30), 
    jobs varchar(30) check( jobs in ('prof','AP','Lect')), 
    sal int NOT NULL,
    deptno int DEFAULT 10, 
    CONSTRAINT en UNIQUE(ename)
    );

create table book_table (
    Rno_number INT NOT NULL PRIMARY KEY, 
    DOI Date,
    DOR Date,
    CONSTRAINT CHK_date CHECK(DOR>DOI)
);

create table st(
    Rno number(10) not NULL,
    class1 char(10),
    marks number(3) check (marks >0),
    CONSTRAINTS PK_Person PRIMARY KEY ( Rno, class1)
    );


create table s(
    sno number(10) not null primary key,
    sname varchar(10),
    city varchar(50)
);
create table p(
    pno number(10) NOT NULL PRIMARY KEY,
    pname varchar(10),
    color varchar(50)
);

create table sp(
    sno number(10) REFERENCES S(sno),
    pno number(10) REFERENCES P(pno),
    CONSTRAINT sp1 PRIMARY KEY (sno, pno)
);

describe sp;
describe st;
describe s;
describe EMP_TABLE;
describe book_table;
SELECT owner, table_name FROM all_tables

