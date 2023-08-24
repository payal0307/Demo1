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
create PROCEDURE ManageStock5
   @stockid int ,
   @stockSymbol varchar(10),
    @stockName varchar(100),
    @OPtype varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@stockid=0)
	BEGIN
	insert intoStocks values(@stockSymbol, @stockName,);
	END

	ELSE
	BEGIN
	if(@OPtype='U')
	BEGIN
	update Stocks set stockSymbol = @stockSymbol,stockName=@stockName where @stockid = 0;
	END
	ELSE
	BEGIN
	 if(@OPtype='D')
	BEGIN
	 delete Stocks WHERE stockid=0
	END
    ELSE 
    BEGIN
	 select stockName, stockSymbol
        from Stocks;
		END

end
end
END
GO
DECLARE @stockSymbol varchar(10), @stockName varchar(25);
SET @stockSymbol='AMZN';
SET @stockName='Amazon.com, Inc.';
exec ManageStock 1,@stockSymbol,@stockName,'A'
--select * from Stocks
--use stockMarketDB