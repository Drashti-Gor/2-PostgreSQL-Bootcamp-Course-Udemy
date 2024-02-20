-- difference between highest and lowest salaries

select
	job_id,
	max(salary),
	min(salary),
	max(salary) - min(salary) as "Difference"
from employees
group by job_id

-- get lowest paid salary by each manager

select
	manager_id,
	min(salary)
from employees
where manager_id is not null and manager_id != 0
group by manager_id
order by 2

-- average salary for each department with more than 10 employees

select
	department_id,
	avg(salary)
from employees
group by 1
having count(*) > 10

-- list maximum salary of each post for maximum salary is at or above $5000

select
	job_id,
	max(salary) as "Max salary"
from employees
group by job_id
having max(salary) >= 5000
order by 1

-- get the job_id and employee_ids within each job_id group

select
	job_id,
	array_agg(employee_id) as "All Employee IDs"
from employees
group by 1
order by 1

-- get all employees and discard the last four characters from email

-- method 1
select
	employee_id,
	reverse(substr(reverse(email),5,length(email)))
from employees

-- method 2
select
	employee_id,
	substr(email,1,length(email)-4)
from employees

select
	first_name
from employees
where 
	first_name like 'A%' or
	first_name like 'C%' or
	first_name like 'M%'
order by 1

-- find letter 'c' in last name at 3rd or greater position

select 
	last_name
from employees
where position ('c' in last_name) > 2

-- update phone number column with '888' where the substring '123' is found

update employees
set phone_number = replace (phone_number,'123','888')

select * from employees
