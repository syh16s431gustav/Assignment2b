

CREATE PROCEDURE [dbo].[CustomersGetOrders] 
@CustomerID nvarchar(50)
	
AS 
SELECT        Customers.CompanyName, Customers.ContactName, Customers.CustomerID, Orders.OrderDate
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID
	where Customers.CustomerID = @CustomerID
	
