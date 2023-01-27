--Syntax: SP
--create procedure StoreProcedureName
--as
--Begin
--Select name, gender from Tablename
--End
--go

--For Execute SP shortkey is F5 or Exec SP name
--exec sp_helptext 'rhTest' for Show SP


--1. SP Create With INPUT Parametter and variable:
Create Procedure SPinputPandV
@Location varchar(100),
@DepartmentName varchar(100)
as
Begin
select Id, Name, Location, DepartmentName
from EmployeeTbl where Location = @Location and DepartmentName =@DepartmentName 
End
go

--2. Alter Procedure WithOut delete:
Alter Procedure SPinputPandV
@Location varchar(100),
@DepartmentName varchar(100)
as
Begin
select Id, Name, Location, DepartmentName
from EmployeeTbl where Location = @Location and DepartmentName =@DepartmentName 
order by Id
End
go

--3. to Encrypt the text of the SP:
Alter Procedure SPinputPandV
@Location varchar(100),
@DepartmentName Varchar(100)
--With Encryption
AS
Begin
Select * From EmployeeTbl where Location = @Location and DepartmentName = @DepartmentName
Order by DepartmentName
End
Go

--4. Drop Procedure:
--Drop Proc SPinputPandV
--go
 