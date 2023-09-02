-- creating and deleting databases

show databases;
select database();
create database HTML;
select database();
use html;
drop database html;
select database();
show databases;

-- creating and deleting tables
create database html;
select database();
use html;

create table students(
name varchar(255),
marks int(50));

show tables;
describe students;
drop table students;

show tables;

create table students(
name varchar(255),
marks int(50));

show tables;
-- alter/modify the tables

describe students;

alter table students add column roll_no int(40);
describe students;
alter table students add age varchar(255);
describe students;
alter table students drop marks;
describe students;
alter table students modify age int(60);
describe students;
drop table students;

describe students;

-- table constraints
create table students(
id int(50) not null unique primary key,
f_name varchar(255) not null unique default "unnamed",
l_name varchar(255),
age int(50) not null check(age>=50),
class int(60) not null);

describe students;

create table teacher(
id int not null unique primary key,
name varchar(50) not null default "unnamed",
age int not null,
class int not null);
show tables;

describe teacher;

-- insert records

insert into teacher(id, name, age, class)
values 
(1, 'mohit', 18, 12),
(2, 'rohit', 17, 11);

select * from teacher;

insert into teacher
values
(3, 'jatin', 14, 8),
(4, 'shweta', 19,12),
(5, 'prateek', 14, 8),
(6, 'vishnu', 12, 7),
(7, 'mahesh', 17, 10),
(8, 'aparna', 16, 11),
(9, 'jatin', 17, 11),
(10, 'rohit', 13, 8);

select * from teacher;

-- select statemnets

select * from teacher;
select name from teacher;
select name, id from teacher;
select class, age, id , name from teacher;

select distinct name from teacher;
select distinct name, class from teacher;

-- limit , offset, orderby

select * from teacher limit 3;
select * from teacher limit 3 offset 5;
select * from teacher order by class;
select * from teacher order by class desc;
select * from teacher order by class desc, age desc;

-- where clause
with abc as (select * from teacher) select * from abc where age>=15;
select * from teacher where class = 12;
select * from teacher where id = 5;
select * from teacher where age>15;
select * from teacher where name = 'jatin';

select * from teacher where class>=11 and age<18;

select * from teacher where class>=11 or age<18;
select * from teacher where not name = 'jatin';
select * from teacher where age between 13 and 17;
select * from teacher where name in ('rohit', 'jatin', 'aparna');
select * from teacher where name like "%a";
select * from teacher where name like "%a%";
select * from teacher where name like "%i_";
select * from teacher where name like "a%";
select * from teacher where name like "%ti%";


-- update and delete command

select * from teacher;

update teacher set class = 5 where id = 4;

select * from teacher;
update teacher set name = "sachin" , age = 40, class = 6 where id = 2;
select *  from teacher;
delete from teacher where id = 2;
select * from teacher;
update teacher set name = "sachin";

select * from teacher;
delete from teacher;

select * from teacher;

set sql_safe_updates = 1;

update teacher set name = 'rohit';

delete from teacher;

-- Aggregate functions

select name from teacher;
select distinct name from teacher;
select count(distinct  name) from teacher;
select min(age) as minimum_age from teacher;
select max(age) from teacher;
select sum(age) from teacher;
select avg(age) from teacher;

-- groupby clause

select * from teacher;
select class from teacher group by class;
select class, count(class) count_number from teacher group by class;
select class, count(name) as count_name from teacher group by class having count_name>2;

create table marks(
id int not null,
subject varchar(255) not null,
marks int not null,
primary key (id,subject));

show tables;

insert into marks
values
(9, 'maths', 89),
(2, 'english', 75),
(1, 'maths', 91),
(4, 'science', 97),
(10, 'computer', 83),
(1, 'english', 55),
(3, 'maths', 58);

select * from marks;

select teacher.id, name, class, subject, marks
from teacher, marks
where teacher.id = marks.id;

select teacher.id, name, class, subject, marks
from teacher
join marks
on teacher.id = marks.id;

select teacher.id, name, class, subject, marks
from teacher
left join marks
on teacher.id = marks.id
union all
select teacher.id, name, class, subject, marks
from teacher
right join marks
on teacher.id = marks.id;

flush privileges;
create user "sachin@123" identified by "pass@321";

select user();
grant select, update, delete on html.* to "sachin@123";

flush privileges;

show grants for "sachin@123";

revoke select, update on html.* from "sachin@123";

show grants for "sachin@123";
revoke delete on html.* from "sachin@123";

show grants for "sachin@123";
drop user "sachin@123";

show grants for "sachin@123";


select user from user;


-- window functions
drop table employee;

create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

describe employee;
select * from employee;

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);

select * from employee;
commit;

select dept_name, max(salary) from employee group by dept_name;
select max(salary) from employee;

select e.*,
max(salary) over(partition by dept_name order by salary desc) as max_salary
from employee as e;

select e.*,
row_number() over(partition by dept_name) as rn
from employee as e;

-- Fetch the first 2 employees from each department to join the company.

select * from(select e.*,
row_number() over(partition by dept_name order by emp_id) as rn
from employee e) as x
where x.rn<=2;

-- Fetch the top 3 employees in each department earning the max salary.
select e.*,
rank() over(partition by dept_name order by salary desc)
from employee e;

select * from (select e.*,
dense_rank() over(partition by dept_name order by salary desc) as rnk
from employee e) as x
where x.rnk<3;

select e.*,
row_number() over(partition by dept_name order by salary desc) as rn,
rank() over(partition by dept_name order by salary desc ) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as drnk 
from employee e;

select e.*,
lag(salary) over(partition by dept_name) as previous_salary
from employee e;

select e.*,
lead(salary) over(partition by dept_name order by emp_id) as next_emp_salary,
lag(salary) over(partition by dept_name order by emp_id) as previous_emp_salary
from employee e;

-- fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.

select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary,
case 
when e.salary > lag(salary) over(partition by dept_name order by emp_id) then "Higher salary"
when e.salary<lag(salary) over(partition by dept_name order by emp_id) then "lower"
else "same" end as salry_comparison
from employee e;

drop table product;

select database();
use html;
show tables;

CREATE TABLE product
( 
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);

INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);
commit;

select * from product;

-- FIRST_VALUE 
-- Write query to display the most expensive product under each category (corresponding to each record)

select max(price) from product;

select p.*,
first_value(product_name) over(partition by product_category order by price desc) as most_expensive_product
from product p;

select p.*,
first_value(product_name) over(partition by product_category order by price desc) as most_expensive
from product p;

select p.*,
first_value(product_name) over(partition by product_category order by price asc) as least_expensive 
from product p;

 -- last values
 
 select p.*,
 last_value(product_name) over(partition by product_category order by price desc
 range between unbounded preceding and  unbounded following) 
 from product p;
 
 
 select p.*,
 last_value(product_name) over(partition by product_category order by price desc
 rows between unbounded preceding and unbounded following) 
 from product p;
 
 
 -- NTILE
-- Write a query to segregate all the expensive phones, mid range phones and the cheaper phones.

 
 
  select p.*,
 last_value(product_name) over(partition by product_category order by price desc
 rows between 2 preceding and 2 following) 
 from product p;
 
 select p.*,
 first_value(product_name) over(partition by product_category order by price desc) as most_expensive,
 last_value(product_name) over(partition by product_category order by price desc 
 range between unbounded preceding and unbounded following) as leat_expensive
 from product p
 where product_category = 'phone';
 
 
 -- another way of writing the same query 
 
 select p.*,
 first_value(product_name) over w as most_expensive,
 last_value(product_name) over w as least_expensive
 from product p
where product_category = 'phone'
window w as (partition by product_category order by price desc
range between unbounded preceding and unbounded following);

-- NTH_VALUE 
-- Write query to display the Second most expensive product under each category.


select p.*,
nth_value(product_name, 3) over w as second_most
from product p
window w as (partition by product_category order by price desc);
 
 -- NTILE
-- Write a query to segregate all the expensive phones, mid range phones and the cheaper phones. 
 
 select * ,
ntile(3) over() as "phone_range"
from product p;


select x.product_name , x.price,
case 
	when x.buckets = 1 then "expenssive_phones"
	when x.buckets = 2 then "mid_range_phones"
	else "cheaper_phones" end as phone_range
 from 
	(select p.* ,
	ntile(3) over(order by price desc) as buckets
	from product p
	where product_category = 'phone') as x;

 

-- CUME_DIST (cumulative distribution) ; 
/*  Formula = Current Row no (or Row No with value same as current row) / Total no of rows */

-- Query to fetch all products which are constituting the first 30% 
-- of the data in products table based on price.

select product_name, cum_dist_percentage from 
	(select p.*,
	cume_dist() over(order by price desc)  as cum_distribution,
	concat(round((cume_dist() over(order by price desc))*100,2),"%")  as cum_dist_percentage
	from product p) as x
where x.cum_distribution<=0.3;


-- PERCENT_RANK (relative rank of the current row / Percentage Ranking)
/* Formula = Current Row No - 1 / Total no of rows - 1 */

-- Query to identify how much percentage more expensive is "Galaxy Z Fold 3" when compared to all products.


select product_name, per_rank, percent_rankk from 
(select *,
percent_rank() over(order by price desc) as per_rank,
concat(round((percent_rank() over(order by price desc))*100,2), "%") as percent_rankk
from product) as x
where x.product_name = "Galaxy Z Fold 3";



















 






