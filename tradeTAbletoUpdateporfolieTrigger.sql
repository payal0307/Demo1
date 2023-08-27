-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER AfterInsertTrade
ON Trades
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update buyer's portfolio
    UPDATE Portfolio
    SET Quantity = p.Quantity + i.Quantity
    FROM Portfolio p
    INNER JOIN inserted i ON p.userID = i.buyerUserID AND p.stockID = i.stockID;

    -- Update seller's portfolio
    UPDATE Portfolio
    SET quantity = p.quantity - i.quantity
    FROM Portfolio p
    INNER JOIN inserted i ON p.userID = i.sellerUserID AND p.stockID = i.stockID;
END;

--use stockMarketDB1
select * from PriceHistory
--INSERT INTO Trades VALUES ( 2, 1, 2, 5, 100.25, getdate())


