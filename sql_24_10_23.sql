show databases;

select database();

use TCS;
show tables;

select students.id, name, class, subject, marks
from students 
join marks
on students.id = marks.id;
select students.id, name, class, subject, marks
from students, marks
where students.id = marks;

select students.id, name, class , subject, marks
from students
inner join marks
on students.id = marks.id;

select s.id, name, class, subject, marks
from students s
left join marks m
on s.id = m.id;

select s.id, name, class, subject, marks
from students s
right join marks m
on s.id = m.id;

select s.id, name, class, marks
from students s 
left join marks m
on s.id = m.id
union 
select s.id, name, class, marks
from students s
right join marks m
on m.id = s.id;

create user "sanj@123" identified by "pass@123";
grant select on TCS.* to "sanj@123";
flush privileges;
show grants for "sanj@123";
revoke select on TCS.* from "sanj@123";
show grants for "sanj@123";

drop user "sanj@123";

show tables;
drop table employee;

show tables;
use TCS;
show tables;
drop table employee;
show tables;
create table employee(
emp_ID int,
emp_NAME varchar(50),
Dept_Name varchar(50));

describe employee;

alter table employee add column Salary int;
describe employee;   

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
COMMIT;

select * from employee;

select DEPT_NAME, max(salary) from employee group by DEPT_NAME;

select Dept_Name from employee;

select e.*,
min(salary)  over(partition by DEPT_NAME) as Max_salary 
from employee e;


select e.* , 
round(avg(salary) over(partition by Dept_Name), 2) as Average_salary
from employee e;


select e.*,
row_number() over(partition by Dept_Name) as rn
from employee e;

select e.*,
row_number() over(partition by DEPT_NAME) as rn
from employee e;

select * from (select e.*,
row_number() over(partition by Dept_Name) as rn
from employee e) as x
where x.rn<3;

select * from (select e.*,
row_number() over(partition by DEPT_NAME order by emp_ID) as rn
from employee e) as x
where x.rn<3;

select * from (select e.*,
rank() over(partition by DEPT_NAME order by SALARY desc) as rnk
from employee e) as x
where x.rnk<=3;

select * from (select e.*,
dense_rank() over(partition by DEPT_NAME order by SALARY desc) as dsrnk
from employee e) as x
where x.dsrnk<3;

select e.*,
row_number() over(partition by DEPT_NAME order by salary desc) as rn,
rank() over(partition by DEPT_NAME order by SALARY desc) as rnk,
dense_rank() over(partition by DEPT_NAME order by SALARY desc) as dsnk
from employee e;

select database();
use TCS;
select database();

show tables;

select e.*,
lag(salary) over(partition by Dept_Name order by emp_ID) as previous_salary,
case
when e.salary> lag(salary) over(partition by Dept_Name order by emp_ID)  then  "Higher than previous employee"
when e.salary < lag(salary) over(partition by Dept_Name order by emp_ID) then "Lower than Previous employee"
when e.salary = lag(salary) over(partition by Dept_Name order by emp_ID) then "Same as Previous employee"
end as "salary_range"
from employee e;  

select e.*,
lag(salary) over(partition by Dept_Name order by emp_ID) as Previous_salary,
case 
when e.salary > lag(salary) over(partition by Dept_Name order by emp_ID) then "Higher than previous one"
when e.salary < lag(salary) over(partition by Dept_Name order by emp_ID) then "lower than previous one"
else  "same as previous one"
end as salary_range
from employee e;

select e.*,
lead(salary) over(partition by Dept_Name order by emp_ID) as next_employee_salary,
lag(salary) over(partition by Dept_Name order by emp_ID) as previous_salary,
case 
when e.salary > lead(salary) over(partition by Dept_Name order by emp_ID) then "higher than next one"
when e.salary < lead(salary) over(partition by Dept_Name order by emp_ID) then "lower than next one"
else "same as next one"
end as salary_next_range
from employee e;

create table product(
product_category varchar(255),
brand varchar(255),
product_name varchar(255),
price int );

insert into product 
values
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

select * from product;

use TCS;
select * from product;

select p.*,
first_value(product_name) over(partition by product_category order by price desc) as most_expensive
from product p;

select p.*,
first_value(product_name) over(partition by product_category order by price asc) as least_expensive 
from product p;

select p.*,
last_value(product_name) over(partition by product_category order by price desc
range between unbounded preceding and unbounded following) as least_expensive
from product p; 

select p.*,
last_value(product_name) over(partition by product_category order by price desc
rows between 2 preceding and 2 following) as least_expensive
from product p;

select p.*,
last_value(product_name) over(partition by product_category order by price desc
range between unbounded preceding and current row) as least_expensive
from product p;

select p.*,
first_value(product_name) over(partition by product_category order by price desc) as most_expensive
from product p; 


select database();
use tcs;
show tables;

select * from product;

select p.*,
first_value(product_name) over(partition by product_category order by price desc) as most_expensive,
last_value(product_name) over(partition by product_category order by price desc 
range between unbounded preceding and unbounded following)
as least_expensive
from product p;

select * ,
last_value(product_name) over(partition by product_category order by price desc
rows between 2 preceding and 2 following)
from product
where product_category = "Phone";

select p.*,
first_value(product_name) over w as most_expensive,
last_value(product_name) over w as least_expensive
from product p
where product_category = "Phone"
window w as (partition by product_category order by price desc 
range between unbounded preceding and unbounded following);


select *,
nth_value(product_name, 2) over(partition by product_category order by price desc)
from product;


select *,
nth_value(product_name, 2) over w as second_most_expensive
from product 
window w as (partition by product_category order by price desc
range between unbounded preceding and unbounded following);

select x.product_name,
case when x.buckets = 1 then "most_expensive"
when x.buckets = 2 then "mid_range"
when x.buckets = 3 then "least_expensive"
end as price_range
from 
(select *,
ntile(3) over(order by price desc) as buckets
from product
where product_category = "Phone")
as x;


select x.product_name,
case when x.buckets = 1 then "most_expensive"
when x.buckets = 2 then "mid_range"
else "cheapest"
end as price_range from
(select *,
ntile(3) over(order by price desc) as buckets
from product
where product_category = "phone") as x;


select x.product_name, x.cume_disc_per from (select *,
cume_dist() over(order by price desc) as cume_distribution,
concat(round(cume_dist() over(order by price desc)*100,2), '%')  as cume_disc_per
from product) as x
where x.cume_disc_per<=30;

select x.product_name, x.percent_rank_per from 
(select *, 
percent_rank() over(order by price desc) as percent_ranking,
concat(round(percent_rank() over(order by price desc)*100,2),"%") as percent_rank_per
from product) as x
where x.product_name = "Galaxy Z Fold 3";






















