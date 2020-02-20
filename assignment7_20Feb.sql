
/*Creating tables*/
create table S(
    Sno number(6) primary key,
    Sname varchar2(100),
    City varchar2(100)
);

create table SP(
    Pno number(6) primary key,
    Pname varchar2(100),
    Color varchar2(100)
);

create table P(
    Sno number(6);
    Pno number(6);
    Qty number(6);
    constraint sp_sno_pno primary key ( Sno,Pno),
    constraint sp_sno_fk foreign key ( Sno ) reference S(Sno),
    constraint sp_pno_fk foreign key (Pno) referne P(Pno)
);

/*1*/
select Pno, city from S,SP where S.Sno=SP.Sno;

/*2*/
select sum(qty) "total Red parts suplied" from SP,P where P.no=Sp.no and P.color='Red';

/*3*/
select Sname from S,Sp,P where S.Sno=SP.Sno and P.Pno=SP.Pno and color='Red';

/*4*/
select Sname,Pname from S,SP, P where S.Sno=SP.Sno and P.Pno=SP.Sno and SP.Qty>100

/*5*/

select a.Sno "Sno 1", b.Sno "Sno 2" fromn S a, S b where a.city=b.city and a.Sno<b.Sno;
