USE [DEV_TEST]
GO
/****** Object:  StoredProcedure [dbo].[rhSalaryProcess]    Script Date: 12/28/2022 9:26:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[rhSalaryProcess](

@action_name		VARCHAR(100)		= null
,@Month             VARCHAR(100)		= null
,@Year				INT					= null	
,@Idr				INT                 = null

)
AS
BEGIN
	--FOR INSERT:
	IF(@action_name='INSERT')
	BEGIN
		DECLARE @ID INT,@NAME VARCHAR(100),@JOIN_DATE DATE, @STATUS VARCHAR(100),@SALARY int, @Monthr Varchar(100),@Yearr INT
		--DECLARE CURSOR:
		DECLARE RH_Cursor CURSOR
		FOR
		SELECT ID,Name,Join_Date,Status,Salary,Month,Year FROM rhEmplyee
		WHERE Status!='Resign' 

		OPEN RH_Cursor
		FETCH FROM RH_Cursor INTO @ID ,@NAME,@JOIN_DATE,@STATUS, @SALARY,@Monthr,@Yearr

		WHILE @@FETCH_STATUS = 0
		BEGIN
			--PRINT CAST(@ID AS VARCHAR)+' '+@NAME+' '+CAST(@JOIN_DATE AS VARCHAR)+' '+@STATUS+' '+CAST(@SALARY AS VARCHAR)
			IF(@STATUS !='Probation')
				INSERT INTO rhMonthlySalary(Join_Date, EmpID,Salary,Basic,HR,Food_Bill,Transport,Status,Month,Year)
				VALUES(@JOIN_DATE, @ID,@Salary,@Salary*.40,@Salary*.40,1000,@Salary*.20,@STATUS,@Monthr,@Yearr)
			ELSE 
				INSERT INTO rhMonthlySalary(Join_Date, EmpID,Salary,Basic,HR,Food_Bill,Transport,Status,Month,Year)
				VALUES(@JOIN_DATE, @ID,@Salary,@Salary*.40,@Salary*.40,0,@Salary*.20,@STATUS,@Monthr,@Yearr)

			--UPDATE rhMonthlySalary
			--	SET Food_Bill = 0
			--    WHERE Status = 'Probation'
			FETCH FROM RH_Cursor INTO @ID ,@NAME,@JOIN_DATE,@STATUS,@SALARY,@Monthr,@Yearr
		END
		--FOR CLOSE:
		CLOSE RH_Cursor
		DEALLOCATE RH_Cursor
	END

	--For Truncate:
	IF(@action_name='TRUNCATE')
	BEGIN
		  TRUNCATE TABLE rhMonthlySalary
	END

	IF(@action_name = 'SELECT')
	BEGIN
		SELECT* FROM rhEmplyee WHERE DATEDIFF(YEAR,Join_Date,'2019-12-31')>2
	END
	--FOR GET TABLE:
	IF(@action_name='GET')
	IF(@Idr is null)	
	BEGIN
		SELECT *
		FROM [dbo].[rhMonthlySalary]  
		WHERE Month = @Month AND Year = @Year 
	END
	ELSE
	BEGIN
		SELECT *
		FROM [dbo].[rhMonthlySalary]  
		WHERE Month = @Month AND Year = @Year AND EmpID = @Idr
	END


	--IF(@action_name='GET-1')
	--BEGIN
	--	--SELECT ID, 
	--	--Join_Date ,
	--	--salary
	--	--,Salary*.40 AS base,
	--	--Salary*.40 hr,
	--	--Salary*.20 AS transport
	--	--FROM rhEmplyee 
	--	--WHERE Salary = @ct_salary;
	--END
END
----------------------------End-------------------------------------------- 





--------------------------for Call SP:-------------------------------------

EXEC  [dbo].[rhSalaryProcess]
@action_name='GET'
,@Month='Jan'
,@Year = 2022
,@Idr = 1004
 


 --select*from rhMonthlySalary
EXEC  [dbo].[rhSalaryProcess]
@action_name='INSERT'



EXEC  [dbo].[rhSalaryProcess]
@action_name='TRUNCATE'



EXEC  [dbo].[rhSalaryProcess]
@action_name='GET-1'
,@ct_salary = 10000




