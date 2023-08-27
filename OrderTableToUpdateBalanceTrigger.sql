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
CREATE TRIGGER AfterInsertOrder  ------order table to update balance table
ON Orders
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @cost DECIMAL(18, 2);
    DECLARE @userID INT;
    DECLARE @orderType NVARCHAR(10);


    SELECT @userID = userID, @orderType = OrderType
    FROM inserted;
	IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE  Status = 'completed'
    )
    BEGIN
        IF @orderType = 'buy'
        BEGIN
            SELECT @cost = quantity * price
            FROM inserted;
            UPDATE Balances SET amount = amount - @cost WHERE userID = @userID;
        END
        ELSE IF @orderType = 'sell'
		BEGIN
            SELECT @cost = quantity * price
            FROM inserted;
            UPDATE Balances SET amount = amount + @cost WHERE userID = @userID;
        END
    END
END;
--use stockMarketDB1
-- INSERT INTO Orders VALUES   ( 1, 1, 'sell', 5, 150.25, getdate(),  'Completed')
select * from Orders