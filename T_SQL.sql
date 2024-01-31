/*
T/SQL stands for “Transact Structure Query Language. It is an extension of 
SQL language. This T/SQL is same as PL/SQL in oracle.

Write a T/SQL program to input two values and interchange the variable values.
declare @a int,@b int,@c int;
declare @stdno int,@stdname varchar(50);
set @stdno=101;
set @stdname='SAI';
set @a=10;
set @b=20;
set @c=@a;
print @a;
print @b;


Conditional Statements ->
set @a=30;
set @b=20;
if(@a>@b)
	print 'a is big'
else if(@a=@b)
	print 'Both are equal'
else
	print 'B is big';


Loop Statements ->
declare @a int
set @a=0;
while(@a<10)
	begin
		set @a=@a+1;
		print @a;
	end;


Stored Programs ->
	Stored Procedures->
	A stored procedure is a precompiled group of SQL statements that are stored in the database.
	CREATE PROCEDURE GetEmployeeSales @EmployeeID INT
	AS
	BEGIN
		SELECT SUM(OrderDetails.Quantity * Products.Price) AS TotalSales
		FROM Employees
		JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
		JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
		JOIN Products ON OrderDetails.ProductID = Products.ProductID
		WHERE Employees.EmployeeID = @EmployeeID
		GROUP BY Employees.EmployeeID;
	END;
	EXEC GetEmployeeSales @EmployeeID = 1; (or) EXEC GetEmployeeSales 1;
	Drop Procedure GetEmployeeSales;

	Stored Functions ->
	A stored function is a set of SQL statements that perform a specific task and return a single value.
	CREATE FUNCTION GetEmployeeSales(@EmployeeID INT)
	RETURNS DECIMAL(10,2)
	AS
	BEGIN
		DECLARE @TotalSales DECIMAL(10,2);

		SELECT @TotalSales = SUM(OrderDetails.Quantity * Products.Price)
		FROM Employees
		JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
		JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
		JOIN Products ON OrderDetails.ProductID = Products.ProductID
		WHERE Employees.EmployeeID = @EmployeeID
		GROUP BY Employees.EmployeeID;

		RETURN @TotalSales;
	END;
	SELECT dbo.GetEmployeeSales(1);

	Table Valued Functions ->
	create function ft1(@add varchar(50))
	returns table
	as
	return(select * from employee where address=@add)
	Output:select * from ft1('hyd');	Drop Function ft1;Triggers -> A trigger is a special type of procedure that will used to provide 
restrict on the tables when a language events executed. Sql server includes two 
types of triggers are
	 DML Triggers
	 DDL TriggersDML ->create trigger per_trg 
on person after insert
as
begin
	declare @pid int,@pname varchar(50),@loc varchar(50)
	select @pid=pid,@pname=pname,@loc=loc from inserted
	update person set pname=upper(@pname),loc=upper(@loc) where pid=@pid
endcreate trigger nnn on person 
for insert,update,delete
as
begin
	print 'DML OPeration are Not Allowed'
	rollback transaction
endDrop Trigger rest drop
DDL ->
create trigger restdrop on database after drop_table
as
begin
	rollback
	raiserror('Can not drop table under this database',1,1)
endDrop Trigger rest drop on database


Handling Errors ->
CREATE PROCEDURE PDIV(@X INT,@Y INT)
AS
BEGIN
	DECLARE @Z INT
	BEGIN TRY
		SET @Z=@X/@Y
		PRINT 'THE RESULT IS:-'+CAST(@Z AS CHAR)
	END TRY
	BEGIN CATCH
		PRINT ERROR_NUMBER()
	END CATCH
END
Exec PDIV 100,5

Error_Message(): It is used to display the information about the error occurred.


CURSOR ->
Like a pointer yo!
Implicit Cursors: These cursors will be created by SQL server by default 
when select statement will executed. Select statement will show records in the 
table as a set or result set.
Explicit Cursors: When user can create a memory location to store the tables 
then it is called as Explicit Cursors. These cursors will access the records in the 
table record by record or one by one only. Whenever we want to go for record by
record manipulation then explicit cursors will be used.

declare @dno int,@dname char(20),@loc varchar(20)
declare c1 cursor for select * from dept
open c1
	fetch next from c1 into @dno,@dname,@loc
	while @@FETCH_STATUS=0
	begin
		print @dno
		print @dname
		print @loc
		fetch next from c1 into @dno,@dname,@loc
	end
close c1
 
deallocate c1

Scroll Cursors -> Srollable up and down cursors
declare c1 cursor scroll for select * from dept
open c1
	fetch last from c1  |  fetch next from c1
	while @@FETCH_STATUS=0
	begin
		fetch prior from c1
	end
close c1

deallocate c1

Static & Dynamic Cursors ->
If a cursor is declare as static after opening the cursor any modifications 
that are performed to the data in the table will not be reflected into cursor
so the cursor contains old values only in it.

Declare @sal money
Declare c1 cursor static for select sal from employee Where eid=100
Open c1
	Update employee set sal=25000 where eid=100
	Fetch next from c1 into @sal
	Print @sal
Close c1

Deal locate c1;

*/