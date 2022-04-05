/* -------------------------------------------------------------------------------- Assignment 1 - part 1 ----------------------------------------------------------------------- */
-- HR Database Exercises - Solution

use hr;  
show tables;
select * from employees;
select * from departments;
select* from emp_details_view;
select * from jobs;
select * from countries;
select* from locations;


-- Queries
-- 1 .Write a query to display to dispalys the names( first_name,last_name) using alias name "First Name","Last Name"
    select first_name as "First Name",last_name as "Last Name" from employees;

-- 2.Write a query to get unique department ID from employee table.
    select distinct department_id from employees;
    
-- 3. Write a query to get all employee details from the employee table order by first name, descending
	select * from employees order by first_name DESC;
    
-- 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is 
-- calculated as 15% of salary)
select first_name,last_name,salary, (15/100*salary) as PF from employees;


-- 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of 
-- salary
	select employee_ID ,first_name,last_name , salary from employees
    order by salary ASC;
    
-- 6. Write a query to get the total salaries payable to employees
select sum(salary) as total_salaries_payable_to_emp from employees;

-- 7. Write a query to get the maximum and minimum salary from employees table
	select max(salary) as Maximum_salary,min(salary) as Minimum_salary from employees;
    
-- 8. Write a query to get the average salary and number of employees in the employees table
	 select avg(salary) as Average_salary,count(*) as Number_of_emp from employees;

-- 9. Write a query to get the number of employees working with the company
	select count(*) as Working_emp from employees;

-- 10. Write a query to get the number of jobs available in the employees table
	  select count(distinct job_id) from employees;
      
-- 11. Write a query get all first name from employees table in upper case
	  select upper(first_name) as "FIRST NAME" from employees;
      
-- 12. Write a query to get the first 3 characters of first name from employees table
	 select first_name, left(first_name,3) from employees;
	
-- 13. Write a query to get first name from employees table after removing white spaces from both side.
  select first_name,trim(first_name) from employees;
	
-- 14. Write a query to get the length of the employee names (first_name, last_name) from employees table
	 select first_name, last_name, length(first_name) ,length(last_name),length(first_name)+length(last_name) from employees;
      -- or 
      select concat(first_name,last_name) as Name, length(concat(first_name,last_name)) as length from employees;
      
-- 15. Write a query to check if the first_name fields of the employees table contains numbers.
     select * from employees where first_name regexp '[0-9]';
	
-- 16. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
-- not in the range $10,000 through $15,000
   select first_name,last_name,salary from employees where salary not between 10000 and 15000;
   
-- 17. Write a query to display the name (first_name, last_name) and department ID of all employees in 
-- departments 30 or 100 in ascending order
    select first_name,last_name,department_id from employees where department_id = 30 or department_id = 100
    order by department_id ASC;
   --  or
   Select first_name,last_name,department_id from employees where department_id in (30,100)
   order by department_id ASC;

-- 18. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
-- not in the range $10,000 through $15,000 and are in department 30 or 100
   select first_name,last_name,salary,department_id 
   from employees 
   where  salary not between 10000 and 15000 and department_id in (30,100);
   
   
-- 19. Write a query to display the name (first_name, last_name) and hire date for all employees who were 
-- hired in 1987
     select first_name,last_name,hire_date from employees where year(hire_date) = 1987;
     
-- 20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
     select first_name,last_name from employees where first_name Like '%b%' or first_name Like '%c%';
     
-- 21. Write a query to display the last name, job, and salary for all employees whose job is that of a 
-- Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000

select last_name,job_id,salary 
from employees 
where job_id in('IT_PROG','SH_CLERK') and salary not in(4500,10000,15000);
    

select Count(job_id), job_id  from employees;
-- 22. Write a query to display the last name of employees whose names have exactly 6 characters
    select last_name from employees where length(last_name) = 6;
    
-- 23. Write a query to display the last name of employees having 'e' as the third character
    select last_name from employees where substring(last_name,3,1) = 'e';
    
    
-- 24. Write a query to get the job_id and related employee's id
-- Partial output of the query : 
-- job_id Employees ID
-- AC_ACCOUNT206
-- AC_MGR 205
-- AD_ASST 200
-- AD_PRES 100
-- AD_VP 101 ,102
-- FI_ACCOUNT 110 ,113 ,111 ,109 ,112

select job_id,group_concat(employee_id,' ') as 'Employees ID' from employees
group by job_id;

-- 25. Write a query to update the portion of the phone_number in the employees table, within the phone 
-- number the substring '124' will be replaced by '999'
  select phone_number ,replace(phone_number,'123','999') from employees where phone_number LIKE '%123%';
  
-- UPDATE employees 
-- SET phone_number = REPLACE(phone_number, '124', '999') 
-- WHERE phone_number LIKE '%124%';

-- 26. Write a query to get the details of the employees where the length of the first name greater than or 
-- equal to 8
  select* from employees where length(first_name)>= 8;
  
-- 27. Write a query to append '@example.com' to email field
select
    concat(lower(email),'@example.com') as mail_ID
from
    employees;

-- 28. Write a query to extract the last 4 character of phone numbers
  select right(phone_number,4) from employees;
  
-- 29. Write a query to get the last word of the street address
    select
    location_id,
    street_address,
    SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(street_address, ',', ' '),')',' '),'(',' '),' ',- 1) AS 'Last--word-of-street_address'
FROM
    locations;
     
-- 30. Write a query to get the locations that have minimum street length
    
SELECT * FROM locations
WHERE LENGTH(street_address) <= (SELECT  MIN(LENGTH(street_address)) 
FROM locations);


-- 31. Write a query to display the first word from those job titles which contains more than one words
SELECT job_title, SUBSTRING(job_title,1, INSTR(job_title, ' ')-1)
FROM jobs;

-- 32. Write a query to display the length of first name for employees where last name contain character 'c' 
-- after 2nd position
SELECT length(first_name), last_name FROM employees WHERE INSTR(last_name,'C') > 2;


-- 33. Write a query that displays the first name and the length of the first name for all employees whose 
-- name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the 
-- employees' first names.
select first_name, length(first_name) from employees where first_name Like 'A%' or first_name Like 'j%' or first_name Like 'M%'
order by first_name;

-- 34. Write a query to display the first name and salary for all employees. Format the salary to be 10 
-- characters long, left-padded with the $ symbol. Label the column SALARY
  SELECT first_name, LPAD(salary, 10, '$') SALARY FROM employees;

-- 35. Write a query to display the first eight characters of the employees' first names and indicates the 
-- amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in 
-- descending order of salary
  SELECT left(first_name, 8), REPEAT('$', FLOOR(salary/1000)) 'SALARY($)', salary FROM employees ORDER BY salary DESC;

-- 36. Write a query to display the employees with their code, first name, last name and hire date who hired 
-- either on seventh day of any month or seventh month in any year
select first_name,last_name,hire_date from employees where day(hire_date) = 7 or month(hire_date) = 7;



/* ----------------------------------------------------------------- Assignment 1 - Part 2 ---------------------------------------------------------------------------------------*/

-- Northwind Database Solution
 
   use northwind;
   select* from products;
-- 1. Write a query to get Product name and quantity/unit
    select productName ,Quantityperunit from products;
    
-- 2. Write a query to get current Product list (Product ID and name)
    SELECT ProductID, ProductName
     FROM Products
     WHERE Discontinued = 0
     ORDER BY ProductName;
   
-- 3. Write a query to get discontinued Product list (Product ID and name)
SELECT ProductID, ProductName
FROM Products
WHERE Discontinued = 1
ORDER BY ProductName;

-- 4. Write a query to get most expense and least expensive Product list (name and unit price)
 select productName, unitPrice from Products order by unitPrice DESC;
 
-- 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20
   select ProductID ,ProductName,UnitPrice from Products where unitprice< 20 Order by UnitPrice DESC;
   
-- 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25
  select productID , ProductName,UnitPrice from Products where UnitPrice between 15 and 25 order by UnitPrice DESC;
  
-- 7. Write a query to get Product list (name, unit price) of above average price
     select ProductName,UnitPrice from Products where unitprice > (select avg(unitprice) from products) order by unitprice;
     
-- 8. Write a query to get Product list (name, unit price) of ten most expensive products
     select ProductName,UnitPrice from Products  order by UnitPrice DESC limit 10;
     
-- 9. Write a query to count current and discontinued products
select count(ProductName) from Products group by discontinued;

-- 10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity 
-- on order
   select  ProductName,unitsInStock,unitsOnOrder from Products where  (UnitsInStock<UnitsOnOrder);
   
  
     
   
   