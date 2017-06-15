CREATE PROCEDURE SuaDaiLy
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
	UPDATE DaiLy
	SET TenDaiLy = @TenDaiLy,
		MaLoaiDaiLy = @MaLoaiDaiLy,
		DienThoai = @DienThoai,
		DiaChi = @DiaChi,
		MaQuan = @MaQuan,
		NgayTiepNhan = @NgayTiepNhan,
		Email = @Email,
		TienNo = @TienNo
	WHERE MaDaiLy = @MaDaiLy
END