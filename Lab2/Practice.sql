USE QLBongDa
GO

--23--
CREATE RULE r_VITRI
	AS @ViTri IN (N'Thủ môn', N'Tiền đạo', N'Tiền vệ', N'Trung vệ', N'Hậu vệ')
GO
SP_BINDRULE 'r_VITRI', 'CAUTHU.ViTri'
GO

--27--
CREATE VIEW __27__ AS
SELECT MaCT, HoTen, NgaySinh, DiaChi, ViTri
FROM CAUTHU inner join CAULACBO on CAUTHU.MaCLB = CAULACBO.MaCLB
			inner join QUOCGIA on CAUTHU.MaQG = QUOCGIA.MaQG
WHERE TENCLB like N'SHB Đà Nẵng' and TenQG like N'Bra-xin'
GO

--35--
CREATE PROCEDURE __35__(@ten nvarchar(30))
AS
PRINT N'Xin chào ' + @ten
GO
EXEC __35__ @ten = Nguyên
GO

--38--
CREATE PROCEDURE __38__(@s1 INT, @s2 INT, @max INT OUTPUT)
AS
BEGIN
	IF @s1 > @s2 
		SET @max = @s1;
	ELSE 
		SET @max = @s2;
END
GO
DECLARE @ans INT
EXEC __38__ @s1=2, @s2=3, @max=@ans OUTPUT
SELECT @ans
GO

--41--
CREATE PROCEDURE __41__(@n INT) AS
BEGIN
	DECLARE @i INT, @sum INT, @cnt INT
	SELECT @i = 1, @sum = 0, @cnt = 0
	WHILE @i <= @n
	BEGIN
		IF @i % 2 = 0
			SELECT @sum = @sum + @i, @cnt = @cnt + 1
		SELECT @i = @i + 1
	END
	PRINT CONCAT(CAST(@sum as nvarchar(10)),', ',CAST(@cnt as nvarchar(10)))
END
GO
EXEC __41__ @n = 4