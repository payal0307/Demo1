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
CCREATE TRIGGER AfterInsertTrade
AFTER INSERT ON Trades
AS
BEGIN
IF NEW.BuyerUserID IS NOT NULL THEN
-- Update buyer's portfolio
INSERT INTO Portfolio (UserID, StockID, Quantity)
from Portfolio
ON DUPLICATE KEY UPDATE Quantity = Quantity + NEW.Quantity;

-- Update trade status based on profit or loss
UPDATE Trades
SET Status = CASE
WHEN NEW.Price > OLD.Price THEN 'Profit'
WHEN NEW.Price < OLD.Price THEN 'Loss'
ELSE 'Neutral'
END
WHERE TradeID = NEW.TradeID;
END IF
END
GO
