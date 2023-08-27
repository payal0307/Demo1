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
CREATE TRIGGER AfterOrderInserted
ON Orders
AFTER INSERT
AS
BEGIN
    -- ...
    IF @InsertedOrderType = 'Buy'
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM Orders
            WHERE order_type = 'Sell'
              AND stock_id = @InsertedStockID
              AND @InsertedPrice >= price -- Matching condition
        )
		BEGIN
            -- Call the trade execution stored procedure
            EXEC ExecuteTrade @InsertedUserID, @InsertedStockID, @InsertedPrice, @InsertedQuantity;
        END
    END
END;
GO



----------------------
CREATE TRIGGER AfterOrderInserted
ON Orders
AFTER INSERT
AS
BEGIN
    -- Declare variables for inserted order details
    DECLARE @InsertedOrderID INT, @InsertedUserID INT, @InsertedStockID INT,
            @InsertedOrderType NVARCHAR(10), @InsertedPrice DECIMAL(10, 2),
            @InsertedQuantity INT;

    SELECT @InsertedOrderID = orderID, @InsertedUserID = userID,
           @InsertedStockID = stockID, @InsertedOrderType = orderType,
           @InsertedPrice = price, @InsertedQuantity = quantity
    FROM inserted;
IF @InsertedOrderType = 'Buy'
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM Orders
            WHERE orderType = 'Sell'
              AND stockID = @InsertedStockID
              AND @InsertedPrice >= price
        )
        BEGIN
            -- Call the trade execution stored procedure
            DECLARE @BuyerUserID INT, @TradeStockID INT, @TradePrice DECIMAL(10, 2), @TradeQuantity INT;

            SELECT @BuyerUserID = userID, @TradeStockID = stockID, @TradePrice = @InsertedPrice, @TradeQuantity = quantity
            FROM inserted
            WHERE orderID = @InsertedOrderID;
EXEC ExecuteTrade @BuyerUserID, @TradeStockID, @TradePrice, @TradeQuantity;
        END
    END
END;
