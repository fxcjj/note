
/**
1、用两种方式根据部门号从高到低，工资从低到高列出每 
个员工的信息
**/
SELECT * FROM vic_employee ORDER BY dept_id DESC, salary


/**
2、列出各个部门中工资高于本部门的平均工资的员工数和
部门号，并按部门号排序
**/
SELECT AVG(salary) FROM vic_employee GROUP BY dept_id;
SELECT e.id, e.name, e.salary, e.dept_id  edept_id FROM vic_employee e
WHERE salary > (SELECT AVG(salary) FROM vic_employee WHERE dept_id = edept_id) ORDER BY edept_id;

/**
3、效率低的一个语句，仅供学习参考使用（在 group by 之后不能使用 where ，只能使用 
having ，在 group by 之前可以使用 where ，即表示对过滤后的结果分组）： 
SELECT e.id, e.name, e.salary, e.dept_id edept_id
FROM vic_employee e WHERE salary > (SELECT AVG(salary) FROM vic_employee GROUP BY dept_id HAVING dept_id = edept_id); 
**/
SELECT COUNT(*) 员工数, edept_id 部门ID
FROM (
SELECT e.id, e.name, e.salary, e.dept_id edept_id
FROM vic_employee e
WHERE salary > (SELECT AVG(salary) FROM vic_employee WHERE dept_id = edept_id)
) AS t GROUP BY edept_id;

/**
4、另外一种方式：关联查询**/
SELECT a.id, a.name, a.salary, a.dept_id edept_id
FROM vic_employee a,
	(SELECT dept_id, AVG(salary) avgsal FROM vic_employee GROUP BY dept_id) b
WHERE a.dept_id = b.dept_id AND a.salary > b.avgsal


/**
5、查询出每个班各科成绩最高的同学名称、课程名称、分数、班级
表结构
t_class
	class_id
	class_name
t_stu
	stu_id 
	stu_name
    class_id
t_score
	score_id
    course
    score 
	stu_id
**/
SELECT class_name, stu_name, course, score FROM
(
select cla.class_name, stu.stu_name, sco.course, sco.score
FROM t_stu stu
inner JOIN
t_class cla
on stu.class_id = cla.class_id
inner JOIN
t_score sco
on sco.stu_id = stu.stu_id
-- 按照班级名称、课程名称、分数排序
order by cla.class_name, sco.course, sco.score desc) as p
-- 分组一下，正好取第一条
GROUP BY class_name, course


/**
6、查询姓名重复
**/
select count(username) as '重复次数', username as FIRST from user group by username having count(username) > 1 order by username desc;


/**
7、删除多余数据，留下rowid最大的，有主键
**/
delete from user
where user_id in (select user_id from user group by username having count(*) > 1)
and rowid not in (select max(user_id) from user group by username having count(*) > 1);

/**
8、删除重复username记录，保留id最小的
**/
delete from stu where id not in  
(select min(id) from stu group by username) 

-- [Err] 1093  You can't specify target table 'stu' for update in FROM clause

Note: mysql中不能这么用，在mysql中，IN语句查询出来的结果，再update同一张表！

修改后SQL
delete from stu where id not in  
(select t.id from
(select min(id) id from stu group by username) as t
)

将它作为子集
select t.id from
(select min(id) id from stu group by username) as t
那么select和update的就不是同一张表


/**
9、删除username,gender,age重复的记录，保留一条，无主键
**/
第一种方法，如果数据比较多，这样好吗？
-- 想要的结果
SELECT DISTINCT username, gender, age from t_joke;
-- 创建一个表
CREATE TABLE temp (SELECT DISTINCT username, gender, age from t_joke);
-- 删除原表记录
DELETE FROM t_joke;
-- 将新表的数据插入到原表中
insert into t_joke (select username, gender, age from temp);

第二种方法
TODO




Chapter2

表结构
	t_course
		course_id //课程ID
		name //课程名称
		teacher_id //教师ID
	
	t_score
		stu_id //学生ID
		course_id //课程ID
		score //分数
	
	t_teacher
		teacher_id //教师ID
		name //教师姓名
	
	t_student
		stu_id //学生ID
		name //学生姓名
		gender //性别
		age //年龄
		
/**
1、所有学生的成绩和课程
**/
SELECT * 
FROM
t_student stu
INNER JOIN
t_score sco
ON stu.stu_id = sco.stu_id
INNER JOIN
t_course c
ON sco.course_id = c.course_id;

/**
2、查询课程“1”分数比课程“2”分数高的同学信息、课程分数
**/
-- select stu.stu_id as 学生ID,stu.name 姓名, a.score 1课程的分数, b.score 2课程的分数 
select *
from t_student stu, t_score a, t_score b
-- t_student与t_score内连接，返回学生的每科分数
where stu.stu_id = a.stu_id
-- 拿上次得到的结果，再与t_score表内连接，得到每一科（语）与其他所有科（语数外）结合的结果
and stu.stu_id = b.stu_id
-- 过滤课程“1”
and a.course_id = 1
-- 过滤课程“2”
and b.course_id = 2
-- 过滤出课程“1”分数大于课程“2”分数的记录
and a.score > b.score


/**
3、查询课程“1”分数比课程“2”分数高的同学信息、课程分数，
但是，可能存在课程“2”为空的情况，结果中显示出来
**/
SELECT * 
FROM
t_student stu
LEFT JOIN
t_score a
-- 第一次左连接，显示所有学生的课程“1”信息，无课程“1”则显示NULL
ON stu.stu_id = a.stu_id and a.course_id = 1
LEFT JOIN
t_score b
-- 第二次左连接，显示上次查询结果（课程“1”的学生）加课程“2”的信息，无课程“2”则显示NULL
ON stu.stu_id = b.stu_id and b.course_id = 2
-- 课程“1”大于课程“2”的学生，课程“2”为null时为0
where a.score > ifnull(b.score, 0);


/**
4、查询平均分大于60分的同学
**/
SELECT stu.stu_id 学号, stu.name 姓名, sum(a.score) 总分, cast(avg(a.score) as decimal(18, 2)) 平均分数
FROM
t_student stu
inner JOIN
t_score a
ON stu.stu_id = a.stu_id
group by stu.stu_id
HAVING cast(avg(a.score) as decimal(18, 2)) >= 60
order by stu.stu_id desc;


/**
5、查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩
**/
SELECT stu.stu_id 学号, stu.name 姓名, count(a.course_id) 选课总数, sum(a.score) 总分
FROM
t_student stu
INNER JOIN 
t_score a
ON stu.stu_id = a.stu_id
group by stu.stu_id
order by stu.stu_id desc;


/**
6、查询“李”姓老师的数量
**/
select count(name) from t_teacher where name like '吉%';
select count(name) from t_teacher where left(name, 1) = '吉';


/**
7、查询学过“吉泽明步”老师授课的同学信息
**/
SELECT DISTINCT stu.*, t.name teacher
FROM
t_student stu
INNER JOIN
t_score s
ON stu.stu_id = s.stu_id
INNER JOIN
t_course c
ON s.course_id = c.course_id
INNER JOIN
t_teacher t
on c.teacher_id = t.teacher_id
where t.name = '吉泽明步';


/**
8、查询没学过“吉泽明步”老师授课的同学信息
**/
select * from t_student stu
where stu.stu_id not in
(
	select distinct s.stu_id 
	from t_score s, t_course c, t_teacher t
	where s.course_id = c.course_id
	and c.teacher_id = t.teacher_id
	and t.name = '吉泽明步'
);

/**
9、查询学过课程“1”和课程“2”的同学
**/
-- 方法1
select * from 
t_student stu
inner join
t_score s
on stu.stu_id = s.stu_id
and s.course_id = 1
and exists (
	select 1 from t_score s1 where stu.stu_id = s1.stu_id and s1.course_id = 2
);

-- 方法2
select * from 
t_student stu
inner join
t_score s
on stu.stu_id = s.stu_id
and s.course_id = 2
and exists (
	select 1 from t_score s1 where stu.stu_id = s1.stu_id and s1.course_id = 1
);

-- 方法3
select s.* from t_student s where s.stu_id in (
	select * from (
		select distinct stu_id from t_score s where s.course_id = 1
		union all
		select distinct stu_id from t_score s where s.course_id = 2
	) t group by stu_id having count(1) = 2
) order by s.stu_id desc;

/**
10、查询学过课程“1”但没学过课程“2”的同学
**/
-- 方法1
select * from 
t_student stu
inner join
t_score s
on stu.stu_id = s.stu_id
and s.course_id = 1
and not exists (
	select 1 from t_score s1 where s1.stu_id = stu.stu_id and s1.course_id = 2
);

-- 方法2
select * from 
t_student stu,
t_score s
where stu.stu_id = s.stu_id
and s.course_id = 1
and stu.stu_id not in (
	select s1.stu_id from t_score s1 where s1.stu_id = s.stu_id and s1.course_id = 2
);

/**
11、查询2门及2门以上不及格（<70）课程的同学姓名、平均分、不及格课程数量
**/
-- 方法1
-- sum(s.score<70),表示符合条件的个数，即按照name分组后，score<70的个数
select stu.name, avg(s.score), sum(s.score<70) c
from t_student stu
inner join
t_score s
on stu.stu_id = s.stu_id
group by name
having c >= 2;

-- 方法2
select stu.*, cast(avg(s.score) as decimal(18,2)) average
from t_student stu, t_score s 
where stu.stu_id = s.stu_id
and stu.stu_id in 
(
	-- 查询出二门及二门以上不及格课程的同学ID
	select s.stu_id
	from t_score s 
	where s.score < 60 
	group by s.stu_id
	having count(1) >= 2
) group by stu.stu_id;


/**
12、查询没有学全所有课程的同学的信息
**/
select *
from t_student stu
-- left join //查询出没有学全所有课程或者没有学过的课程的同学的信息
inner join
t_score s
on stu.stu_id = s.stu_id
group by name, gender, birthday
having count(s.course_id) < (select count(course_id) from t_course);


/**
13、查询至少有一门课与学号为“1”的同学所学相同的同学的信息
**/
select distinct stu.* 
from t_student stu, t_score s
where stu.stu_id = s.stu_id
and s.course_id in (
	select s1.course_id from t_score s1 where s1.stu_id = '1'
)
and stu.stu_id <> '1';


/**
14、查询和“1”号同学学习的课程完全相同的其他同学的信息
**/
select * from t_student where stu_id in
(select distinct s1.stu_id from t_score s1 where s1.stu_id <> '1' 
and s1.course_id in (
	-- 查询“1”号同学学习的课程id
	select distinct s.course_id from t_score s where s.stu_id = '1'
)
-- 以stu_id进行分组
group by s1.stu_id
-- 查询的stu_id个数必须等于“1”号同学学习的课程数量
having count(1) = (
	-- 查询“1”号同学学习的课程数量
	select count(1) from t_score s where s.stu_id = '1'
));


/**
15、查询没学过“吉泽明步”老师讲授的任一门课的学生信息
**/
-- my
select * from 
t_student stu
where stu.stu_id not in (
	-- “吉泽明步”老师教过的学生
	select s.stu_id
	from t_score s
	where s.course_id in(
		select cs.course_id
		from
		t_course cs
		inner join
		t_teacher t
		on cs.teacher_id = t.teacher_id
		where t.name = '吉泽明步'
	)
	group by s.stu_id
);

-- answer
select * from t_student stu where stu_id not in (
	select s.stu_id from t_score s, t_course cs, t_teacher t
	where s.course_id = cs.course_id
	and cs.teacher_id = t.teacher_id
	and t.name <> '吉泽明步'
	group by s.stu_id
);


/**
16、查询“1”课程且分数小于60的同学信息，按分数降序排列
**/
select *
from t_student stu, t_score s 
where stu.stu_id = s.stu_id
and s.course_id = '1'
and s.score < 60
order by s.score desc;


/***
17、按平均成绩由高到低显示所有学生的所有课程的成绩以及平均成绩
**/
select stu.*, 
max(case cs.name when '语文' then s.score else null end) 语文,
max(case cs.name when '数学' then s.score else null end) 数学,
max(case cs.name when '英语' then s.score else null end) 英语,
cast(avg(s.score) as decimal(18, 2)) 平均成绩
from t_student stu, t_score s, t_course cs
where stu.stu_id = s.stu_id
and s.course_id = cs.course_id
group by stu.stu_id
order by 平均成绩 desc





























