--LEARN TRIGGER:(Syntax):
--CREATE TRIGGER schema.trigger_name  
--ON table_name  
--AFTER  {INSERT, UPDATE, DELETE}  
--[NOT FOR REPLICATION]  
--AS  
--{SQL_Statements}  


--Insert Trigger:
Alter TRIGGER rhTrigger1
ON rhr_student
FOR INSERT
AS
BEGIN
	DECLARE @ID	VARCHAR(200)
	SELECT @ID = stu_id FROM inserted
	INSERT INTO TriggerStatus
	VALUES(@ID,'Data has been inserted-' +CAST(GETDATE() as varchar(200)))
END
--call for insert:
INSERT INTO rhr_student VALUES('Hasan','2000-10-23','HR','Male')
 
--select* from TriggerStatus
--select* from rhr_student



--UPDATE TRIGGER:
ALTER TRIGGER trgUpdte
ON rhr_student
AFTER UPDATE  
AS
DECLARE @stu_id varchar(200)
SELECT @stu_id = stu_id  from rhr_student
insert INTO TriggerStatus
VAlUES(@stu_id, 'updted data succesfully-'+ CAST(GETDATE() AS varchar(200)))

----call for update:
UPDATE rhr_student set DOB='1899-12-12' where stu_id=20

--select* from TriggerStatus
--select* from rhr_student


--DELETE TRIGGER:
ALTER TRIGGER rhTrigger2
ON rhr_student
FOR DELETE
AS
BEGIN
	DECLARE @ID VARCHAR(200)
	SELECT @ID = stu_id FROM deleted
	INSERT INTO TriggerStatus
	VALUES(@ID,'Delete Done-'+CAST(GETDATE() AS VARCHAR(200)))
END

----FOR CALL DELETE:
DELETE FROM rhr_student WHERE stu_id=29


--select* from TriggerStatus
--select* from rhr_student

