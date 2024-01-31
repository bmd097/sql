/*
######### Data Types #######
Integer Data Types
	TinyInt 1byte
	SmallInt 2byte
	Int 4byte
	Bigint 8 byte
Decimal Data Types
	Decimal(P,S) 
		p = Precesion:: total number of decimal digits i.e. both left and right side of the decimal point. , 
		S = Scale::It allows right side digits of decimal point only
	Numeric(P,S)
Money Data Types
	Small Money 4 bytes
	Money 8 bytes
Date and Time
	Date, Time, DateTime
Character Data Types
	char(n) - fixed // non-unicode format 1 byte = 1 char
	varchar(n/max)
	text == varchar(8000)
	nchar() fixed // unicode format 2 byte = 1 char
	nvarchar() // unicode format
	ntext // unicode format
Binary Data types
	binary(n)
	varbinary(n)
	image

######### IDEA ##########
SQL -> 
	DDL
		DROP
		SP_RENAME
		CREATE
		ALTER
		TRUNCATE
	DML
		SELECT
		UPDATE
		DELETE
		INSERT
	TCL
		COMMIT 
		ROLLBACK
		SAVE TRANSACTION
	DCL
		GRANT
		REVOKE
*/

/*
+++ Data Defination Language

--CREATE DATABASE WordVoyager;

CREATE TABLE Coffee (
	coffee_id int primary key,
	coffee_name varchar(100)
);
CREATE TABLE EMP (EID INT IDENTITY (100, 1), ENAME VARCHAR 
(50)); // IDENTITY(seed,increment)
CREATE SYNONYM someTableSome FOR Coffee;
DROP SYNONYM someTableSome;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='tbl_name' and xtype='U')
    CREATE TABLE tbl_name (
        Name varchar(64) not null
    )
GO



ALTER TABLE Coffee ALTER COLUMN
coffe_name varchar(200);
ALTER TABLE Coffee 
ADD coffee_type varchar(100);
ALTER TABLE Coffee 
DROP COLUMN coffee_type;

SP_RENAME 'TableName.OldColumnName', 'NewColumnName', 'COLUMN';
SP_RENAME 'EMP', 'EMP1';

TRUNCATE TABLE Coffee; // permanent deletion
DROP TABLE Coffee;

SP_help Coffee; // See the structure of the table
SELECT * from sysobjects where xtype = 'u'; // View all tables in the current database

+++ Data Manipulating Language
INSERT INTO Coffee VALUES (1,'Latte'); // Explicit Method
INSERT INTO Coffee(coffee_id,coffee_name) VALUES (1,'Cappacino'); // Implicit Method
INSERT INTO AnotherCoffeeTable SELECT * FROM Coffee;


DELETE FROM Coffee; // delete everything temporaray
DELETE FROM Coffee where coffee_id = 1;

SELECT * FROM Coffee;
SELECT coffee_id AS id,coffee_name AS `name` FROM Coffee;
SELECT * FROM Coffee WHERE coffee_id = 1;

UPDATE Coffee SET coffee_name = 'Latte',coffee_type='light' where coffee_id = 1;
UPDATE student SET class=
	Case
		When average>=60 then 'First class'
		When average>=50 then 'second class'
		When average>=40 then 'third class'
	Else
		'Fail'
	End
UPDATE Coffee SET coffee_price = 1000 where coffee_type IN ('Latte','Cappacino');
UPDATE Coffee SET coffee_price = 1000 where coffee_type NOT IN ('Latte');


MATH STUFF ####################
SELECT ABS(-15);
CEILING()   FLOOR()   SQUARE()
SQRT()   SIGN(n) 1,0,-1,n>0|n=0|n<0
PI()   LOG()  LOG10()
SIN() COS() TAN()
ASCII('Z') 90 // convert char to ASCII Code
CHAR(90) // convert int ASCII code to character
CHARINDEX('S','Sakshi Sharma') // 1
LEFT('SAKSHI',3) // SAK
RIGHT('SAKSHI',2) // HI
LEN() LOWER() UPPER() LTRIM() RTRIM()
REPLACE('Jack and Jue','J','Bl')
REPLICATE('Hi',3) // HiHiHi
REVERSE() SPACE(50)

DATE & Time Functions ######################
GETDATE()
GETUTCDATE()
DAY(GETDATE())
MONTH(GETDATE())
YEAR(GETDATE())
DATEADD()  DATEDIFF()

Conversion Functions
CAST(10.256 as Int)
CONVERT() // READ FROM PPT, IT'S A LOTT

Aggregate Functions
SUM(column)  AVG()   MAX() MIN() COUNT()

OPERATORS
Select 100+456;
Logical operator:AND , OR , NOT, BETWEEN, 
NOT BETWEEN, LIKE, NOT LIKE, IN, NOT IN, EXISTS,NOT EXISTS, ANY, 
ALL, SOME

Select * from Coffee where coffee_name = 'Latte' or coffee_name = 'cappacino';
Select * from Coffee where coffee_price between 900 and 1000;
Select * from Coffee where coffee_name like 'Latt%';
% -> any
_ -> single

SET Operations -> 
smartTable (eno int, ename varchar (10), sal int)
GarbageTable (eno int, ename varchar (10), sal int)
Select ename from smartTable Union Select ename from GarbageTable; // No duplicate values
Select ename from smartTable Union all Select ename from GarbageTable; // duplicate values
Select ename from smartTable Intersect select ename from GarbageTable;
Select ename from smartTable Except Select ename from GarbageTable;

SELECT * FROM Coffee ORDER BY coffee_price;
SELECT * FROM Coffee ORDER BY coffee_price DESC;

SELECT TOP 3 * from Coffee;
GROUP BY ->
SELECT dept,count(*) AS count FROM Coffee GROUP BY coffee_type;
SELECT dept,count(*) AS count FROM Coffee GROUP BY coffee_type HAVING count(*) > 3;

SELECT * INTO NewTableCoffee FROM Coffee; // create a new table with these data
SELECT coffee_type,coffee_price INTO NewTableCoffee FROM Coffee;


Constraint in SQL #######################
	Data integrity rules fall into three categories.
	Entity Integrity -> Each row is uniquely identifiable
	Referential Integrity -> Using a foreign key, ensures the relationships between tables
	Domain Integrity -> Rules like NON NULL, Unique

	5 types of constraints in SQL Server -> 
		Unique Key Constraint -> Unique key allow null, primary key does not allow
			create table Coffee ( id int unique, ... )
		Not null constraints 
			create table Coffee  ( id int not null ... )
		Check Constraint 
			age int check (age between 20 and 30)
		Primary key
			id int primary key
			ALTER TABLE Coffee ALTER COLUMN coffee_name nvarchar(100) not null;
			ALTER TABLE Coffee ADD CONSTRAINT coffee_id_pk primary key(coffee_id);
		Foreign key
			CREATE TABLE Coffee (
				...
				...
				dept_id int foreign key references Department(dept_id)
			);
			(or) foreign key(dept_id) references Department(dept_id)
			ON DELETE CASCADE
			ON UPDATE CASCADE


JOINS #########################
EQUI JOIN -> SELECT * FROM EMP, DEPT WHERE (EMP.EID=DEPT.DNO);
Inner join return only those records that match in both table
INNER JOIN -> SELECT * FROM EMP E INNER JOIN DEPT D ON E.EID=D.DNO;
In summary, an equi-join is a type of inner join where the join condition is based on 
equality between columns. However, an inner join is not limited to equality and 
can use other comparison operators.
OUTER JOIN -> (LEFT OUTER JOIN , RIGHT OUTER JOIN , FULL OUTER JOIN)
SELECT * FROM EMP LEFT OUTER JOIN DEPT ON 
EMP.EID=DEPT.DNO;SELECT * FROM EMP RIGHT OUTER JOIN DEPT ON 
EMP.EID=DEPT.DNO;SELECT * FROM EMP FULL OUTER JOIN DEPT ON 
EMP.EID=DEPT.DNO;
NON EQUI JOIN -> SELECT * FROM EMP, SALGRADE 
WHERE (EMP.SALARY > SALGRADE.LOWSAL) AND (EMP.SALARY < SALGRADE.HIGHSAL);
SELF JOIN -> SELECT E.EID, E.ENAME AS MANAGERS, M.SALARY 
FROM EMP E, EMP M 
WHERE E.EID=M.EID; // join  with itself
CROSS JOIN -> So, if the first table contain ‘m’ rows and second table contain ‘n’ rows then output 
will be ‘m*n’ rows.
SELECT * FROM EMP CROSS JOIN DEPT
NATURAL JOIN -> Not supported by MS SQL
JOIN WITH MULTIPLE TABLES ->
select e.EmpID,e.EmpName,e.Deptno,d.Deptno,d.Dname,d.Location,s.si
d,s.sname,s.fee 
from Employee e left 
outer join Dept d on (e.Deptno=d.Deptno)
join student s on (e.Deptno=s.sid);

+++ TRANSACTION CONTROL LANGUAGE
A transaction is a unit of work that is performed against a 
database or set of statement (Insert, Update and Delete) which should be executed 
as one unit.

BEGIN TRANSACTION
INSERT INTO EMPLOYEE VALUES(105,'KAMAL',62000,'MUMBAI')
INSERT INTO EMPLOYEE VALUES(106,'SUJATHA',82000,'DELHI')
COMMIT

BEGIN TRANSACTION
DELETE FROM EMPLOYEE WHERE EID=105
DELETE FROM EMPLOYEE WHERE EID=106
ROLLBACK

BEGIN TRANSACTION
UPDATE EMPLOYEE SET SALARY=99000 WHERE EID=101
UPDATE EMPLOYEE SET SALARY=88000 WHERE EID=102
SAVE TRANSACTION S1
UPDATE EMPLOYEE SET SALARY=77000 WHERE EID=103
UPDATE EMPLOYEE SET SALARY=66000 WHERE EID=104
SAVE TRANSACTION S2
UPDATE EMPLOYEE SET SALARY=55000 WHERE EID=105
UPDATE EMPLOYEE SET SALARY=44000 WHERE EID=106
ROLLBACK TRANSACTION S1

Sub Queries -> 
select * from tab2 where 
	Salary=(   select MAX(salary)from tab2 
					where Salary<
							(select MAX(salary) from tab2 where Salary <
								(    select MAX(salary) from tab2  )
							)
		);


INDEXES -> 
Index is a database object which is used for the quick retrieving of the data 
from the table.
The only time the data rows in a table are stored in sorted (ascending order 
only) order structure is when the table contains a clustered index
Non -Clustered Index -> meaning a group 
CREATE CLUSTERED INDEX IX_Employees ON Employees (EmployeeID);
CREATE NONCLUSTERED INDEX IX_Employees_LastName ON Employees (LastName);

VIEWS -> 
It is a logical table use to get the required information from the table. View 
will be created by using select statement and table used for the creation of 
the view is called as base table.
CREATE VIEW EmployeeSales AS
SELECT 
    E.EmployeeID, 
    E.FirstName, 
    E.LastName, 
    SUM(OD.Quantity * P.Price) AS TotalSales
FROM 
    Employees E
JOIN 
    Orders O ON E.EmployeeID = O.EmployeeID
JOIN 
    OrderDetails OD ON O.OrderID = OD.OrderID
JOIN 
    Products P ON OD.ProductID = P.ProductID
GROUP BY 
    E.EmployeeID, E.FirstName, E.LastName;



+++ Data Control Language ->
Authentication: Authentication is a process of verifying the credentials of a 
user to login into the system.
Authorization: Authorization is process of verifying whether the user as 
permissions to perform any operation on the database.

GRANT: The GRANT command is used to give users access to the database.
-- Syntax
GRANT privilege_name
ON object_name
TO {user_name |PUBLIC |role_name}
[WITH GRANT OPTION];

-- Example
GRANT SELECT, INSERT, UPDATE
ON Employees
TO User1;

REVOKE: The REVOKE command is used to take back permissions from users.
-- Syntax
REVOKE privilege_name
ON object_name
FROM {user_name |PUBLIC |role_name}

-- Example
REVOKE UPDATE
ON Employees
FROM User1;

*/



