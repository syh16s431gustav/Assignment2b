CREATE TABLE [dbo].[Order Details] (
    [OrderID]   INT      NOT NULL,
    [ProductID] INT      NOT NULL,
    [UnitPrice] MONEY    CONSTRAINT [DF_Order_Details_UnitPrice] DEFAULT (0) NOT NULL,
    [Quantity]  SMALLINT CONSTRAINT [DF_Order_Details_Quantity] DEFAULT (1) NOT NULL,
    [Discount]  REAL     CONSTRAINT [DF_Order_Details_Discount] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [CK_Discount] CHECK ([Discount] >= 0 and [Discount] <= 1),
    CONSTRAINT [CK_Quantity] CHECK ([Quantity] > 0),
    CONSTRAINT [CK_UnitPrice] CHECK ([UnitPrice] >= 0),
    CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]),
    CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
);


GO
CREATE NONCLUSTERED INDEX [OrderID]
    ON [dbo].[Order Details]([OrderID] ASC);


GO
CREATE NONCLUSTERED INDEX [OrdersOrder_Details]
    ON [dbo].[Order Details]([OrderID] ASC);


GO
CREATE NONCLUSTERED INDEX [ProductID]
    ON [dbo].[Order Details]([ProductID] ASC);


GO
CREATE NONCLUSTERED INDEX [ProductsOrder_Details]
    ON [dbo].[Order Details]([ProductID] ASC);


GO
CREATE TRIGGER [dbo].[OrderDetailsDeleteTrigger]
ON [dbo].[Order Details]
FOR delete
AS
BEGIN
    SET NOCOUNT ON
    UPDATE [dbo].[Products]
      SET [UnitsInStock]=[UnitsInStock]-i.[Quantity]
      FROM inserted i
        INNER JOIN [dbo].[Products] p ON p.[ProductID]=i.[ProductID]
END
GO
CREATE TRIGGER [OrderDetailsInsertTrigger]
ON [dbo].[Order Details]
FOR INSERT
AS
BEGIN
    SET NOCOUNT ON
    UPDATE [dbo].[Products]
      SET [UnitsInStock]=[UnitsInStock]-i.[Quantity]
      FROM inserted i
        INNER JOIN [dbo].[Products] p ON p.[ProductID]=i.[ProductID]
END
GO
CREATE TRIGGER [dbo].[OrderDetailsUpdateTrigger]
ON [dbo].[Order Details]
FOR update
AS
BEGIN
    SET NOCOUNT ON
    UPDATE [dbo].[Products]
      SET [UnitsInStock]=[UnitsInStock] -(i.[Quantity] - d.[Quantity])
      FROM inserted i
	    INNER JOIN deleted d ON i.[OrderID]=d.[OrderID] and i.[ProductID]=d.[ProductID]
        INNER JOIN [dbo].[Products] p ON p.[ProductID]=i.[ProductID]
END