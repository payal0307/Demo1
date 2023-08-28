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
CREATE TRIGGER UpdateOrderStatusAfterTrade
ON Trades
AFTER INSERT
AS
BEGIN
    DECLARE @UpdatedOrderID INT;

    SELECT @UpdatedOrderID = orderID
    FROM inserted;

    -- Update the Order status in the Orders table
    UPDATE Orders
    SET status = CASE
        WHEN EXISTS (SELECT 1 FROM Trades WHERE orderID = @UpdatedOrderID) THEN 'Executed'
        ELSE 'Pending'
    END
    WHERE orderID = @UpdatedOrderID;
END
GO
