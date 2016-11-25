


CREATE PROCEDURE [dbo].[UpdateProductPrice] 
@ProductID int,
@UnitPrice decimal

AS
	BEGIN
	UPDATE Products
	set UnitPrice=@UnitPrice
	where ProductID = @ProductID
	end

