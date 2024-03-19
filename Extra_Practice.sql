-- PostgreSQL Create Table Exercises

-- 1. Write a SQL statement to create a simple table 
-- countries including columns country_id,country_name and region_id.

create table countries(
	country_id varchar(3),
	country_name varchar(50),
	region_id varchar(10)
)

-- 2. Write a SQL statement to create the structure of a table dup_countries similar to countries.

create table dup_countries as(
	select * from countries
) with no data

-- 3. Write a SQL statement to create a duplicate copy of countries 
-- table including structure and data by name dup_countries.

create table dup_countries2 as(
	select * from countries
)

-- 4. Write a SQL statement to create a table countries set a constraint NULL.

create table countries2(
	country_id varchar(3) not null,
	country_name varchar(50)
)

-- 5. Write a SQL statement to create a table named jobs including columns job_id, job_title, 
-- min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.

create table jobs (
	job_id varchar(10) not null,
	job_title varchar(20) not null,
	min_salary decimal(6,0),
	max_salary decimal(6,0),
	check(max_salary<=25000)
);

-- 6. Write a SQL statement to create a table named countries including columns country_id, 
-- country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.

create table countries3(
	country_id varchar(3),
	country_name varchar(50),
	region_id varchar(3)
	check(country_name in('Italy','India','China'))
)

-- 7. Write a SQL statement to create a table named countries including columns country_id,country_name 
-- and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.

create table countries4 (
	country_id varchar(3),
	country_name varchar(50),
	region_id varchar(3),
	unique(country_id)
)

-- 8.  Write a SQL statement to create a table named jobs including columns job_id, 
-- job_title, min_salary and max_salary, and make sure that, the default value for 
-- job_title is blank and min_salary is 8000 and max_salary is NULL will be entered 
-- automatically at the time of insertion if no value assigned for the specified columns.

create table jobs1 (
	job_id varchar(10),
	job_title varchar(20) default '',
	min_salary decimal(6,0) default 8000,
	max_salary decimal(6,0) default null
)

-- 9. Write a SQL statement to create a table countries including columns country_id, 
-- country_name and region_id and make sure that the column country_id will be unique 
-- and store an auto-incremented value.

create table countries5 (
	country_id serial not null,
	country_name varchar(10),
	region_id varchar(3)
)

-- 10. Write a SQL statement to create a table countries including columns country_id, 
-- country_name and region_id and make sure that the combination of columns country_id 
-- and region_id will be unique.

create table countries6(
	country_id varchar not null unique,
	country_name varchar(20),
	region_id varchar(3),
	primary key(country_id, region_id)
)

-- 11. Write a SQL statement to create a table job_history including columns employee_id, 
-- start_date, end_date, job_id and department_id and make sure that, the employee_id 
-- column does not contain any duplicate value at the time of insertion and the foreign 
-- key column job_id contain only those values which exist in the jobs table.

create table job_history(
	employee_id varchar(10) unique,
	start_date date,
	end_date date,
	job_id varchar(10) not null,
	department_id varchar(3),
	foreign key (job_id) references jobs (job_id)
)

-- PostgreSQL Alter Table Exercises

-- 1. Write a SQL statement to rename the table countries to country_new.

alter table countries rename to country_new

-- 2. Write a SQL statement to add a column region_id to the table locations.

alter table locations add region_id int 

-- 3. Write a SQL statement to change the data type of the column region_id to text in the table locations.

alter table locations alter region_id type text

-- 4. Write a SQL statement to drop the column city from the table locations.

alter table locations drop city

-- 5. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.

alter table locations rename column state_province to state

-- 6. Write a SQL statement to add a primary key for the columns location_id in the locations table.

alter table locations add primary key (location_id)

-- 7. Write a SQL statement to add a primary key for a combination of columns location_id and country_id.

alter table locations add primary key (location_id,country_id)

-- 8. Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.

alter table locations drop constraint locations_pkey

-- 9. Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.

alter table job_history add foreign key(job_id) references jobs(job_id)

-- 10. Write a SQL statement to add a foreign key constraint named fk_job_id on job_id 
-- column of job_history table referencing to the primary key job_id of jobs table.

alter table job_history add constraint fk_job_id foreign key(job_id) references jobs(job_id)

-- 11. Write a SQL statement to drop the existing foreign key fk_job_id from job_history 
-- table on job_id column, which is referenced to the job_id of jobs table

alter table job_history drop contraint fk_job_id

-- PostgreSQL Update Table Exercises

-- 1. Write a SQL statement to change the email column of the employees table with 'not available' for all employees.

update employees set email='not available'

-- 2. Write a SQL statement to change the email and commission_pct column of 
-- the employees table with 'not available' and 0.10 for all employees.

update employees set email='not available',commission_pct=0.10

-- 3. Write a SQL statement to change the email and commission_pct column of the employees 
-- table with 'not available' and 0.10 for those employees whose department_id is 110.

update employees set email='not available',commission_pct=0.10 
where department_id = 110

-- 4. Write a SQL statement to change the email column of employees table with 'not available' 
-- for those employees whose department_id is 80 and gets a commission is less than 20%.

update employees set email='not available'
where department_id = 80 and commission_pct < 0.2

-- 5. Write a SQL statement to change the email column of the employees table with 
-- 'not available' for those employees who belongs to the 'Accounting' department.

update employees set email='not available'
where department_id = (
select department_id from departments where department_name = 'Accounting');
)

-- 6. Write a SQL statement to change the salary of an employee to 8000 whose ID is 105, if the existing salary is less than 5000.

update employees set salary=8000
where employee_id = 105 and salary < 5000

-- 7. Write a SQL statement to change the job ID of the employee which ID is 118 to SH_CLERK if the employee belongs to a department which ID is 30 and the existing job ID does not start with SH.

update employees set job_id = 'SH_CLERK'
where department_id = 30 and employee_id = 118
and not job_id like 'SH%'

-- 8. Write a SQL statement to increase the salary of employees under the department 40, 90 
-- and 110 according to the company rules that, the salary will be increased by 25% of the 
-- department 40, 15% for department 90 and 10% of the department 110 and the rest of the department will remain same.

update employees set salary = case department_id
when 40 then salary + (salary*.25)
when 90 then salary + (salary*.15)
when 110 then salary + (salary*.10)
else salary
end
where department_id in (40,50,60,70,80,90,110)