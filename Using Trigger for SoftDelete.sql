

  --ALTER TABLE [dbo].[Ratul]
  --ADD IsActive BIT NOT NULL DEFAULT 1;
  --GO

  select*from [dbo].[Ratul]
  
  delete from [dbo].[Ratul] where Id = 8

  --insert into [dbo].[Ratul](Name,Department,Gender)values('Tahmina','HR','Female')
  --insert into [dbo].[Ratul](Name,Department,Gender)values('Monir','Finance','male') 
  insert into [dbo].[Ratul](Name,Department,Gender)values('Tunifsaa','English','Female')

  
CREATE TRIGGER RHSoftDelete
ON [dbo].[Ratul]
INSTEAD OF DELETE AS
BEGIN
SET NOCOUNT ON;
UPDATE [dbo].[Ratul]
  SET IsActive = 0
  WHERE Id IN (SELECT Id FROM deleted);
END
GO


--EXEC TestJdbc '[dbo].[Ratul]'
--@Department='dfsa'
--GO
--ALTER VIEW hasan AS
--  SELECT *
--  FROM [dbo].[Ratul]
--  WHERE IsActive = 0;
--GO