-- 1. 查询「李」姓老师的数量
SELECT COUNT(*) FROM teacher where Tname like '李%';
-- 2. 查询名字中含有「风」字的学生信息
SELECT COUNT(*) from student WHERE Sname like '%风%'
-- 3. 查询男生、女生人数
SELECT Ssex, count(*) FROM student GROUP BY Ssex;
-- 4. 查询课程编号为02的总成绩
SELECT SUM(score) FROM sc WHERE Cno = '02';
-- 5. 查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT Cno,avg(score)FROM sc GROUP BY Cno order by avg(score) desc,Cno;
-- 6. 求每门课程的学生人数
SELECT Cno,count(sno) FROM sc GROUP BY Cno;
-- 7. 统计每门课程的学生选修人数（超过 5 人的课程才统计）
SELECT Cno,count(sno) FROM sc GROUP BY Cno HAVING COUNT(*) >5;
-- 8. 检索至少选修两门课程的学生学号
SELECT Sno,COUNT(Cno) from sc GROUP BY sno having COUNT(sno) >=2;
-- 9. 查询在 SC 表存在成绩的学生信息
SELECT * FROM student where Sno in(SELECT Sno from sc);
-- 10. 查询不存在" 01 "课程但存在" 02 "课程的情况
SELECT * FROM sc where Sno not in(SELECT Sno from sc WHERE Cno ='01');
and sno in(SELECT Sno from sc WHERE Cno ='02')
-- 11. 查询同时存在" 01 "课程和" 02 "课程的情况SELECT * FROM sc where Sno in(SELECT Sno from sc WHERE Cno ='01');
and sno in(SELECT Sno from sc WHERE Cno ='02')
-- 12. 查询出只选修两门课程的学生学号和姓名
SELECT sno,sname from student WHERE sno in(SELECT sno from sc GROUP BY sno HAVING count(cno) =2);
-- 13. 查询没有学全所有课程的同学的信息
SELECT count(*) from course
SELECT sno,sname from student WHERE sno in(SELECT sno from sc group by sno having count(Cno) < (SELECT count(*) from course));
-- 14. 查询选修了全部课程的学生信息
SELECT sno,sname from student WHERE sno in(SELECT sno from sc group by sno having count(Cno) = (SELECT count(*) from course));
-- 15. 查询所有课程成绩均小于60分的学号、姓名
SELECT sno,sname from student WHERE sno in(SELECT sno from sc where score <60)
UNION all
SELECT sno,sname from student WHERE sno not in(SELECT sno from sc);
-- 16. 查询课程编号为 01 且课程成绩在 80 分以上的学生的学号和姓名
SELECT sno,sname from student WHERE sno in(SELECT sno from sc where cno= '01' and score >80)
-- 17. 查询学过「张三」老师授课的同学的信息
SELECT sno,sname from student WHERE sno in(SELECT sno from sc where cno in(select cno from course where Tno in(SELECT tno from teacher WHERE Tname = '张三')))
-- 18. 查询没学过"张三"老师讲授的任一门课程的学生姓名
SELECT sno,sname from student WHERE sno not in(SELECT sno from sc where cno in(select cno from course where Tno in(SELECT tno from teacher WHERE Tname = '张三')))
-- 19. 查询至少有一门课与学号为" 01 "的同学所学相同的同学的信息
SELECT sno,sname from student WHERE sno in(SELECT  sno from sc where Cno in(SELECT Cno from sc where Sno = '01'))
-- 20. 查询和" 01 "号的同学学习的课程完全相同的其他同学的信息

SELECT sno,sname from student WHERE sno in(SELECT  sno from sc where Cno in(SELECT Cno from sc where Sno = '01'))
-- 21. 查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩
-- 22. 检索" 01 "课程分数小于 60，按分数降序排列的学生信息
-- 23. 查询不及格的课程及学生名，学号，按课程号从大到小排列
-- 24. 查询课程名称为「数学」，且分数低于 60 的学生姓名和分数
-- 25. 查询平均成绩大于等于 85 的所有学生的学号、姓名和平均成绩
-- 26. 查询不同老师所教不同课程平均分从高到低显示
-- 27. 查询平均成绩大于等于 60 分的同学的学生编号和学生姓名和平均成绩
-- 28.查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
-- 29. 查询同名同性学生名单，并统计同名同性人数
-- 30. 查询所有学生的课程及分数情况（存在学生没成绩，没选课的情况）
-- 31. 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩(没成绩的显示为 null )
-- 32. 查询存在" 01 "课程但可能不存在" 02 "课程的情况(不存在时显示为 null )
-- 33. 查询任何一门课程成绩在 70 分以上的姓名、课程名称和分数
-- 34. 查询" 01 "课程比" 02 "课程成绩高的学生的信息及课程分数
-- 37. 按各科成绩进行排序，并显示排名，Score 重复时保留名次空缺

select *, RANK() over(PARTITION by  cno order by score desc) as ranking from sc;