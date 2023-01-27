--Function in SQL server:(user defined)
--1. Scalar function(for return single value. it can be any datatype)
--2. Inline table-valued function(It will be Return a table)
--3. MultiStatement table-valued function(it wiil be return tble structure defintion)


--1. Scalar Function Syntax:
	--CREATE FUNCTION function_name(@p1 Data_type, @p2 Data_Type,....@Pn Data_Type)
	--RETURNS Return_Datatype
	--As
	--BEGIN
	--	Function Body
	--	Return Return_DataType
	--End

  --Create Scalar Function for caluculate age:
--ALTER FUNCTION Age(@DOB DATE, @CompareDate DATE)
--  RETURNS INT
--  AS
--  BEGIN
--	DECLARE @Age int
--	SELECT @Age = DATEDIFF(YEAR,@DOB,@CompareDate)
--	RETURN @Age
--  END
--  GO
--for cll:
--  SELECT *, dbo.Age(DOB,'2030-07-25')Age From rhr_student
--  WHERE dbo.Age(DOB,'2050-07-25') >30

  --SELECT dbo.Age('2000-07-25')
  --also use: SELECT databaseName.dbo.Age('2000-07-25')





  --2. Inline Table-Valued Function Syntax:
  --CREATE FUNCTION Function_Name(@p1 Data_type, @p2 Data_Type,....@Pn Data_Type)
  --RETURNS TABLE
  --AS
  --RETURN(Select_Statement);
   --(** where can we use inline table valued function: 
  --1. inline table valued function can be used to achieve the functionality of parameterized views.
  --2. The table reatured by the table valued function , can also be used in joins with other table.**)
  
  --**Create a function that returns table by column:
--CREATE FUNCTION EmployeeByName(@name nvarchar(20))
--  RETURNS TABLE
--  AS
--  RETURN(SELECT* FROM rhr_student
--  WHERE stu_name =@name )
--for cll:
--  SELECT* from EmployeeByName('Anis')

--  --also be used in joins with other table:
--  SELECT E.stu_id, stu_name, DOB, D.dept 
--  from EmployeeByName('Anis') E INNER JOIN rh_excel_todb D
--  ON E.stu_id = D.id




--3.MultiStatement table-valued function Syntax:
 --CREATE FUNCTION Function_Name()
  --RETURNS @Table TABLE(Id int, Name Varchar(20), DOB DATE)
  --AS
  --BEGIN
  --INSERT INTO @Table
  --SELECT Id, Name, Cast(DOB as DATE)
  --FROM Table_name
  --RETURN
  --END

  --INLINE
  --CREATE FUNCTION ILFN()
  --RETURNS TABLE
  --AS
  --RETURN(SELECT stu_id,stu_name,dept_name, CAST(DOB as DATE )DOB, gender FROM rhr_student)
  --go
  ----for cll:
  --SELECT * FROM ILFN()
  

  --MULTISTTEMENT:
  --ALTER FUNCTION MSFN()
  --RETURNS @Table TABLE(stu_id int, stu_name varchar(100),DOB DATE, dept_name varchar(100), gender varchar(100) )
  --AS
  --BEGIN
  --INSERT INTO @Table                
  --SELECT* FROM rhr_student
  --RETURN
  --END

  ----for cll:
  --SELECT * FROM MSFN()

   