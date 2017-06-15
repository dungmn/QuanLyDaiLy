CREATE PROCEDURE TimKiemDaiLy
	@MaDaiLy varchar(5)
AS
BEGIN
	SELECT * 
	FROM DaiLy 
	WHERE MaDaiLy = @MaDaiLy
END