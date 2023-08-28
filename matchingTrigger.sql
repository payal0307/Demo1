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

	Declare @stockId int,
    Declare @InsertedorderType varchar(10)

	--select stockId=@stockId,InsertedorderType=@InsertedorderType from inserted

    IF @InsertedOrderType = 'Buy'
    BEGIN
        IF EXISTS (SELECT 1 FROM Orders
            WHERE orderType = 'Sell' AND stockId = @stockId
             -- AND @InsertedPrice >= price -- Matching condition
        )
END

--EXEC ExecuteTrade @InsertedUserID, @InsertedStockID, @InsertedPrice, @InsertedQuantity;




----------------------
