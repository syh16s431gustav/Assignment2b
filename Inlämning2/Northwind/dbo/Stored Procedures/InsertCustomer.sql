


CREATE procedure [dbo].[InsertCustomer]
@CustomerID nvarchar(20),
@CompanyName nvarchar(20),
@ContactName nvarchar(30),
@ContactTitle nvarchar(30),
@Address nvarchar(30),
@City nvarchar(30),
@Region nvarchar(30),
@PostalCode nvarchar(30),
@Country nvarchar(30),
@Phone nvarchar(30),
@Fax nvarchar(30)

as
begin
	set nocount on
	insert into dbo.Customers 
	(
		CustomerID,
		CompanyName ,
		ContactName ,
		ContactTitle ,
		Address ,
		City ,
		Region ,
		PostalCode ,
		Country ,
		Phone ,
		Fax 
	) 
	values
	(
		@CustomerID,
		@CompanyName ,
		@ContactName ,
		@ContactTitle ,
		@Address ,
		@City ,
		@Region ,
		@PostalCode ,
		@Country ,
		@Phone ,
		@Fax 
	)
		set nocount off

end



