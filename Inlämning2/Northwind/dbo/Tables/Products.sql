CREATE TABLE [dbo].[Products] (
    [ProductID]       INT           IDENTITY (1, 1) NOT NULL,
    [ProductName]     NVARCHAR (40) NOT NULL,
    [SupplierID]      INT           NULL,
    [CategoryID]      INT           NULL,
    [QuantityPerUnit] NVARCHAR (20) NULL,
    [UnitPrice]       MONEY         CONSTRAINT [DF_Products_UnitPrice] DEFAULT ((0)) NULL,
    [UnitsInStock]    SMALLINT      CONSTRAINT [DF_Products_UnitsInStock] DEFAULT ((0)) NULL,
    [UnitsOnOrder]    SMALLINT      CONSTRAINT [DF_Products_UnitsOnOrder] DEFAULT ((0)) NULL,
    [ReorderLevel]    SMALLINT      CONSTRAINT [DF_Products_ReorderLevel] DEFAULT ((0)) NULL,
    [Discontinued]    BIT           CONSTRAINT [DF_Products_Discontinued] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY NONCLUSTERED ([ProductID] ASC),
    CONSTRAINT [CK_Products_UnitPrice] CHECK ([UnitPrice]>=(0)),
    CONSTRAINT [CK_ReorderLevel] CHECK ([ReorderLevel]>=(0)),
    CONSTRAINT [CK_UnitsInStock] CHECK ([UnitsInStock]>=(0)),
    CONSTRAINT [CK_UnitsOnOrder] CHECK ([UnitsOnOrder]>=(0)),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID]),
    CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID])
);


GO
CREATE CLUSTERED INDEX [CategoriesProducts]
    ON [dbo].[Products]([CategoryID] ASC);


GO
CREATE NONCLUSTERED INDEX [CategoryID]
    ON [dbo].[Products]([CategoryID] ASC);


GO
CREATE NONCLUSTERED INDEX [ProductName]
    ON [dbo].[Products]([ProductName] ASC);


GO
CREATE NONCLUSTERED INDEX [SupplierID]
    ON [dbo].[Products]([SupplierID] ASC);


GO
CREATE NONCLUSTERED INDEX [SuppliersProducts]
    ON [dbo].[Products]([SupplierID] ASC);


GO
CREATE TRIGGER [ProductsUpdateTrigger]
ON [dbo].[Products]
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON
    INSERT INTO [dbo].[ProductPriceChanges]
        ([ProductID], [OldPrice], [NewPrice], [ChangedDate], [UserId])
        SELECT i.[ProductID], d.[UnitPrice], i.[UnitPrice], GETDATE(), USER_ID()
            FROM inserted i
              INNER JOIN deleted d ON i.[ProductID]=d.[ProductID]
            WHERE d.[UnitPrice] <> i.[UnitPrice]
END