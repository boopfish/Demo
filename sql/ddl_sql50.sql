-- 创建数据库exercise
create database exercise;

-- 使用数据库exercise
use exercise;

-- 创建学生表student
create table student
(Sno  varchar(10) not null,
 Sname varchar(10)        ,
 Sage  date               ,
 Ssex  varchar(10)        ,
 primary key (Sno));
start transaction;
insert into student values ('01', '赵雷', '1990-01-01', '男');
insert into student values ('02', '钱电', '1990-12-21', '男');
insert into student values ('03', '孙风', '1990-05-20', '男');
insert into student values ('04', '李云', '1990-08-06', '男');
insert into student values ('05', '周梅', '1991-12-01', '女');
insert into student values ('06', '吴兰', '1992-03-01', '女');
insert into student values ('07', '郑竹', '1989-07-01', '女');
insert into student values ('08', '王菊', '1990-01-20', '女');
commit;

-- 创建科目表course
create table course
(Cno varchar(10)  not null,
 Cname varchar(10)     ,
 Tno  varchar(10)      ,
 primary key (Cno));
start transaction;
insert into course values ('01', '语文', '02');
insert into course values ('02', '数学', '01');
insert into course values ('03', '英语', '03');
commit;

-- 创建教师表teacher
create table teacher
(Tno varchar(10)   not null,
 Tname varchar(10)  ,
 primary key (Tno));
strat transaction;
insert into teacher values ('01', '张三');
insert into teacher values ('02', '李四');
insert into teacher values ('03', '王五');
commit;

-- 创建成绩表 sc
create table sc
(Sno varchar (10)    ,
 Cno varchar (10)    ,
 score decimal(18,1),
 primary key (Sno, Cno));
start transaction;
insert into SC values('01' , '01' , 80);
insert into SC values('01' , '02' , 90);
insert into SC values('01' , '03' , 99);
insert into SC values('02' , '01' , 70);
insert into SC values('02' , '02' , 60);
insert into SC values('02' , '03' , 80);
insert into SC values('03' , '01' , 80);
insert into SC values('03' , '02' , 80);
insert into SC values('03' , '03' , 80);
insert into SC values('04' , '01' , 50);
insert into SC values('04' , '02' , 30);
insert into SC values('04' , '03' , 20);
insert into SC values('05' , '01' , 76);
insert into SC values('05' , '02' , 87);
insert into SC values('06' , '01' , 31);
insert into SC values('06' , '03' , 34);
insert into SC values('07' , '02' , 89);
insert into SC values('07' , '03' , 98);
commit;