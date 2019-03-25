-------------------------------------------------------------------Script-------------------------------------------------------------------
/*
--DROP--
use master
go 
drop database 
QLBongDa 
go
*/


CREATE DATABASE QLBongDa
go

use QLBongDa
go

CREATE TABLE CAUTHU
(
	MaCT		numeric identity(1,1),
	HoTen		nvarchar(100)				not null,
	ViTri		nvarchar(20)				not null,
	NgaySinh	datetime,
	DiaChi		nvarchar(200),				
	MaCLB		varchar(5)					not null,
	MaQG		varchar(5)					not null,
	So			int							not null
	constraint pk_CAUTHU primary key (MaCT)
)
go

CREATE TABLE QUOCGIA
(
	MaQG		varchar(5),
	TenQG		nvarchar(60)				not null
	constraint pk_QUOCGIA primary key (MaQG)
)
go

CREATE TABLE CAULACBO
(
	MaCLB		varchar(5),
	TenCLB		nvarchar(100)				not null,
	MaSan		varchar(5)					not null,
	MaTinh		varchar(5)					not null
	constraint pk_CAULACBO primary key (MaCLB)
)
go

CREATE TABLE TINH
(
	MaTinh		varchar(5),
	TenTinh		nvarchar(100)				not null
	constraint pk_TINH primary key (MaTinh)
)
go

CREATE TABLE SANVD
(
	MaSan		varchar(5),
	TenSan		nvarchar(100)				not null,
	DiaChi		nvarchar(100)
	constraint pk_SANVD primary key (MaSan)
)
go

CREATE TABLE HUANLUYENVIEN
(
	MaHLV		varchar(5),
	TenHLV		nvarchar(100)				not null,
	NgaySinh	datetime,
	DiaChi		nvarchar(100),				
	DienThoai	nvarchar(20),
	MaQG		varchar(5)					not null
	constraint pk_HUANLUYENVIEN primary key (MaHLV)
)
go

CREATE TABLE HLV_CLB
(
	MaHLV		varchar(5),
	MaCLB		varchar(5),
	VaiTro		nvarchar(100)				not null
	constraint pk_HLV_CLB primary key (MaHLV,MaCLB)
)
go

CREATE TABLE TRANDAU
(
	MaTran		numeric identity(1,1),
	Nam			int							not null,
	Vong		int							not null,
	NgayTD		datetime					not null,
	MaCLB1		varchar(5)					not null,			
	MaCLB2		varchar(5)					not null,
	MaSan		varchar(5)					not null,
	KetQua		varchar(5)					not null
	constraint pk_TRANDAU primary key (MaTran)
)
go

CREATE TABLE BANGXH
(
	MaCLB		varchar(5),
	Nam			int,
	Vong		int,						
	SoTran		int							not null,
	Thang		int							not null,		
	Hoa			int							not null,
	Thua		int							not null,
	HieuSo		varchar(5)					not null,
	Diem		int							not null,
	Hang		int							not null
	constraint pk_BANGXH primary key (MaCLB,Nam,Vong)
)
go

CREATE TABLE THAMGIA
(
	MaTD		numeric,
	MaCT		numeric,
	SoTrai		int
	constraint pk_THAMGIA primary key (MaTD,MaCT)
)
go

insert into CAUTHU values
(N'Nguyễn Vũ Phong',	N'Tiền vệ',		'2016-10-23 00:00:00.000',	null,	'BBD',	'VN',	'17'),
(N'Nguyễn Công Vinh',	N'Tiền đạo',	'2016-10-23 00:00:00.000',	null,	'HAGL',	'VN',	'9'),
(N'Nguyễn Hồng Sơn',	N'Tiền vệ',		'2016-10-23 00:00:00.000',	null,	'SDN',	'VN',	'9'),
(N'Lê Tấn Tài',			N'Tiền vệ',		'2016-10-23 00:00:00.000',	null,	'KKH',	'VN',	'14'),
(N'Phan Hồng Sơn',		N'Thủ môn',		'2016-10-23 00:00:00.000',	null,	'HAGL',	'VN',	'1'),
(N'Ronaldo',			N'Tiền vệ',		'2016-10-23 00:00:00.000',	null,	'SDN',	'BRA',	'7'),
(N'Robinho',			N'Tiền vệ',		'2016-10-23 00:00:00.000',	null,	'SDN',	'BRA',	'8'),
(N'Vidic',				N'Hậu vệ',		'2016-10-23 00:00:00.000',	null,	'HAGL',	'ANH',	'3'),
(N'Trần Văn Santos',	N'Thủ môn',		'2016-10-23 00:00:00.000',	null,	'BBD',	'BRA',	'1'),
(N'Nguyễn Trường Sơn',	N'Hậu vệ',		'2016-10-23 00:00:00.000',	null,	'BBD',	'VN',	'4'),
(N'Lê Huỳnh Đức',		N'Tiền đạo',	'2016-10-23 00:00:00.000',	null,	'BBD',	'VN',	'10'),
(N'Huỳnh Hồng Sơn',		N'Tiền vệ',		'2016-10-23 00:00:00.000',	null,	'BBD',	'VN',	'9'),
(N'Lee Nguyễn',			N'Tiền đạo',	'2016-10-23 00:00:00.000',	null,	'BBD',	'VN',	'14'),
(N'Nguyễn Quang Hải',	N'Tiền đạo',	'2016-10-23 00:00:00.000',	null,	'HAGL',	'VN',	'9'),
(N'Bùi Tấn Trường',		N'Thủ môn',		'2016-10-23 00:00:00.000',	null,	'CSDT',	'VN',	'1'),
(N'Phan Văn Tài Em',	N'Tiền vệ',		'2016-10-23 00:00:00.000',	null,	'GDT',	'VN',	'10'),
(N'Lý Tiểu Long',		N'Tiền vệ',		'2016-10-23 00:00:00.000',	null,	'TPY',	'VN',	'7')
go

insert into QUOCGIA values
('ANH',	N'Anh Quốc'),
('BDN',	N'Bồ Đào Nha'),
('BRA',	N'Bra-xin'),
('HQ',	N'Hàn Quốc'),
('ITA',	N'Ý'),
('TBN',	N'Tây Ban Nha'),
('THA',	N'Thái Lan'),
('THAI',N'Thái Lan'),
('VN',	N'Việt Nam')
go

insert into CAULACBO values
('BBD',	N'Becamex Bình Dương',			'GD',	'BD'),
('CSDT',N'Tập đoàn Cao su Đồng Tháp',	'CLDT',	'DT'),
('GDT',	N'Gạch Đồng Tâm Long An',		'LA',	'LA'),
('HAGL',N'Hoàng ANh Gia Lai',			'PL',	'GL'),
('KKH',	N'Khatoco Khánh Hoà',			'NT',	'KH'),
('SDN',	N'SHB Đà Nẵng',					'CL',	'DN'),
('TPY',	N'Thép Phú Yên',				'TH',	'PY')
go

insert into TINH values
('BD',	N'Bình Dương'),
('DN',	N'Đà Nẵng'),
('DT',	N'Đồng Tháp'),
('GL',	N'Gia Lai'),
('HN',	N'Hà Nội'),
('KH',	N'Khánh Hoà'),
('LA',	N'Long An'),
('NA',	N'Nghệ An'),
('NB',	N'Ninh Bình'),
('PY',	N'Phú Yên'),
('SG',	N'Sài Gòn'),
('TH',	N'Thanh Hoá')
go

insert into SANVD values
('CL',	N'Chi Lăng',	'127 Võ Văn Tần, Đà Nẵng'),
('CLDT',N'Cao Lãnh',	'134 TX Cao Lãnh, Đồng Tháp'),
('GD',	N'Gò Đậu',		'123 QL1, TX Thủ Dầu Một, Bình Dương'),
('HD',	N'Hàng Đẫy',	'345 Lý Chiêu Hoàng, Bạch Mai, Hà Nội'),
('LA',	N'Long An',		'102 Hùng Vương, Tp Tân An, Long An'),
('NT',	N'Nha Trang',	'128 Phan Chu Trinh, Nha Trang, Khánh Hoà '),
('PL',	N'Pleiku',		'22 Hồ Tùng Mậu, Thống Nhất, Thị xã Pleiku, Gia Lai'),
('TH',	N'Tuy Hoà',		'57 Trường Chinh, Tuy Hoà, Phú Yên'),
('TN',	N'Thống Nhất',	'123 Lý Thường Kiệt, Quận 5, Tp HCM')
go

insert into HUANLUYENVIEN values
('HLV01',	N'Vital',			'1955-10-15 00:00:00.000',	null,	'0918011075',	'BDN'),
('HLV02',	N'Lê Huỳnh Đức',	'1972-5-20 00:00:00.000',	null,	'01223456789',	'VN'),
('HLV03',	N'Kiatisuk',		'1970-12-11 00:00:00.000',	null,	'01990123456',	'THA'),
('HLV04',	N'Hoàng Anh Tuấn',	'1970-6-10 00:00:00.000',	null,	'0989112233',	'VN'),
('HLV05',	N'Trần Công Minh',	'1973-7-7 00:00:00.000',	null,	'0909099990',	'VN'),
('HLV06',	N'Trần Văn Phúc',	'1965-3-2 00:00:00.000',	null,	'01650101234',	'VN'),
('HLV07',	N'Yoon-Hwan Cho',	'1960-2-2 00:00:00.000',	null,	null,			'HQ'),
('HLV08',	N'Yun-Kyum Choi',	'1962-3-3 00:00:00.000',	null,	null,			'HQ')
go

insert into HLV_CLB values
('HLV01','GDT',	'HLV Chính'),
('HLV02','SDN',	'HLV Chính'),
('HLV03','HAGL','HLV Chính'),
('HLV04','KKH',	'HLV Chính'),
('HLV05','TPY',	'HLV Chính'),
('HLV06','CSDT','HLV Chính'),
('HLV07','BBD',	'HLV Chính'),
('HLV08','BBD',	'HLV Thủ môn')
go

insert into TRANDAU values
('2009','1','2009-02-07 00:00:00.000','BBD','SDN','GD','3-0'),
('2009','1','2009-02-07 00:00:00.000','KKH','GDT','NT','1-1'),
('2009','2','2009-02-16 00:00:00.000','SDN','KKH','CL','2-2'),
('2009','2','2009-02-16 00:00:00.000','TPY','BBD','TH','5-0'),
('2009','3','2009-03-01 00:00:00.000','TPY','GDT','TH','0-2'),
('2009','3','2009-03-01 00:00:00.000','KKH','BBD','NT','0-1'),
('2009','4','2009-03-07 00:00:00.000','KKH','TPY','NT','1-0'),
('2009','4','2009-03-07 00:00:00.000','BBD','GDT','GD','2-2')
go

insert into BANGXH values
('BBD','2009','1','1','1','0','0','3-0','3','1'),
('KKH','2009','1','1','0','1','0','1-1','1','2'),
('GDT','2009','1','1','0','1','0','1-1','1','3'),
('TPY','2009','1','0','0','0','0','0-0','0','4'),
('SDN','2009','1','1','0','0','1','0-3','0','5'),
('TPY','2009','2','1','1','0','0','5-0','3','1'),
('BBD','2009','2','2','1','0','1','3-5','3','2'),
('KKH','2009','2','2','0','2','0','3-3','2','3'),
('GDT','2009','2','1','0','1','0','1-1','1','4'),
('SDN','2009','2','2','1','1','0','2-5','1','5'),
('BBD','2009','3','3','2','0','1','4-5','6','1'),
('GDT','2009','3','2','1','1','0','3-1','4','2'),
('TPY','2009','3','2','1','0','1','5-2','3','3'),
('KKH','2009','3','3','0','2','1','3-4','2','4'),
('SDN','2009','3','2','1','1','0','2-5','1','5'),
('BBD','2009','4','4','2','1','1','6-7','7','1'),
('GDT','2009','4','3','1','2','0','5-1','5','2'),
('KKH','2009','4','4','1','2','1','4-4','5','3'),
('TPY','2009','4','3','1','0','2','5-3','3','4'),
('SDN','2009','4','2','1','1','0','2-5','1','5')
go

insert into THAMGIA values
('1',	'1',	'2'),
('1',	'11',	'1'),
('2',	'4',	'1'),
('2',	'16',	'1'),
('3',	'3',	'1'),
('3',	'4',	'2'),
('3',	'7',	'1'),
('4',	'17',	'5'),
('5',	'16',	'2'),
('6',	'13',	'1'),
('7',	'4',	'1'),
('8',	'12',	'2'),
('8',	'16',	'2')
go

alter table CAUTHU add
	constraint fk_CAUTHU_MAQG foreign key (MAQG) references QUOCGIA(MAQG),
	constraint fk_CAUTHU_MACLB foreign key (MACLB) references CAULACBO(MACLB)
go

alter table HUANLUYENVIEN add
	constraint fk_HUANLUYENVIEN_MAQG foreign key (MAQG) references QUOCGIA(MAQG)
go

alter table HLV_CLB add
	constraint fk_HLV_CLB_MAHLV foreign key (MAHLV) references HUANLUYENVIEN(MAHLV),
	constraint fk_HLV_CLB_MACLB foreign key (MACLB) references CAULACBO(MACLB)
go

alter table THAMGIA add
	constraint fk_THAMGIA_MACT foreign key (MACT) references CAUTHU(MACT),
	constraint fk_THAMGIA_MATD foreign key (MATD) references TRANDAU(MATRAN)
go

alter table TRANDAU add
	constraint fk_TRANDAU_MACLB1 foreign key (MACLB1) references CAULACBO(MACLB),
	constraint fk_TRANDAU_MACLB2 foreign key (MACLB2) references CAULACBO(MACLB),
	constraint fk_TRANDAU_MASAN foreign key (MASAN) references SANVD(MASAN)
go

alter table CAULACBO add
	constraint fk_CAULACBO_MASAN foreign key (MASAN) references SANVD(MASAN),
	constraint fk_TINH_MATINH foreign key (MATINH) references TINH(MATINH)
go

alter table BANGXH add
	constraint fk_BANGXH_MACLB foreign key (MACLB) references CAULACBO(MACLB)
go