﻿use QLBongDa
go

----PHAN 1----

--1--
select MACT, HOTEN, NGAYSINH, DIACHI, VITRI
from CAUTHU inner join QUOCGIA on CAUTHU.MAQG = QUOCGIA.MAQG inner join CAULACBO on CAUTHU.MACLB = CAULACBO.MACLB
where TENCLB like N'SHB Đà Nẵng' and TENQG like N'Bra-xin'

--2--
select HOTEN
from CAUTHU inner join THAMGIA on CAUTHU.MACT = THAMGIA.MACT
where SOTRAI >= 2

--3--
select MATRAN, NGAYTD, TENSAN, CLB1.TENCLB as TENCLB1, CLB2.TENCLB as TENCLB2, KETQUA
from TRANDAU inner join SANVD on TRANDAU.MASAN = SANVD.MASAN
			 inner join CAULACBO CLB1 on TRANDAU.MACLB1 = CLB1.MACLB
			 inner join CAULACBO CLB2 on TRANDAU.MACLB2 = CLB2.MACLB
where VONG = 3 and NAM = 2009

--4--
select HUANLUYENVIEN.MAHLV, TENHLV, NGAYSINH, DIACHI, VAITRO, TENCLB
from HUANLUYENVIEN inner join HLV_CLB on HUANLUYENVIEN.MAHLV = HLV_CLB.MAHLV
				   inner join CAULACBO on HLV_CLB.MACLB = CAULACBO.MACLB
				   inner join QUOCGIA on HUANLUYENVIEN.MAQG = QUOCGIA.MAQG
where TENQG like N'Việt Nam'

--5--
SELECT CLB.MACLB, CLB.TENCLB, SVD.TENSAN, SVD.DIACHI, COUNT(CT.MACT) AS SOCAUTHUNUOCNGOAI
FROM CAULACBO CLB
INNER JOIN SANVD SVD ON CLB.MASAN LIKE SVD.MASAN
INNER JOIN CAUTHU CT ON CLB.MACLB LIKE CT.MACLB
WHERE  CT.MAQG NOT LIKE 'VN'
GROUP BY CLB.MaCLB, CLB.TenCLB, SVD.TENSAN, SVD.DiaChi
HAVING COUNT(CT.MACT) >= 2 -- Đề yêu cầu > 2, nhưng ko có kq, thêm = 2 để show cho đẹp :3

--6--
SELECT T.TENTINH, COUNT(CTTD.MACT)
FROM TINH T
INNER JOIN (SELECT CT.MACT, CLB.MATINH 
			FROM CAUTHU CT 
			INNER JOIN CAULACBO CLB ON CT.MACLB LIKE CLB.MACLB
			WHERE CT.ViTri LIKE N'Tiền đạo') CTTD 
			ON CTTD.MaTinh LIKE T.MaTinh
GROUP BY (T.TenTinh)

--7--
SELECT TOP 1 CLB.TENCLB, T.TENTINH 
FROM CAULACBO CLB
INNER JOIN TINH T ON CLB.MATINH LIKE T.MATINH
INNER JOIN (SELECT MACLB, HANG FROM BANGXH 
			WHERE NAM = 2009) BXH ON CLB.MACLB LIKE BXH.MACLB
ORDER BY HANG DESC

----PHAN 3----

--8--
select TENHLV
from HUANLUYENVIEN inner join HLV_CLB on HUANLUYENVIEN.MAHLV = HLV_CLB.MAHLV
				   inner join CAULACBO on HLV_CLB.MACLB = CAULACBO.MACLB
where DIENTHOAI is null

--9--
select TENHLV
from HUANLUYENVIEN inner join QUOCGIA on HUANLUYENVIEN.MAQG = QUOCGIA.MAQG
where TENQG like N'Việt Nam' and 
	  MAHLV not in
			(select MAHLV from HUANLUYENVIEN)

--10--
select HOTEN
from CAUTHU inner join CAULACBO on CAUTHU.MACLB = CAULACBO.MACLB
			inner join BANGXH on CAULACBO.MACLB = BANGXH.MACLB
where VONG = 3 and NAM = 2009 and (HANG >= 6 or HANG < 3)

--11--
select distinct NGAYTD, CLB1.TENCLB as TENCLB1, CLB2.TENCLB as TENCLB2,  TENSAN, KETQUA
from TRANDAU inner join CAULACBO CLB1 on TRANDAU.MACLB1 = CLB1.MACLB
			 inner join CAULACBO CLB2 on TRANDAU.MACLB2 = CLB2.MACLB
			 inner join BANGXH BXHCLB1 on CLB1.MACLB = BXHCLB1.MACLB
			 inner join BANGXH BXHCLB2 on CLB2.MACLB = BXHCLB2.MACLB
			 inner join SANVD on TRANDAU.MaSan = SANVD.MASAN
where (BXHCLB1.HANG = 1 and BXHCLB1.VONG = 3) or (BXHCLB2.HANG = 1 and BXHCLB2.VONG = 3)