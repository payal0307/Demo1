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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE insertstock
   @stockID int ,
   @symbol varchar(10),
    @stockName varchar(100),
	 @sector VARCHAR(50),
    @Industry VARCHAR(50),
    @OPtype varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@stockID=4)
	BEGIN
	insert Stocks values(@symbol, @stockName,@sector,@Industry);
	END

	ELSE
	BEGIN
	if(@OPtype='U')
	BEGIN
	update Stocks set stockName=@stockName where @stockID = 0;
	END
	ELSE
	BEGIN
	 if(@OPtype='D')
	BEGIN
	 delete Stocks WHERE stockID=0
	END
    ELSE 
    BEGIN
	 select stockName
        from Stocks;
		END

end
end
END
GO
DECLARE @symbol varchar(10), @stockName varchar(100), @sector VARCHAR(50), @Industry VARCHAR(50);
SET @symbol='AMZN';
SET @stockName='Amazon.com, Inc.';
set @sector='technology';
set @Industry='software';
exec insertstock 1,@symbol,@stockName,@sector,@Industry,'S'
--select * from Stocks
--use stockMarketDB