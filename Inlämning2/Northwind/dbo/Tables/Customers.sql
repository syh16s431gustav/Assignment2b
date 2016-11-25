CREATE TABLE [dbo].[Customers] (
    [CustomerID]   NCHAR (5)     NOT NULL,
    [CompanyName]  NVARCHAR (40) NOT NULL,
    [ContactName]  NVARCHAR (30) NULL,
    [ContactTitle] NVARCHAR (30) NULL,
    [Address]      NVARCHAR (60) NULL,
    [City]         NVARCHAR (15) NULL,
    [Region]       NVARCHAR (15) NULL,
    [PostalCode]   NVARCHAR (10) NULL,
    [Country]      NVARCHAR (15) NULL,
    [Phone]        NVARCHAR (24) NULL,
    [Fax]          NVARCHAR (24) NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [City]
    ON [dbo].[Customers]([City] ASC);


GO
ALTER INDEX [City]
    ON [dbo].[Customers] DISABLE;


GO
CREATE NONCLUSTERED INDEX [CompanyName]
    ON [dbo].[Customers]([CompanyName] ASC);


GO
CREATE NONCLUSTERED INDEX [PostalCode]
    ON [dbo].[Customers]([PostalCode] ASC);


GO
CREATE NONCLUSTERED INDEX [Region]
    ON [dbo].[Customers]([Region] ASC);


GO
CREATE NONCLUSTERED INDEX [ContactName]
    ON [dbo].[Customers]([ContactName] ASC);


GO





CREATE TRIGGER [dbo].[UpdateCustomerContactName]
ON [dbo].[Customers]
FOR update
AS

declare @CustomerID nchar(5);
declare @NewContactName nvarchar(30);
declare @OldContactName nvarchar(30);

select @OldContactName= d.ContactName from deleted d
select @CustomerID= i.CustomerID from inserted i
select @NewContactName= i.ContactName from inserted i

	if update(ContactName)
	insert into [dbo].[CustomerContactNameChanges](CustomerID,NewContactName, OldContactName)
	values(@CustomerID,@NewContactName ,@OldContactName)


