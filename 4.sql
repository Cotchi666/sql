-- basic queries 
use test;
SELECT 
    *
FROM
    employee;

-- find all employees ordered by salary
SELECT 
    *
FROM
    employee
ORDER BY salary DESC;

 -- find all employees ordered by sex then name
SELECT 
    *
FROM
    employee
ORDER BY sex , first_name , last_name;

 -- find  the first 5 employees in the table
 Select * from employee
 limit 5;
 
 -- find forename and surname mnames of all the employees in the table 
 select first_name as forename , last_name as surname
 from employee;
 
-- find ou\t all the different genders
-- distinct for not loopping value
select distinct branch_id
from employee;

-- function
-- find the number of female  employees born after 1970
select count(emp_id) from employee
where sex = 'F' and birth_day  > '1970-01-01' ;

-- find the average of all employee's salaries
select AVG(salary) from employee;

-- sum
select sum(salary) from employee;

-- find out how many males and females  there are?
select count(sex), sex
from test.employee
group by sex;

-- find the total sales of each salesman

select  SUM(total_sales), client_id
from works_with
group by client_id;

-- find all client 's  who are 'LLC'
SELECT * FROM client 
-- WHERE client_name LIKE '%LLC';
-- WHERE client_name REGEXP 'LLC$';
WHERE client_name  LIKE '%school%';
	
-- find any branch suppliers who are in the  label bussines
SElECT * 
FROM employee
-- WHERE supplier_name  lIKE  '% label%';
WHERE birth_day LIKE '____-10%';



-- UNION

SELECT first_name
FROM employee
UNION
SELECT branch_name
FROM branch
UNION 
SELECt client_name
FROM client;


-- find a list  of all clients & branch suppliers name
SELECT client_name , client.branch_id
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROm branch_supplier;

-- find a list of all money spent or earned by the company
-- take a value of instance entities in which the value has not loopping
SELECT  salary
FROM employee
UNION 
SELECT total_sales
FROM works_with;

select * from works_with;
select * from branch;
select * from employee;
select * from client;
INSERT  INTO branch VALUES(4, 'Buffalo', NULL, NULL);


-- find all branchés and the names of their managers;
select  employee.emp_id , employee.first_name, branch.branch_name
from employee
join branch
on employee.emp_id = branch.mgr_id;



-- find names of all employees who have
-- sold over 30,000 to a single client


SELECT 
    employee.last_name, employee.first_name
FROM
    employee
WHERE
    employee.emp_id IN (
		SELECT 
            works_with.emp_id
        FROM
            works_with
        WHERE
            works_with.total_sales > 30000);

-- find all clients who are handled by the branch
-- that Michael Scott manages
-- Assume you  know Michael's ID

Select client.client_name
from client
where client.branch_id = (
	select branch.branch_id
    from branch
    where branch.mgr_id = 102
    limit 1
);