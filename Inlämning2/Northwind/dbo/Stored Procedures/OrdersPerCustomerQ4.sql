
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrdersPerCustomerQ4] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT        Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS [OrdersPerCustomer]
FROM            Employees INNER JOIN
                         Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.FirstName, Employees.LastName
    -- Insert statements for procedure here
	
END

