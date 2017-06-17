create database QuanLyDaiLy
go
use QuanLyDaiLy
go
/*---------------------create table------------------------*/
create table LoaiDaiLy (
	MaLoaiDaiLy varchar(5) primary key,
	TenLoaiDaiLy varchar(50),
	TienNoToiDa money
);
create table Quan (
	MaQuan varchar(3) primary key,
	TenQuan varchar(50),
	SoDaiLyToiDa int
);
create table Account(
	UserName varchar(20) primary key,
	Pass varchar(10) not null
);
create table DaiLy (
	MaDaiLy varchar(5) primary key,
	TenDaiLy varchar(30),
	MaLoaiDaiLy varchar(5),
	DienThoai int,
	DiaChi char(50),
	MaQuan varchar(3),
	NgayTiepNhan smalldatetime,
	Email varchar(20),
	TienNo money
	Foreign key (MaLoaiDaiLy) references LoaiDaiLy(MaLoaiDaiLy),
	Foreign key (MaQuan) references Quan(MaQuan)
);

create table PhieuXuat (
	MaPhieuXuat varchar(5) primary key,
	MaDaiLy varchar(5),
	NgayLapPhieu smalldatetime,
	TongTriGia money,
	Foreign key (MaDaiLy) references DaiLy(MaDaiLy)
);
create table DonVi_MatHang(
	maDV varchar(5) primary key not null,
)
create table MatHang (
	MaMatHang varchar(5) primary key,
	TenMatHang varchar(30),
	DonViTinh varchar(5),
	SoLuongTon int,
	
	constraint FK_DVT_MatHang Foreign key (DonViTinh) references DonVi_MatHang(maDV)
);
 

create table ChiTietPhieuXuat (
	MaChiTietPhieuXuat varchar(5) primary key,
	MaPhieuXuat varchar(5),
	MaMatHang varchar(5),
	DonViTinh varchar(5),
	SoLuongXuat int,
	DonGia money,
	ThanhTien money,
	Foreign key (MaPhieuXuat) references PhieuXuat(MaPhieuXuat),
	Foreign key (MaMatHang) references MatHang(MaMatHang),
	Foreign key (DonViTinh)references DonVi_MatHang(maDV)
);
 
create table PhieuThu (
	MaPhieuThu varchar(5) primary key,
	MaDaiLy varchar(5),
	NgayThuTien smalldatetime,
	SoTienThu money,
	Foreign key (MaDaiLy) references DaiLy(MaDaiLy)
);
create table DoanhSo (
	MaDaiLy varchar(5) not null,
	Thang int not null,
	SoPhieuXuat int,
	TongTriGia money,
	TyLe float
	Primary key(MaDaiLy, Thang),
	Foreign key (MaDaiLy) references DaiLy(MaDaiLy)
);

create table CongNo (
	MaDaiLy varchar(5) not null,
	Thang int not null,
	NoDau money,
	PhatSinh money,
	NoCuoi money,
	Primary key(MaDaiLy, Thang),
	Foreign key (MaDaiLy) references DaiLy(MaDaiLy)
);

create table ToChuc (
	ID varchar(5) primary key,
	SoLoaiDaiLy int,
	SoMatHang int,
	SLDVT int
);
set dateformat dmy;
go
/*---------------------------Insert du lieu-----------------------*/
Insert into ToChuc values ('ID01', 4, 7, 3);
Insert into DonVi_MatHang values ('khau');
Insert into DonVi_MatHang values('chiec');
insert into DonVi_MatHang values('hop');
insert into DonVi_MatHang values('qua');
Insert into LoaiDaiLy values ('LDL01', 'Loai 1',10000000); 
Insert into LoaiDaiLy values ('LDL02', 'Loai 2',20000000);
Insert into LoaiDaiLy values ('LDL03', 'Loai 3',30000000); 
Insert into LoaiDaiLy values ('LDL04', 'Loai 4',40000000);
Insert into LoaiDaiLy values ('LDL05', 'Loai 5',50000000);
Insert into Quan values ('Q01', 'Quan 1',5); 
Insert into Quan values ('Q02', 'Quan 2',4);
Insert into Quan values ('Q03', 'Quan 3',3);
Insert into Quan values ('Q04', 'Quan 4',6);
Insert into Quan values ('Q05', 'Quan 5',3);
Insert into Quan values ('Q06', 'Quan 6',7);
Insert into Quan values ('Q07', 'Quan 7',8);
Insert into DaiLy values ('DL001', 'Dai Ly Nguyet'	,'LDL01', 0912344321, '111 Moc Hy'	, 'Q01', '01/01/2000', 'Nguyet@gmail.com', 0);
Insert into DaiLy values ('DL002', 'Dai Ly Vien'	,'LDL02', 0916344322, '121 Le Loi'	, 'Q02', '01/01/2001', 'Vien@gmail.com', 0);
Insert into DaiLy values ('DL003', 'Dai Ly Chi'		,'LDL03', 0912644323, '1 Trang Uyen', 'Q03', '01/01/2002', 'Chi@gmail.com', 0);
Insert into DaiLy values ('DL004', 'Dai Ly Da'		,'LDL04', 0912312324, '7 Nguyen Hue', 'Q04', '01/01/2003', 'Da@gmail.com', 0);
Insert into DaiLy values ('DL005', 'Dai Ly Tu'		,'LDL01', 0912344325, '14 Luong vi'	, 'Q05', '01/01/2004', 'Tu@gmail.com', 0);
Insert into DaiLy values ('DL006', 'Dai Ly Cam'		,'LDL02', 0912344326, '11 Yasuo'	, 'Q06', '01/01/2005', 'Cam@gmail.com', 0);
Insert into DaiLy values ('DL007', 'Dai Ly Chi'		,'LDL03', 0912372427, '6 Phu My Hung', 'Q07', '01/01/2006', 'Chi@gmail.com', 0);
Insert into DaiLy values ('DL008', 'Dai Ly Dinh'	,'LDL04', 0912554481, '21 Tran Phu'	, 'Q01', '01/01/2007', 'Dinh@gmail.com', 0);
Insert into DaiLy values ('DL009', 'Dai Ly Nhat'	,'LDL01', 0912344329, '161 Hazard'	, 'Q02', '01/01/2008', 'Nhat@gmail.com', 0);
Insert into DaiLy values ('DL010', 'Dai Ly Kiem'	,'LDL02', 0918634320, '26 Chelsea'	, 'Q03', '01/01/2009', 'Kiem@gmail.com', 0);
Insert into DaiLy values ('DL011', 'Dai Ly Tay'		,'LDL03', 0912348210, '19 Mig-21'	, 'Q04', '01/01/2010', 'Tay@gmail.com', 0);
Insert into DaiLy values ('DL012', 'Dai Ly Lai'		,'LDL04', 0912344721, '113 Chu Tuoc', 'Q05', '01/01/2011', 'Lai@gmail.com', 0);
Insert into DaiLy values ('DL013', 'Dai Ly Thien'	,'LDL01', 0912343922, '13 Nghiet Bo', 'Q06', '01/01/2012', 'Thien@gmail.com', 0);
Insert into DaiLy values ('DL014', 'Dai Ly Ngoai'	,'LDL02', 0912346623, '9 Phu My Hung', 'Q07', '01/01/2013', 'Ngoai@gmail.com', 0);
Insert into DaiLy values ('DL015', 'Dai Ly Phi'		,'LDL03', 0941834424, '123 Ve Doanh', 'Q01', '01/01/2014', 'Phi@gmail.com', 0);
Insert into DaiLy values ('DL016', 'Dai Ly Tien'	,'LDL04', 0923473296, '7 Tieu Mac Ca', 'Q02', '01/01/2015', 'Tien@gmail.com', 0);
Insert into DaiLy values ('DL017', 'Dai Ly Test'	,'LDL04', 0923473296, '7 Tieu Mac Ca', 'Q03', '01/01/2015', 'Tien@gmail.com', 0);
Insert into MatHang values ('MH001', 'AK-47', 'khau', 100);
Insert into MatHang values ('MH002', 'Bazoka', 'khau', 100);
Insert into MatHang values ('MH003', 'Luu Dan', 'qua', 200);
Insert into MatHang values ('MH004', 'T-14 Armata', 'chiec', 10);
Insert into MatHang values ('MH005', 'Tu-160 Blackjack', 'chiec', 5);
Insert into MatHang values ('MH006', 'S-400 Triumf', 'hop', 8);
Insert into MatHang values ('MH007', 'Molniya 1241.8', 'chiec', 3);
Insert into PhieuXuat values ('MPX01', 'DL001', '26/12/2015' , null);
Insert into PhieuXuat values ('MPX02', 'DL001', '26/01/2016' , null);
Insert into PhieuXuat values ('MPX03', 'DL001', '26/02/2016' , null);
Insert into PhieuXuat values ('MPX04', 'DL001', '26/03/2016' , null);
Insert into PhieuXuat values ('MPX05', 'DL001', '26/04/2016' , null);
Insert into PhieuXuat values ('MPX06', 'DL001', '26/05/2016' , null);
Insert into PhieuXuat values ('MPX07', 'DL001', '26/06/2016' , null);
Insert into PhieuXuat values ('MPX08', 'DL001', '26/07/2016' , null);
Insert into PhieuXuat values ('MPX09', 'DL001', '26/08/2016' , null);
Insert into PhieuXuat values ('MPX10', 'DL001', '26/09/2016' , null);
Insert into PhieuXuat values ('MPX11', 'DL001', '26/10/2016' , null);
Insert into PhieuXuat values ('MPX12', 'DL001', '26/11/2016' , null);
Insert into PhieuXuat values ('MPX13', 'DL001', '26/12/2016' , null);
Insert into PhieuXuat values ('MPX14', 'DL001', '26/01/2017' , null);
insert into ChiTietPhieuXuat (MaChiTietPhieuXuat,MaPhieuXuat , MaMatHang, DonViTinh,SoLuongXuat,DonGia ) values ( 'CTX01','MPX01', 'MH001', 'khau', 25, 900);
insert into PhieuThu values ('PT001', 'DL001', '26/2/2017', 10000);
insert into Account values ('admin','admin');
insert into Account values ('test','test');



/*-------------------------------------------------------------------------------*/
/*so dai ly toi da tron quan*/
go
create trigger MaxDLInQuan_update
on Quan
for UPDATE
as 
	if UPDATE(SoDaiLyToiDa)
	Begin
	declare @sodaily int, @sodailytoida int
	set @sodailytoida=(select SoDaiLyToiDa from INSERTED)
	set @sodaily=(select count(distinct MaDaiLy) from DaiLy, INSERTED where DaiLy.MaQuan = INSERTED.MaQuan)
	if (@sodailytoida < @sodaily)
		begin
		print 'so loai dai ly toi da phai >= '+ cast(@sodaily as varchar(4)) + ' (so loai dai ly co san trong database)'
		rollback
		end
	end
GO

create trigger MaxDLInQuan_insert
on DaiLy
for INSERT
as
	Begin
	declare @sodaily int, @sodailytoida int
	set @sodailytoida = (select SodaiLyToiDa from INSERTED, Quan where INSERTED.MaQuan=Quan.MaQuan)
	set @sodaily = (select count(distinct DaiLy.MaDaiLy) from DaiLy, INSERTED where DaiLy.MaQuan=INSERTED.MaQuan)
	if (@sodaily > @sodailytoida)
		Begin
		print 'so dai ly <= '+ cast(@sodailytoida as varchar(4)) + ' (so dai ly toi da trong quan)'
		rollback 
		End
	End

GO

/*so mat hang toi da*/
create trigger MaxMatHang_update
on Tochuc
for UPDATE
as 
	if UPDATE(SoMatHang)
	Begin
	declare @somathang int, @somathangtoida int
	set @somathangtoida=(select SoMatHang from INSERTED)
	set @somathang=(select count(distinct MaMatHang) from MatHang)
	if (@somathangtoida < @somathang)
		begin
		print 'so mat hang toi da phai >= '+ cast(@somathang as varchar(4)) + ' (so mat hang co san trong database)'
		rollback
		end
	end
GO

create trigger MaxMatHang_insert
on MatHang
for INSERT
as
	Begin
	declare @somathang int, @somathangtoida int
	set @somathangtoida = (select SoMatHang from ToChuc)
	set @somathang=(select count(distinct MaMatHang) from MatHang)
	if (@somathang > @somathangtoida)
		Begin
		print 'so mat hang <= '+ cast(@somathangtoida as varchar(4)) + ' (so mat hang toi da)'
		rollback
		End
	End
GO

create trigger TienThu_insert
on PhieuThu
for INSERT
as 
	Begin
		declare @SoTien money, @SoTienNo money, @MaDaiLy varchar(5)

		set @SoTien = (select SoTienThu 
					   from INSERTED)
		set @SoTienNo = (select TienNo 
						 from DaiLy, INSERTED
						 where INSERTED.MaDaiLy = DaiLy.MaDaiLy)
		set @MaDaiLy = (select MaDaiLy
						from inserted
						)
						 
		if (@SoTien > @SoTienNo)
			Begin
				print 'So tien thu phai <= so tien no'
				rollback transaction
			End
		else
			Begin
				 update DaiLy
				 set DaiLy.TienNo = DaiLy.TienNo - @SoTien
				 where DaiLy.MaDaiLy = @MaDaiLy
			End
	End
GO


create trigger TienThu_update
on PhieuThu
for UPDATE
as
	Begin 
		declare @SoTien int, @SoTienNo int
		set @SoTien = (select SoTienThu 
					   From INSERTED)
		set @SoTienNo = (select TienNo	
						 from INSERTED, DaiLy
						 where INSERTED.MaDaiLy = DaiLy.MaDaiLy)
		if (@SoTien > @SoTienNo)
			Begin
				print  'So tien thu phai <= so tien no'
				rollback transaction
			End 
	End
GO



/*cho mat hang, Don gia*/
/*-------------so luong ton trong MatHang---------------------------------*/
create trigger soluongton_insert
on ChiTietPhieuXuat
for INSERT
as
	Begin
	declare @soluongxuat int, @soluongton int
	set @soluongxuat = (select SoLuongXuat from INSERTED)
	set @soluongton = (select SoLuongTon from MatHang, INSERTED where MatHang.MaMatHang=INSERTED.MaMatHang)
	if (@soluongton < @soluongxuat)
		Begin
		print 'so luong xuat <= so luong ton (= ' + cast(@soluongton as varchar(5)) +')'
		rollback
		End
	else 
		Begin
		Update MatHang
		set SoLuongTon = @soluongton - @soluongxuat
		from MatHang, INSERTED
		where MatHang.MaMatHang = INSERTED.MaMatHang
		End
	end
GO

create trigger ThanhTien_CTPX
on ChiTietPhieuXuat
for INSERT
as
	Begin
		declare @ThanhTien_root int, @SoLuong int, @DonGia int, @mactpx varchar(5), @MaPX varchar(5)
		
		set @DonGia = (select ctpx.DonGia 
						from ChiTietPhieuXuat as ctpx, inserted 
						where inserted.MaChiTietPhieuXuat = ctpx.MaChiTietPhieuXuat)
		set @SoLuong = (select ctpx.SoLuongXuat
						from ChiTietPhieuXuat as ctpx, inserted
						where inserted.MaChiTietPhieuXuat = ctpx.MaChiTietPhieuXuat)
		set @mactpx = (select MaChiTietPhieuXuat
					   from inserted)
		set @MaPX = (select MaPhieuXuat
					 from inserted)

		update ChiTietPhieuXuat
		set ThanhTien = @DonGia * @SoLuong
		where ChiTietPhieuXuat.MaChiTietPhieuXuat = @mactpx

		update DaiLy
		set Daily.TienNo = DaiLy.TienNo + @DonGia * @SoLuong
		where DaiLy.MaDaiLy = (select px.MaDaiLy
							   from PhieuXuat as px
							   where px.MaPhieuXuat = @mapx)

	End

go


go
create trigger PhieuXuat_Insert 
on ChiTietPhieuXuat
for insert
as 
	Begin
		declare @TongTriGia_root money, @ThanhTien money, @MaPhieuXuat varchar(5)
		
		set @ThanhTien = (select ThanhTien from inserted)
		set @TongTriGia_root = (select P.TongTriGia 
								from PhieuXuat as P, inserted 
								where P.MaPhieuXuat = inserted.MaPhieuXuat
								) 
		if (@TongTriGia_root is null ) 
			Begin 
				set @TongTriGia_root = 0 
			End
		update PhieuXuat
			set TongTriGia = @TongTriGia_root + @ThanhTien
			where MaPhieuXuat in (select MaPhieuXuat from inserted)
	 
			
	End
	go
create trigger soluongton_update
on ChiTietPhieuXuat
for UPDATE
as
	if (UPDATE (SoLuongXuat))
	Begin
	declare @new_soluongxuat int, @old_soluongxuat int, @soluongton int
	set @new_soluongxuat = (select SoLuongXuat from INSERTED)
	set @old_soluongxuat = (select SoLuongXuat from DELETED)
	set @soluongton = @old_soluongxuat + (select SoLuongTon from MatHang, INSERTED where MatHang.MaMatHang=INSERTED.MaMatHang)
	if (@soluongton < @new_soluongxuat)
		Begin
		print 'so luong xuat <= so luong ton (= ' + cast(@soluongton as varchar(5))
		rollback
		End
	else 
		Begin
		Update MatHang
		set SoLuongTon = @soluongton - @new_soluongxuat
		from MatHang, INSERTED
		where MatHang.MaMatHang = INSERTED.MaMatHang
		End
	end
GO
create trigger soluongton_delete
on ChiTietPhieuXuat
for DELETE
as
	Begin
		declare @soluongxuat int
		select @soluongxuat = SoLuongXuat from DELETED
		Update MatHang
		set SoLuongTon = SoLuongTon + @soluongxuat
		from MatHang
		where MaMatHang in (select MaMatHang from DELETED)
	End

/*-----------no cuoi = phat sinh + no dau ------------------------------*/
go
create trigger NoCuoi_CongNo_insert
on CongNo
for insert
as
	Begin
		declare @no money, @phatsinh money
		select @no = C.Nocuoi from CongNo C, INSERTED I where (I.Thang - 1 = C.Thang) AND (I.MaDaiLy=C.MaDaiLy)
		select @phatsinh = PhatSinh from INSERTED
		if (@no is NULL)
			Begin
			set @no = 0
			End
		UPDATE CongNo
		set NoDau = @no, NoCuoi = Nodau + @phatsinh
		where MaDaiLy in (select MaDaiLy from INSERTED) AND Thang in (select Thang from INSERTED)
	End

GO
create trigger NoCuoi_CongNo_update
on CongNo
for update
as
	Begin
	declare @no money, @phatsinh money
	select @no = C.Nocuoi from CongNo C, INSERTED I where (I.Thang - 1 = C.Thang) AND (I.MaDaiLy=C.MaDaiLy)
	select @phatsinh = PhatSinh from INSERTED
	if (@no is NULL) Begin set @no = 0 End
	
	UPDATE CongNo
	set NoDau = @no, NoCuoi = @no + @phatsinh
	where MaDaiLy in (select MaDaiLy from INSERTED) AND Thang in (select Thang from INSERTED)
	End
go
/*------------------------------------------------------*/
/*-----Phat sinh = tong xuat - tong thu ---------------*/
create trigger Phatsinh_update_PhieuThu
on PhieuThu
for insert, update
as
	Begin
	declare @thang int, @tongtienthu money, @tongtienxuat money
	select @thang = MONTH(NgayThuTien) from inserted
	select @tongtienthu = sum(P.Sotienthu) from PhieuThu P, INSERTED I where Month(P.NgayThuTien) = @thang AND P.MaDaiLy=I.MaDaiLy
	select @tongtienxuat = TongTriGia from DoanhSo D, INSERTED I where D.Thang=@thang AND D.MaDaiLy=I.MaDaiLy
	if (@tongtienthu is null) Begin set @tongtienthu=0 End
	if (@tongtienxuat is null) Begin set @tongtienxuat=0 End
	UPDATE CongNo
	set PhatSinh = @tongtienxuat - @tongtienthu
	where Thang=@thang AND MaDaiLy in (select MaDaiLy from INSERTED)
	End

go

create trigger Phatsinh_update_Doanhso
on DoanhSo
for insert, update
as
	Begin
	declare @thang int, @tongtienthu money, @tongtienxuat money
	select @thang = Thang from inserted
	select @tongtienthu = sum(P.Sotienthu) from PhieuThu P, INSERTED I where Month(P.NgayThuTien) = @thang AND P.MaDaiLy=I.MaDaiLy
	select @tongtienxuat = TongTriGia from INSERTED
	if (@tongtienthu is null) Begin set @tongtienthu=0 End
	if (@tongtienxuat is null) Begin set @tongtienxuat=0 End
	UPDATE CongNo
	set PhatSinh = @tongtienxuat - @tongtienthu
	where Thang=@thang AND MaDaiLy in (select MaDaiLy from INSERTED)
	End
/*-----------------------------------------------------------------------*/
/*-----------------------QUAN_TRONG----------------------------------------*/ 
/*-------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------*/

/* Thanh tien = donGia * SoLuong */
go

create trigger ThanhTien_CTPX
on ChiTietPhieuXuat
for INSERT,update
as
	Begin
		declare @ThanhTien_root int, @SoLuong int, @DonGia int, @mactpx varchar(5), @MaPX varchar(5)
		
		set @DonGia = (select ctpx.DonGia 
						from ChiTietPhieuXuat as ctpx, inserted 
						where inserted.MaChiTietPhieuXuat = ctpx.MaChiTietPhieuXuat)
		set @SoLuong = (select ctpx.SoLuongXuat
						from ChiTietPhieuXuat as ctpx, inserted
						where inserted.MaChiTietPhieuXuat = ctpx.MaChiTietPhieuXuat)
		set @mactpx = (select MaChiTietPhieuXuat
					   from inserted)
		set @MaPX = (select MaPhieuXuat
					 from inserted)

		update ChiTietPhieuXuat
		set ThanhTien = @DonGia * @SoLuong
		where ChiTietPhieuXuat.MaChiTietPhieuXuat = @mactpx

		update DaiLy
		set Daily.TienNo = DaiLy.TienNo + @DonGia * @SoLuong
		where DaiLy.MaDaiLy = (select px.MaDaiLy
							   from PhieuXuat as px
							   where px.MaPhieuXuat = @mapx)

	End

go

go
create trigger PhieuXuat_Insert 
on ChiTietPhieuXuat
for insert,update
as 
	Begin
		declare @TongTriGia_root money, @ThanhTien money, @MaPhieuXuat varchar(5)
		
		set @ThanhTien = (select ThanhTien from inserted)
		set @TongTriGia_root = (select P.TongTriGia 
								from PhieuXuat as P, inserted 
								where P.MaPhieuXuat = inserted.MaPhieuXuat
								) 
		if (@TongTriGia_root is null ) 
			Begin 
				set @TongTriGia_root = 0 
			End
		update PhieuXuat
			set TongTriGia = @TongTriGia_root + @ThanhTien
			where MaPhieuXuat in (select MaPhieuXuat from inserted)
	 
			
	End


/*TRigger cho phan PHieu Xuat. THong bao cho nguoi dung nhap sai, va yeu cau ho nhap lai gia tri tong tien*/
go
create trigger TongTriGia_PhieuXuat_insert
on PhieuXuat 
for   insert, update
as
	Begin 
		declare @TongTriGia int, @rootTongGia int, @maPX varchar(5)
		set @TongTriGia = (select sum(ChiTietPhieuXuat.ThanhTien)
							   from INSERTED, ChiTietPhieuXuat
							   where INSERTED.MaPhieuXuat = ChiTietPhieuXuat.MaPhieuXuat
							  )
		set @maPX = (select MaPhieuXuat 
					 from inserted)

		update PhieuXuat
		set PhieuXuat.TongTriGia = @TongTriGia
		where PhieuXuat.MaPhieuXuat = @maPX
		
	End
GO



create trigger TongTriGia_PhieuXuat_update
on PhieuXuat 
for UPDATE
as 
	Begin 
		declare @TongTriGia int, @rootTongGia int
		set @TongTriGia = (select sum(ChiTietPhieuXuat.ThanhTien)
							   from INSERTED, ChiTietPhieuXuat
							   where INSERTED.MaPhieuXuat = ChiTietPhieuXuat.MaPhieuXuat
							  )
		set @rootTongGia = (select TongTriGia	
							from INSERTED	
							) 
		if (@TongTriGia != @rootTongGia)
			Begin
				print'Vui long nhap lai. Tong Tri Gia: ' + cast(@TongTriGia as varchar(30))
				rollback transaction
			End
	End
GO	
 
/*-------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------*/
 go
create PROCEDURE ThemDaiLy
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
	if not exists (select top 1 *from DaiLy where MaDaiLy=@MaDaiLy)
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
go
CREATE PROCEDURE USP_XOADAILY 
@MaDaiLy varchar(5)
as 
BEGIN
	DELETE DaiLy WHERE MaDaiLy=@MaDaiLy
END 
GO
CREATE PROCEDURE USP_SUADAILY 
	@MaDaiLy CHAR(5),
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
	IF  EXISTS (SELECT TOP 1 * FROM LoaiDaiLy WHERE MaLoaiDaiLy=@MaLoaiDaiLy) AND EXISTS(SELECT TOP 1 * FROM QUAN WHERE MaQuan=@MaQuan)
	UPDATE DaiLy 
	SET TenDaiLy=@TenDaiLy,MaLoaiDaiLy=@MaLoaiDaiLy,DienThoai=@DienThoai,DiaChi=@DiaChi,MaQuan=@MaQuan,NgayTiepNhan=@NgayTiepNhan,Email=@Email,TienNo=@TienNo
	WHERE MaDaiLy=@MaDaiLy
END
GO
CREATE PROCEDURE USP_SEARCH 
@KEY VARCHAR (30)
AS
BEGIN
	SELECT * FROM DaiLy WHERE MaDaiLy LIKE (@KEY) OR TenDaiLy  LIKE (@KEY) OR MaLoaiDaiLy LIKE (@KEY) OR DienThoai LIKE (@KEY) OR DIACHI LIKE (@KEY)
	OR MaQuan LIKE (@KEY) OR Email LIKE (@KEY)
END
GO
CREATE PROCEDURE USP_SUA_SLDL
@SL INT,
@MaQuan varchar(5)
AS
BEGIN 
	UPDATE Quan
	SET SoDaiLyToiDa = @SL 
	where MaQuan = @MaQuan
END
GO
CREATE PROCEDURE USP_SUA_SLMATHANG
@SL INT
AS
BEGIN
	UPDATE ToChuc
	SET SoMatHang = @SL 
END
GO
CREATE PROCEDURE USP_SUA_SLDVT
@SL INT
AS
BEGIN
	UPDATE ToChuc
	SET SLDVT = @SL
END
GO
CREATE PROCEDURE USP_SUA_SOLOAIDAILY
@SL INT 
AS
BEGIN
	UPDATE ToChuc
	SET SoLoaiDaiLy = @SL
END 
GO
CREATE PROCEDURE USP_MATHANG 
AS 
BEGIN
	SELECT * FROM MatHang 
END
GO

create PROCEDURE USP_NHAPPHIEUXUAT 
@MaPX char(8),
@MaDaiLy char(5),
@NgayLapPhieu smalldatetime
AS 
BEGIN
	if exists (select top 1 MaDaiLy from DaiLy where MaDaiLy=@MaDaiLy) and not exists (select top 1 * from PhieuXuat where MaPhieuXuat=@MaPX )
	INSERT INTO PhieuXuat VALUES (@MaPX,@MaDaiLy,@NgayLapPhieu,null)
END
GO
CREATE PROCEDURE USP_NHAPCTPX 
@MaCTX varchar(5),
@MaPX varchar(5),
@MaMatHang varchar(5),
@DVT varchar(5),
@SL int,
@DonGia money
AS 
BEGIN
	IF EXISTS (SELECT TOP 1 * FROM PhieuXuat WHERE MaPhieuXuat = @MaPX) and not exists(select top 1 * from ChiTietPhieuXuat where MaChiTietPhieuXuat=@MaCTX)
	insert into ChiTietPhieuXuat  values (@MaCTX ,@MaPX, @MaMatHang, @DVT, @SL, @DonGia,null);
END
GO
CREATE PROCEDURE USP_CTPX 
@MaPX char(3)
AS 
BEGIN
	SELECT * FROM ChiTietPhieuXuat WHERE MaPhieuXuat=@MaPX 
END
GO

CREATE PROCEDURE USP_SUA_CTPX
@MaCTPX varchar(5),
@SL int,
@DonGia money
AS
BEGIN
	UPDATE ChiTietPhieuXuat
	SET SoLuongXuat=@SL , DonGia = @DonGia
	where MaChiTietPhieuXuat=@MaCTPX
END
GO
CREATE PROCEDURE USP_XOA_CTPX
@MaCTPX varchar(5)
AS 
BEGIN
	DELETE ChiTietPhieuXuat WHERE MaChiTietPhieuXuat=@MaCTPX
END
GO

CREATE PROCEDURE USP_THEM_PHIEUTHU
@MaPhieuThu varchar(5),
@MaDaiLy varchar(5),
@NgayThu smalldatetime,
@SoTien money
AS
 BEGIN
	IF NOT EXISTS (SELECT * FROM PhieuThu WHERE MaPhieuThu=@MaPhieuThu)
	INSERT INTO PhieuThu VALUES (@MaPhieuThu,@MaDaiLy,@NgayThu,@SoTien)
 END
 GO
 CREATE PROCEDURE USP_CHECKACCOUNT
 @ID varchar(30),
 @pass varchar(10)
 AS
 BEGIN 
	SELECT * FROM Account WHERE UserName =@ID and Pass = @pass
 END
 GO



 select *
 from PhieuXuat

 select * 
 from ChiTietPhieuXuat

 select * 
 from PhieuThu
 select * from PhieuThu
 select *
 from DaiLy
 Insert into DaiLy values ('L' ,'Dai Ly Nguyet'	,'LDL01', 0912344321, '111 Moc Hy'	, 'Q07', '01/01/2000 12:00:00', 'Nguyet@gmail.com', 0);
 INSERT INTO PhieuXuat (MaPhieuXuat,MaDaiLy,NgayLapPhieu) VALUES ('MPX15','DL001','12-3-2017')
 delete ChiTietPhieuXuat
 exec USP_NHAPCTPX 'cx005','MPX01','MH004','chiec', 12 , 5000
 insert into ChiTietPhieuXuat values ('cx005','MPX01','MH004','chiec', 12 , 5000,null);
 insert into ChiTietPhieuXuat values ( 'CTX05','MPX01', 'MH001', 'khau', 25, 900,null);
 Select top 1 * from DaiLy
 insert into PhieuThu values ('PT002','DL001','12-03-2017',5000)