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
create PROCEDURE insertrecord
   @balanceId int ,
   @userID int,
    @amount decimal(18,2),
	@lastUpdated DATETIME,
    @OPtype varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@balanceId=3)
	BEGIN
	insert Balances values(@userID, @amount,@lastUpdated);
	END

	ELSE
	BEGIN
	if(@OPtype='U')
	BEGIN
	update Balances set userID=@userID where @balanceId = 0;
	END
	ELSE
	BEGIN
	 if(@OPtype='D')
	BEGIN
	 delete Balances WHERE @balanceId=0
	END
    ELSE 
    BEGIN
	 select amount, lastUpdated
        from Balances;
		END

end
end
END
GO
DECLARE @userID int, @amount decimal(18,2),@lastUpdated DATETIME;
SET @userID=1;
SET @amount=15000;
set @lastUpdated='2023-08-26';
exec insertrecord 3,@userID,@amount,@lastUpdated,'A'
--select * from 
--use stockMarketDB1