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
CREATE TRIGGER UpdatePriceHistoryAfterTrade
ON Trades
AFTER INSERT
AS
BEGIN
    DECLARE @StockID INT, @TradePrice DECIMAL(18, 2);

    SELECT @StockID = stockID, @TradePrice = price
    FROM inserted;
	-- Check if the stock has existing price history records
    IF NOT EXISTS (SELECT 1 FROM PriceHistory WHERE stockID = @StockID)
    BEGIN
        -- If no history exists, insert the first record
        INSERT INTO PriceHistory (stockID, openPrice, highPrice, lowPrice, closePrice, volume, tradeDate)
        VALUES (@StockID, @TradePrice, @TradePrice, @TradePrice, @TradePrice, 1, GETDATE());
    END
    ELSE
    BEGIN
	-- If history exists, update existing record
        DECLARE @LastClosePrice DECIMAL(18, 2), @LastVolume INT;

        SELECT TOP 1 @LastClosePrice = closePrice, @LastVolume = volume
        FROM PriceHistory
        WHERE stockID = @StockID
        ORDER BY priceHistoryID DESC;

        -- Update the existing record
        UPDATE PriceHistory
        SET closePrice = @TradePrice, volume = @LastVolume + 1, tradeDate = GETDATE()
        WHERE stockID = @StockID AND priceHistoryID = (SELECT MAX(priceHistoryID) FROM PriceHistory WHERE stockID = @StockID);
-- Update high and low prices if necessary
        IF @TradePrice > @LastClosePrice
            UPDATE PriceHistory
            SET highPrice = @TradePrice
            WHERE stockID = @StockID AND priceHistoryID = (SELECT MAX(priceHistoryID) FROM PriceHistory WHERE stockID = @StockID);

        IF @TradePrice < @LastClosePrice
            UPDATE PriceHistory
            SET lowPrice = @TradePrice
            WHERE stockID = @StockID AND priceHistoryID = (SELECT MAX(priceHistoryID) FROM PriceHistory WHERE stockID = @StockID);
    END;
	end
GO
--INSERT INTO Trades (buyerUserID, sellerUserID, stockID, quantity, price)
--VALUES (1, 2, 1001, 10, 50.00);
