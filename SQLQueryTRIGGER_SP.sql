--*SP with Trigger:
ALTER PROC RH_Trigger

	@action_name		VARCHAR(100)		= null
	,@id				INT					= null
	,@name				VARCHAR(100)		= null
	,@DOB				DATE         		= null
	,@deptName			VARCHAR(100)		= null
	,@gender			VARCHAR(100)		= null
	,@is_active			INT					= null


AS
BEGIN
	--FOR GET TABLE:
	IF(@action_name='GET')
	BEGIN
		SELECT *
		FROM rhr_student
	END

	--FOR INSERT TRIGGER:
	IF(@action_name='T_INSERT')
	BEGIN
		INSERT INTO rhr_student(stu_name,dept_name,gender,DOB)
		VALUES(@name,@deptName,@gender,@DOB)--,ISNULL(@is_active,1))
	END
	
	--FOR UPDATE TRIGGER:
	IF(@action_name='T_UPDATE')
	BEGIN
		UPDATE rhr_student
			SET DOB=@DOB,
			stu_name=@name,
			dept_name=@deptName,
			gender=@gender,
			IsActive = 1
		WHERE stu_id=@id
	END

	--FOR DELETE TRIGGER:
	IF(@action_name='T_DELETE')
	BEGIN
	DELETE
		FROM rhr_student WHERE stu_id=@id
	END

END

