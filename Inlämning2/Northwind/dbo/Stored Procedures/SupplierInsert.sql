

CREATE PROCEDURE [dbo].[SupplierInsert] 
@CompanyName nvarchar(50),
@ContactName nvarchar(50),
@ContactTitle nvarchar(50),
@Address nvarchar(50),
@City nvarchar(50),
@Region nvarchar(50),
@PostalCode nvarchar(50),
@Country nvarchar(50),
@Phone nvarchar(50),
@Fax nvarchar(50),
@HomePage nvarchar(50)

AS 
begin
	set nocount on
	insert into dbo.Suppliers 
	(
		CompanyName ,
		ContactName ,
		ContactTitle ,
		Address ,
		City ,
		Region ,
		PostalCode ,
		Country ,
		Phone ,
		Fax ,
		HomePage 
	) 
	values
	(
		@CompanyName ,
		@ContactName ,
		@ContactTitle ,
		@Address ,
		@City ,
		@Region ,
		@PostalCode ,
		@Country ,
		@Phone ,
		@Fax ,
		@HomePage 
	)
		set nocount off

end

