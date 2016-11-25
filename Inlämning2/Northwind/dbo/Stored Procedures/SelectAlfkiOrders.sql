
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAlfkiOrders] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT        Customers.CustomerID, Orders.OrderID
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID
WHERE        (Customers.CustomerID = N'ALFKI')
    -- Insert statements for procedure here
END

