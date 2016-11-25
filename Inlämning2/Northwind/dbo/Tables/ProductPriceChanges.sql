CREATE TABLE [dbo].[ProductPriceChanges] (
    [ProductPriceChangeID] INT      IDENTITY (1, 1) NOT NULL,
    [ProductID]            INT      NOT NULL,
    [OldPrice]             MONEY    NOT NULL,
    [NewPrice]             MONEY    NOT NULL,
    [ChangedDate]          DATETIME NOT NULL,
    [UserId]               INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductPriceChangeID] ASC)
);

