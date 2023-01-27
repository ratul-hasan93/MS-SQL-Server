USE [DEV_TEST]
GO
/****** Object:  StoredProcedure [dbo].[SPinputPandV]    Script Date: 12/8/2022 3:45:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--3. to Encrypt the text of the SP:
ALTER Procedure [dbo].[SPinputPandV]
	@action_name	varchar(64) =null output
	,@Location varchar(100)
	,@DepartmentName Varchar(100)
	,@Gender varchar (100)
	,@Name Varchar(100)
--With Encryption
AS
Begin

   --GET:
	--if(@action_name = 'GET')
	--BEGIN
	--	Select *
	--	From EmployeeTbl
	--	where Location = @Location and DepartmentName = @DepartmentName
	--	Order by DepartmentName
	--END


	--INSERT:
	--if(@action_name = 'INSERT')
	--BEGIN
	--   Insert into EmployeeTbl(Location, DepartmentName,Name,Gender)
	--   values(@Location,@DepartmentName,@Name,@Gender)
 --   END


 --UPDATE:
	if(@action_name = 'UPDATE')
	BEGIN
	   UPDATE EmployeeTbl
	   set Name = @Name, DepartmentName = @DepartmentName, Gender=@Gender, Location=@Location
       WHERE Id = 6;
	END
End




exec [SPinputPandV]
	 @action_name = 'UPDATE'
	 ,@Location = 'Dhaka'
	 ,@DepartmentName = 'EEE'
	  ,@Name = 'Hasan'
	 ,@Gender = 'male'

select * from EmployeeTbl



