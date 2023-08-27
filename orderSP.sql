-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Payal
-- Create date: 2023-08-14
-- Description:	to create sp demo
-- =============================================
CREATE PROCEDURE insertorder
	-- Add the parameters for the stored procedure here
	    @orderID INT,
    @userID INT ,
    @stockID INT,
    @orderType VARCHAR(10) ,
    @quantity INT ,
    @price DECIMAL(18, 2),
    @placedDate DATETIME,
    @status VARCHAR(20),
	@OPtype varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@orderID=3)
	BEGIN
	insert into Orders values(@userID,@stockId,@orderType,@quantity,@price,@placedDate, @status )
	END

	ELSE
	BEGIN
	if(@OPtype='U')
	BEGIN
	update Orders set orderType=@orderType  where @orderID=1
END
	ELSE
	BEGIN
	 if(@OPtype='D')
	BEGIN
	 delete Orders where @orderID=1
	END
    ELSE 
    BEGIN
	select @stockId, @orderType
        from Orders;
		END

end
end
END
GO
DECLARE @userID int,@stockId int, @orderType VARCHAR(10) , @quantity INT,@price DECIMAL(18, 2), @placedDate DATETIME, @status VARCHAR(20);
set @userID=1
SET @StockId=1;
set @orderType='sell';
set @quantity =5;
set @price =143.00;
set @placedDate=getdate();
set @status='completed';

exec insertorder 3,@userID,@StockId,@orderType,@quantity,@price,@placedDate,@status,'A';

--select * from PriceHistory
--use stockMarketDB1
select * from Orders
select * from Balances

