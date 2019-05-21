/*----------------------------------------------------------
MASV: 43.01.104.117
HO TEN: Vương Lê Minh Nguyên
MA ĐE: 	2			-	CA THI: LỚP T3
----------------------------------------------------------*/

-- Database Gen Script --
CREATE DATABASE [dbHoatHinh_4301104117]
GO
USE [dbHoatHinh_4301104117]
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



-- Cau 1 --
BEGIN TRANSACTION insertLoaiNhanVat
	IF NOT EXISTS(SELECT MaLoai FROM LoaiNhanVat WHERE MaLoai = N'TT')
		INSERT [dbo].[LoaiNhanVat] ([MaLoai], [TenLoai], [SoLuong], [NhomPhuTrach]) VALUES (N'TT', N'Nhân vật truyện tranh', 4, N'Dreamwork Animation')
	ELSE
		RAISERROR('Violation of primary key constraint!',15,1)
COMMIT
GO

-- Cau 2 --
CREATE TRIGGER deleteNhanVat_onDeleteLoaiNhanVat
ON LoaiNhanVat 
INSTEAD OF DELETE AS
BEGIN
	DELETE FROM [dbo].[NhanVat] WHERE [LoaiNV] in (SELECT [MaLoai] FROM deleted)
	DELETE FROM [dbo].[LoaiNhanVat] WHERE [MaLoai] in (SELECT [MaLoai] FROM deleted)
END
GO
--KIEMTRA--
INSERT [dbo].[NhanVat] ([TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV]) VALUES (N'Batman', 0, 1999, N'Nhân vật chính trong series Batman', N'TT')
GO
DELETE FROM [dbo].[LoaiNhanVat] WHERE [MaLoai] = 'TT'
GO
SELECT * FROM [dbo].[NhanVat]
GO

-- Cau 3 --
CREATE PROCEDURE inNhanVat @MaLoai varchar(10) AS
BEGIN
	DECLARE DSNV CURSOR FOR SELECT TenNV, GioiTinh, NamSinh, GhiChu FROM NhanVat WHERE LoaiNV = @MaLoai
	DECLARE @TenNV nvarchar(50), @GioiTinh bit, @NamSinh int, @GhiChu nvarchar(max), @GTStr nvarchar(10)
	OPEN DSNV
	WHILE 0=0
	BEGIN
		FETCH NEXT FROM DSNV INTO @TenNV, @GioiTinh, @NamSinh, @GhiChu
		IF @@FETCH_STATUS <> 0 BREAK
		IF @GioiTinh = 1
			SELECT @GTStr = N'female'
		ELSE
			SELECT @GTStr = N'male'
		PRINT(N'Tên nhân vật: '+@TenNV+N', giới tính: '+@GTStr+N', năm sinh: '+CAST(@NamSinh as nvarchar(10))+', ghi chú: '+@GhiChu)
	END
	CLOSE DSNV
	DEALLOCATE DSNV
END
GO
--KIEMTRA--
EXEC inNhanVat @MaLoai = N'HH'
GO