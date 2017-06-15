
CREATE PROCEDURE ThemDaiLy
	@MaDaiLy varchar(5),
	@TenDaiLy varchar(30),
	@MaLoaiDaiLy nchar(5),
	@DienThoai int,
	@DiaChi char(50),
	@MaQuan varchar(3),
	@NgayTiepNhan smalldatetime,
	@Email varchar(20),
	@TienNo money
AS
BEGIN
	INSERT INTO DaiLy
	VALUES (@MaDaiLy,
	@TenDaiLy,
	@MaLoaiDaiLy,
	@DienThoai,
	@DiaChi,
	@MaQuan,
	@NgayTiepNhan,
	@Email,
	@TienNo);
END