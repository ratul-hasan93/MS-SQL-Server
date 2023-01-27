USE DEV_TEST
GO
ALTER PROC RHpractice
	@action_name VARCHAR(100)
	,@id VARCHAR = null
	,@name VARCHAR(100)
	,@deptName VARCHAR(100)
	,@gender varchar(100)
AS
BEGIN

	--IF(@action_name='Function1')
	--BEGIN
	--	DECLARE @setValue int
	--	SELECT [dbo].[Age](@id,@name,@deptName,@gender)
	--END


	--SET NOCOUNT ON;
	--FOR GET TABLE:
	IF(@action_name='GET')
	BEGIN
		SELECT*
		FROM rhr_student
	END

	--FOR INSERT:
	IF(@action_name='INSERT')
	BEGIN
		INSERT INTO rhr_student(stu_name,dept_name,gender)VALUES(@name,@deptName,@gender)
	END

	--FOR UPDATE:
	IF(@action_name='UPDATE')
	BEGIN
		UPDATE rhr_student
		SET stu_name = @name, dept_name=@deptName, gender=@gender
		WHERE stu_id = 13
	END

	--FOR TRUNCATE:
	IF(@action_name='TRUNCATE')
	BEGIN
		TRUNCATE TABLE rhr_student
	END

	--FOR DELETE:
	IF(@action_name='DELETE')
	BEGIN
		DELETE  rhr_student
		WHERE stu_id=18
	END 

	--FOR ADD COLUMN:
	IF(@action_name='ADD_COLUMN')
	BEGIN
		ALTER TABLE rhr_student
        ADD gender VARCHAR(100)
	END

	--Insert Trigger:
	--IF(@action_name='INSERT_TRIGGER')
	--BEGIN
	--	CREATE TRIGGER rhInsertTrigger
	--	ON rhr_student
	--	FOR INSERT
	--	AS
	--	BEGIN
	--		DECLARE @ID VARCHAR(200)
	--		SELECT @ID = stu_id FROM inserted
	--		INSERT INTO TriggerStatus
	--		VALUES(@ID,'DATA INSERTED-'+CAST(GETDATE()AS VARCHAR(200)))
	--	END
	--	--call for insert:
	--	INSERT INTO rhr_student VALUES('Parvez','2000-10-23','HR','Male')
		
	--CREATE TRIGGER rhTrigger1
	--ON rhr_student
	--FOR INSERT
	--AS
	--BEGIN
	--	DECLARE @ID	VARCHAR(200)
	--	SELECT @ID = stu_id FROM inserted
	--	INSERT INTO TriggerSts
	--	VALUES(@ID,'Data has been inserted-' +CAST(GETDATE() as varchar(200)))
	--END
	--call for insert:
	--INSERT INTO rhr_student VALUES('Ratul','2000-10-23','HR','Male')
	--END
	 
END
