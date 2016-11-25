/****** Script for SelectTopNRows command from SSMS  ******/
create procedure InsertRegion(@RegionID int, @RegionDescription nchar(50))

as

insert into[dbo].[Region]
([RegionID],[RegionDescription])
values (@RegionID,@RegionDescription)

