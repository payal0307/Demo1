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
CREATE TRIGGER AfterDeleterecord
ON Transactions
AFTER delete
AS
BEGIN
    SET NOCOUNT ON;
	declare @stockId int;
	declare @transactiontype varchar(10);
	declare @quentity int;

	select trsnsactionType=@transactiontype,quentity=@quentity;

	if @transactionType = 'sell' and @quentity=0
	begin	
	delete from Stocks where stockId=stockId
	end 
	
	


END
go
--use stockMarketDB1
-- INSERT INTO Orders VALUES( 1, 1, 'sell', 5, 150.25, getdate(), 'executed')
--select * from Balances
