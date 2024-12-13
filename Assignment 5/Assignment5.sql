-- Question: 
--Create a simple view named vw_employee_details that displays the first name, last name, and 
--department name of employees. 

create view vw_employee_details (firsrname , lastname , departmentname) 
as (
select e.Fname , e.Lname , d.Dname
from EMPLOYEE e join DEPARTMENT d on e.Dno = d.Dnumber
);

--Question: 
--Modify the existing view vw_work_hrs to only include employees working in department 
--number 5.
CREATE OR REPLACE VIEW vw_employee_details (firstname, lastname, departmentname, hours) 
AS 
SELECT e.Fname, e.Lname, d.Dname, o.Hours
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON e.Dno = d.Dnumber 
JOIN WORKS_ON o ON o.Essn = e.SSN
WHERE d.Dnumber = 5;



--Question: 
--Create a view named vw_high_status_suppliers to display all suppliers with a status greater 
--than 15, and ensure that any updates or inserts through the view still meet the status condition.

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    contact_email VARCHAR(255),
    phone_number VARCHAR(20),
    status int NOT NULL
);


create view vw_high_status_suppliers 
as 
select * from suppliers s
where  s.status >15
 WITH CHECK OPTION;
