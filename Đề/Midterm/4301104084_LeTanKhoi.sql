/*----------------------------------------------------------
MASV: 43.01.104.084
HO TEN: Lê Tấn Khôi
MA ĐE: 	1			-	CA THI: Lớp t3
----------------------------------------------------------*/


Create database dbHoatHinh_4301104084
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiNhanVat](
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[NhomPhuTrach] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiNhanVat] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVat](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[NamSinh] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[LoaiNV] [varchar](10) NOT NULL,
 CONSTRAINT [PK_NhanVat] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[LoaiNhanVat] ([MaLoai], [TenLoai], [SoLuong], [NhomPhuTrach]) VALUES (N'HH', N'Nhân vật hoạt hình', 4, N'Moji Aniamation Group')
INSERT [dbo].[LoaiNhanVat] ([MaLoai], [TenLoai], [SoLuong], [NhomPhuTrach]) VALUES (N'PH', N'Nhân vật trong phim', 2, N'Ajka Mata')
INSERT [dbo].[LoaiNhanVat] ([MaLoai], [TenLoai], [SoLuong], [NhomPhuTrach]) VALUES (N'ST', N'Nhân vật ticker', 3, N'Group Prokiss')
SET IDENTITY_INSERT [dbo].[NhanVat] ON 

INSERT [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (1, N'Tonton', 0, 2014, N'icon chat gia đình Tonton', N'ST')
INSERT [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (2, N'Qoobee', 0, 2017, N'icon chat con rồng lai ong vui vẻ', N'ST')
INSERT [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (3, N'Kitty', 1, 1998, N'hoạt hình Kitty', N'HH')
INSERT [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (4, N'Nemo', 0, 1997, N'phim truy tìm Nemo', N'PH')
INSERT [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (5, N'Daisy', 1, 1990, N'hoạt hình vịt Donal', N'HH')
INSERT [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (6, N'Donal', 0, 1990, N'hoạt hình vịt Donal', N'HH')
INSERT [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (7, N'Hippo', 0, 1998, N'icon chat chú hà mã dễ thương', N'ST')
INSERT [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (8, N'Ferdinand', 0, 2016, N'phim ferdinand phiêu lưu ký ', N'PH')
INSERT [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (9, N'Minion', 1, 2000, N'kẻ cắp mặt trăng', N'HH')
SET IDENTITY_INSERT [dbo].[NhanVat] OFF
ALTER TABLE [dbo].[NhanVat]  WITH CHECK ADD  CONSTRAINT [FK_NhanVat_LoaiNhanVat] FOREIGN KEY([LoaiNV])
REFERENCES [dbo].[LoaiNhanVat] ([MaLoai])
GO
ALTER TABLE [dbo].[NhanVat] CHECK CONSTRAINT [FK_NhanVat_LoaiNhanVat]
GO

/*Câu 1:
Viết transaction để thêm một Nhân vật mới với các tham số tương ứng,
dữ liệu thí sinh tự cho (Yêu cầu kiểm tra khóa chính, khóa ngoại nếu có).
*/
begin transaction trans_c1
if not exists (select MaNV from NhanVat where MaNV = 69) 
	insert [dbo].[NhanVat] ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (69, N'Victor', 0, 2014, N'icon chat Victor Charlie', N'HH')
else
	raiserror (N'Mã nhân vật đã tồn tại',16,1)
commit
SET IDENTITY_INSERT [dbo].[NhanVat] on




/*Câu 2:
Viết Trigger không cho thay đổi thông tin Loại nhân vật đã có nhập dữ liệu tham chiếu và viết lệnh kiểm tra
sự hoạt động của Trigger trên.
*/
CREATE TRIGGER trig_c2
ON NhanVat instead of update 
AS
if update (LoaiNV)
BEGIN
	DECLARE @loainv nvarchar(30)
	select  @loainv=LoaiNV FROM deleted
	IF exists (SELECT LoaiNV FROM  NhanVat where @loainv = LoaiNV)
	BEGIN
		ROLLBACK TRANSACTION
		DECLARE @Errmsg nvarchar(100)
		SELECT @Errmsg = N'Không được sửa! ' +@loainv+ N' đã tồn tại!'
		RAISERROR(@Errmsg,15,2)
	END
END
GO
--drop trigger trig_c2
--testcase
use master
go
update NhanVat 
set LoaiNV = N'VC' where MaNV = 1
go




/*Câu 3:
Viết store procedure - sử dụng con trỏ để in danh sách Nhân vật với tham số Loại Nhân Vật (Mã loại) và viết lệnh gọi store vừa viết với tham số tương ứng, thông tin gồm: 
Tên nhân vật:_____ , mã số:_______, tuổi: ______, ghi chú: ______
Trong đó tuổi nhân vật được tính tới thời điểm hiện tại (tương ứng năm sinh)
*/
CREATE PROCEDURE proc_c3 @MaLoai varchar(10) AS
BEGIN
	DECLARE list CURSOR FOR SELECT TenNV, GioiTinh, NamSinh, MaNV FROM NhanVat WHERE LoaiNV = @MaLoai
	DECLARE @TenNV nvarchar(50), @MaSo bit, @NamSinh int, @GhiChu nvarchar(max)
	OPEN list
	WHILE 0=0
	BEGIN
		FETCH NEXT FROM list INTO @TenNV, @MaSo, @NamSinh, @GhiChu
		IF @@FETCH_STATUS <> 0 BREAK
		PRINT(N'Tên nhân vật: '+@TenNV+N', mã số: '+CAST(@MaSo as nvarchar(10))+N', tuổi: '+CAST(year(getdate()) - @NamSinh as nvarchar(10))+', ghi chú: '+@GhiChu)
	END
	CLOSE list
	DEALLOCATE list
END

exec proc_c3 @MaLoai=N'ST'
GO