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

/*48--
Khi thêm cầu thủ mới, kiểm tra vị trí trên sân của cần thủ chỉ thuộc một trong các
vị trí sau: Thủ môn, Tiền đạo, Tiền vệ, Trung vệ, Hậu vệ.*/
create trigger trig_CauThu_ins
on CAUTHU for insert, update
as
begin
	declare @vitri nvarchar(max)
	--gắn dữ liệu ktra
	select @vitri = VITRI
	from inserted
	--điều kiện ktra
	if (@vitri not in (N'Thủ môn', N'Hậu vệ', N'Tiền vệ', N'Tiền đạo', N'Trung vệ'))
	begin
		--ruột xảy ra lỗi
		raiserror (N'sai vị trí',15,1)
		rollback tran
		return
	end
end

/*49--
Khi thêm cầu thủ mới, kiểm tra số áo của cầu thủ thuộc cùng một câu lạc bộ phải
khác nhau.*/
create trigger trig_CauThu_ins
on CauThu for insert, update
as
begin
	declare @soao int, @maclb varchar(5)
	select @soao = SO, @maclb = MACLB
	from inserted
	if (@soao in 
		select SO from CauThu 
		where MACLB like @maclb)
	begin
		--ruột xảy ra lỗi
		raiserror (N'trùng số áo',13,1)
		rollback tran
		return
	end
end


/*50--
Khi thêm thông tin cầu thủ thì in ra câu thông báo bằng Tiếng Việt ‘Đã thêm cầu
thủ mới’.*/
create trigger trig_CauThu_ins on CAUTHU after insert as
begin
	print (N'Đã thêm cầu thủ')
end



/*51--
Khi thêm cầu thủ mới, kiểm tra số lượng cầu thủ nước ngoài ở mỗi câu lạc bộ chỉ
được phép đăng ký tối đa 8 cầu thủ.*/
create trigger trig_CauThu_ins
on CauThu for insert, update
as
begin
	declare @maqg varchar (max), @maclb varchar(max)
	select  @maqg= MAQG, @maclb = MACLB from inserted
	begin
		if((select count(*) from CauThu where MACLB = @maclb and MAQG <> 'VN')>=8)
		begin
			raiserror (N'Quá số lượng', 15, 1)
			rollback tran
			return
		end
	end
end

--drop trigger trig_CauThu_ins

/*56--
Khi thêm mới một câu lạc bộ thì kiểm tra xem đã có câu lạc bộ trùng tên với câu
lạc bộ vừa được thêm hay không?*/
create trigger c56 on CAULACBO for insert as
begin
	declare @tenclb nvarchar(max)
	select @tenclb = TenCLB from inserted --lưu các tên clb mới vào @tenclb
	declare @req int
	select @req = count(*) from CAULACBO where @tenclb = TenCLB		--nếu @tenclb trùng với TenCLB(của table cũ) thì @req++
	if (@req>1)
	begin
		--a
		print (N'Trùng tên')
		return
		/*--b
		raiserror (N'Trùng tên')
		rollback tran
		return
		*/
	end
end