/*----------------------------------------------------------
MASV: 43.01.104.157
HO TEN: LƯƠNG CÔNG TÂM
MA ĐE: ĐỀ 2				-	CA THI: LỚP T3
----------------------------------------------------------*/

CREATE DATABASE [dbHoatHinh_4301104157]
GO
USE [dbHoatHinh_4301104157]
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

/* SCRIPT */

-- CÂU 1
BEGIN TRANSACTION TRANS_LOAINV
IF NOT EXISTS (SELECT MALOAI FROM [dbo].[LoaiNhanVat] WHERE MALOAI LIKE N'EM')
	INSERT [dbo].[LoaiNhanVat] ([MaLoai], [TenLoai], [SoLuong], [NhomPhuTrach])
	VALUES (N'EM',N'Nhân vật Emoji', 3, N'HELLO WORLD Company')
ELSE
	RAISERROR(N'LOẠI NHÂN VẬT ĐÃ TỒN TẠI', 15, 1)
COMMIT
GO

SET IDENTITY_INSERT [dbo].[NhanVat] ON
INSERT [dbo].[NhanVat]  ([MaNV], [TenNV], [GioiTinh], [NamSinh], [GhiChu], [LoaiNV])
VALUES (10, N'Yahoo', 0, 1996, N'Emoticon của Yahoo', N'EM'),
	(11, N'Facebook', 0, 1996, N'Emoticon của Facebook', N'EM'),
	(12, N'Twitter', 0, 1996, N'Emoticon của Twitter', N'EM')
GO
SET IDENTITY_INSERT [dbo].[NhanVat] OFF
GO


--	CÂU 2

--DROP TRIGGER rm_LoaiNhanVat
--GO

CREATE TRIGGER rm_LoaiNhanVat ON [dbo].[LoaiNhanVat]
INSTEAD OF DELETE AS 
BEGIN
	DECLARE @MALOAI VARCHAR(10)
	SELECT @MALOAI=MALOAI FROM deleted
	IF EXISTS (SELECT LOAINV FROM [dbo].[NhanVat] WHERE LOAINV LIKE @MALOAI)
	BEGIN
		DELETE FROM [dbo].[NhanVat] 
		WHERE LOAINV LIKE @MALOAI
	END

	DELETE FROM [dbo].[LoaiNhanVat]
	WHERE MALOAI LIKE @MALOAI
END
GO
-------- TEST --------
DELETE FROM [dbo].[LoaiNhanVat]
WHERE MALOAI LIKE N'EM'
GO

-- CÂU 3
DROP PROCEDURE GETCHARACTERLIST
GO

CREATE PROCEDURE GETCHARACTERLIST(@LOAINV VARCHAR(10))
AS
BEGIN
	DECLARE LIST CURSOR FOR 
		SELECT TENNV, GIOITINH, NAMSINH, GHICHU FROM NHANVAT 
		WHERE LOAINV LIKE @LOAINV
	DECLARE @MSG NVARCHAR(255), @TEN NVARCHAR(50), @GT BIT, @NS INT, @GC NVARCHAR(MAX), @GTINH VARCHAR(6)
	OPEN LIST
	WHILE 0=0
	BEGIN
		FETCH NEXT FROM LIST INTO @TEN, @GT, @NS, @GC
		IF @@FETCH_STATUS<>0 BREAK
		IF @GT = 0 SET @GTINH = 'male'
		ELSE SET @GTINH = 'female'
		SET @MSG = CONCAT(N'Tên nhân vật: ', @TEN, N', giới tính: ', @GTINH, N', năm sinh: ', CAST(@NS AS VARCHAR(5)), N', ghi chú: ', @GC)
		PRINT(@MSG)
	END
	CLOSE LIST
	DEALLOCATE LIST
END
GO

EXEC GETCHARACTERLIST @LOAINV='EM'
GO