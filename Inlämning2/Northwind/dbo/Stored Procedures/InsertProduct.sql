

CREATE PROCEDURE [dbo].[InsertProduct] 
@ProductName nvarchar(40),
@SupplierID int,
@CategoryID int,
@QuantityPerUnit nvarchar(40),
@UnitPrice float,
@UnitsInStock nvarchar(40),
@UnitsOnOrder nvarchar(40),
@ReorderLevel nvarchar(40),
@Discontinued nvarchar(40)

AS
begin
	set nocount on
	insert into dbo.Products 
	(
		ProductName,
		SupplierID ,
		CategoryID ,
		QuantityPerUnit ,
		UnitPrice ,
		UnitsInStock ,
		UnitsOnOrder ,
		ReorderLevel ,
		Discontinued
	) 
	values
	(
		@ProductName,
		@SupplierID,
		@CategoryID,
		@QuantityPerUnit,
		@UnitPrice,
		@UnitsInStock,
		@UnitsOnOrder,
		@ReorderLevel,
		@Discontinued
	)
		set nocount off

end

