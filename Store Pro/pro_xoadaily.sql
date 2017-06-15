CREATE PROCEDURE XoaDaiLy
	@MaDaiLy varchar(5)
AS
BEGIN
	DELETE DaiLy
	WHERE MaDaiLy = @MaDaiLy;
END