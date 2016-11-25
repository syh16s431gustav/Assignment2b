CREATE TABLE [dbo].[Categories] (
    [CategoryID]   INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (15) NOT NULL,
    [Description]  NTEXT         NULL,
    [Picture]      IMAGE         NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CategoryName]
    ON [dbo].[Categories]([CategoryName] ASC);


GO
create trigger CategoryUpdateTrigger
on Categories
after update
as begin

set nocount on

insert into CategoryChanges(CategoryID, OldCategoryName, NewCategoryName)
select i.CategoryID, d.CategoryName, i.CategoryName
from inserted i
inner join deleted d on i.CategoryID = d.CategoryID

end 
