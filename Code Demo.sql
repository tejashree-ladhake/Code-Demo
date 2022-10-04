DROP TABLE department;
DROP TABLE employee1;

CREATE TABLE department(
    DepartmentID INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(20)
);


CREATE TABLE employee1 (
    LastName VARCHAR(20),
    DepartmentID INT REFERENCES department(DepartmentID)
);

INSERT INTO department
VALUES (31, 'Sales'),
       (33, 'Engineering'),
       (34, 'Clerical'),
       (35, 'Marketing');

INSERT INTO employee1
VALUES ('Rafferty', 31),
       ('Jones', 33),
       ('Heisenberg', 33),
       ('Robinson', 34),
       ('Smith', 34),
       ('Williams', NULL);
 

SELECT * FROM employee1; --6 records
SELECT * FROM department; --4 records


--Inner Join
SELECT * FROM employee1 JOIN department
ON employee1.DepartmentID = department.DepartmentID;
--Left Join
SELECT * FROM employee1 LEFT JOIN department
ON employee1.DepartmentID = department.DepartmentID;
SELECT * FROM employee1 LEFT JOIN department
ON employee1.DepartmentID = department.DepartmentID
WHERE employee1.DepartmentID IS NULL;
--Right Join
SELECT * FROM department RIGHT JOIN employee1
ON employee1.DepartmentID = department.DepartmentID;
--Full Join
SELECT *
FROM department FULL JOIN employee1
ON employee1.DepartmentID = department.DepartmentID;
SELECT *
FROM department LEFT JOIN employee1
ON employee1.DepartmentID = department.DepartmentID
UNION
SELECT *
FROM department RIGHT JOIN employee1
ON employee1.DepartmentID = department.DepartmentID;


--cross join
SELECT * FROM employee1 CROSS JOIN  department ;

--natural join
SELECT * FROM employee1 NATURAL JOIN department ;

-- cross join on the common column is equal to natural join 
SELECT * FROM employee1 CROSS JOIN department USING(DepartmentID);
-- otherway round- if no common columns for natural join- then will do cross join
