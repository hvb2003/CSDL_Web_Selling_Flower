CREATE DATABASE DB_flowerShop
USE DB_flowerShop
-- tọa bảng
CREATE TABLE nhanvien
(
	manv 		VARCHAR (10) PRIMARY KEY NOT NULL,
	tennv 		NVARCHAR (100),
	gioitinh	NVARCHAR(3),
	ngaysinh 	DATE ,
	diachi 		NVARCHAR (100),
	sdt 		VARCHAR (11) ,
	chucvu 	 	NVARCHAR(50),
)
CREATE TABLE luong
(
	chucvu 	 	NVARCHAR(50) PRIMARY KEY NOT NULL,
	luongcoban 	MONEY,
	phucap 		MONEY
)
CREATE TABLE khachhang
(
	Makh		VARCHAR (10) PRIMARY KEY NOT NULL,
	tenkh 		NVARCHAR (100),
	diachi 		NVARCHAR (100),
	sdt 		VARCHAR (50),
	email 		VARCHAR (50)
)
CREATE TABLE loaisp
(
	maloaisp 		VARCHAR (10) PRIMARY KEY NOT NULL,	
	tenloaisp 		NVARCHAR (100),
)
CREATE TABLE nhacungcap
(
	mancc 		VARCHAR (10) PRIMARY KEY NOT NULL,
	diachi 		NVARCHAR (100),
	sdt 		VARCHAR (50)	
)
CREATE TABLE sanpham
(
	masp 		VARCHAR (10) PRIMARY KEY NOT NULL,
	tensp 		NVARCHAR (100),
	maloaisp 		VARCHAR (10) NOT NULL,
	mancc 		VARCHAR (10) NOT NULL,
	soluong 		INT,
	gia 		MONEY ,
)
CREATE TABLE donhang
(
	madh 		VARCHAR (10) PRIMARY KEY NOT NULL,
	manv 		VARCHAR (10)  NOT NULL,
	makh 		VARCHAR (10) NOT NULL,
	diachi 		NVARCHAR (100),
	ngaydat 		DATE,
	ngaygiao 	DATE
)
CREATE TABLE chitietdonhang
(
	madh 		VARCHAR (10) NOT NULL,
	masp 		VARCHAR (10) NOT NULL,
	gia 		MONEY,
	soluong 		INT,
	giamgia 		MONEY,
	CONSTRAINT pk_chitietdonhang PRIMARY KEY (madh,masp)
)
--tạo liên kết bảng 
alter table sanpham
add constraint fk_nhacungcap foreign key (mancc) references nhacungcap(mancc)
alter table sanpham
add constraint fk_loaisp foreign key (maloaisp) references loaisp(maloaisp)

alter table donhang
add constraint fk_donhang_khachhang foreign key (makh) references khachhang(makh)
alter table donhang
add constraint fk_donhang_nhanvien foreign key (manv) references nhanvien(manv)

alter table chitietdonhang
add constraint fk_chitiet_donhang foreign key (madh) references donhang(madh)
alter table chitietdonhang
add constraint fk_chitiet_sanpham foreign key (masp) references sanpham(masp)

ALTER TABLE nhanvien
ADD constraint fk_chucvu foreign key (chucvu) references luong(chucvu)
-- Thêm dữ liệu vào bảng
USE DB_flowerShop
INSERT INTO nhanvien VALUES 
('NV1',N'Nguyễn Anh Đức',N'nam','3/1/2003',N'Nghệ An','0981662088',N'Quản Lý'),
('NV2',N'Đỗ Chí Lực',N'nam','12/1/2003',N'Hà Nội','0981662377',N'Nhân Viên'),
('NV3',N'Nguyễn Phương Đông',N'nam','2/4/2003',N'Hải Phòng','0981262488',N'Nhân Viên'),
('NV4',N'Hà Văn Bảo',N'nam','12/3/2003',N'Ninh Bình','0981623042',N'Nhân Viên'),
('NV5',N'Lê Đức Mạnh',N'nam','10/4/2003',N'Nghệ An','0981662123',N'Nhân Viên'),
('NV6',N'Nguyễn Thị Mai Hương',N'nữ','11/22/2003',N'Hà Nội','0981123088',N'Thu Ngân'),
('NV7',N'Nguyễn Thị Bảo An',N'nữ','8/22/2003',N'Hà Nội','0981644588',N'Thu Ngân'),
('NV8',N'Bùi An Nhiên ',N'nữ','9/2/2003',N'Nghệ An','0941652028',N'Quản Lý'),
('NV9',N'Đào Thị Hồ Điệp',N'nữ','7/2/2003',N'Hải Phòng','0981231012',N'Quản Lý'),
('NV10',N'Nguyễn Đức Anh',N'nam','8/23/2003',N'Nghệ An','0981667488',N'Nhân Viên Kho'),
('NV11',N'Nguyễn Thị Lan Hương',N'nữ','2/3/2003',N'Ninh Bình','0981342033',N'Nhân Viên Kho'),
('NV12',N'Trần Thị Nga',N'nữ','7/3/2003',N'Hà Nội','0981662055',N'Nhân Viên Kho'),
('NV13',N'Nguyễn Đức Hạnh',N'nam','7/4/2003',N'Hà Nội','0984671238',N'Nhân Viên Giao Hàng'),
('NV14',N'Trần Đức Anh',N'nam','5/3/2003',N'Ninh Bình','0985662231',N'Nhân Viên Giao Hàng'),
('NV15',N'Nguyễn Duy Lâm',N'nam','12/3/2003',N'Nghệ An','0986664521',N'Nhân Viên Giao Hàng')

INSERT INTO luong VALUES 
(N'Quản Lý',7000000,500000),
(N'Nhân Viên',4500000,200000),
(N'Nhân Viên Kho',6000000,300000),
(N'Thu Ngân',3500000,250000),
(N'Nhân Viên Giao Hàng',4500000,200000)

INSERT INTO khachhang VALUES
('KH1',N'Nguyễn Anh Đức',N'Nghệ An','0981662228','nguyenanhduc@gmail.com'),
('KH2',N'Nguyễn Hoàng Giang',N'Nghệ An','098156t382','nguyenhoanggiang@gmail.com'),
('KH3',N'Thái Trung Hiếu',N'Nghệ An','098345285','hieu123@gmail.com'),
('KH4',N'Tôn Duy An',N'Hà Nội','0981634238','an12342@gmail.com'),
('KH5',N'Bùi Hữu Nam',N'Hà Nội','0981634538','namdeptrai123@gmail.com'),
('KH6',N'Trần Trọng Kim',N'Hải Phòng','092345068','kimjongun@gmail.com'),
('KH7',N'Nguyễn Thùy Vân',N'Hải Phòng','0945672078','vanxinhgai123@gmail.com'),
('KH8',N'La Bảo Thoa',N'Hải Phòng','0981656788','thoanhiethuyet123@gmail.com'),
('KH9',N'Lý Khánh My',N'Hải Phòng','0981612348','mynhinhanh123@gmail.com'),
('KH10',N'Liễu Nguyệt Lan',N'Hải Phòng','0912342088','lan223322@gmail.com'),
('KH11',N'Đặng Yến Oanh',N'Hải Phòng','0981232088','Oanh12354@gmail.com'),
('KH12',N'Hà Thục Trinh',N'Hà Nội','0981661242','Trinh123@gmail.com'),
('KH13',N'Hoàng Mạnh Cương',N'Hà Nội','0981663333','cuongdeptrai123@gmail.com'),
('KH14',N'Văn Duy Cẩn',N'Ninh Bình','0981662312','cancau123@gmail.com'),
('KH15',N'Đặng Yến Oanh',N'Ninh Bình','0981552044','oanhxinhgai123@gmail.com')

INSERT INTO loaisp VALUES 
('L1',N'Hoa Sự Kiện'),
('L2',N'Quà'),
('L3',N'Hoa Chia Buồn'),
('L4',N'Hoa Tình Yêu'),
('L5',N'Hoa Giả'),
('L6',N'Hoa Trong Nhà'),
('L7',N'Hoa Ngoài Trời')

INSERT INTO nhacungcap VALUES 
('NCC1', N'Hà Nội','0981662088'),
('NCC2',N'Nghệ An','0987772821'),
('NCC3',N'Ninh Bình','0981232821'),
('NCC4',N'Hải Phòng','0945772821'),
('NCC5',N'Đà Nẵng','0987432821'),
('NCC6',N'SaPa','0987342821')

INSERT INTO sanpham VALUES 
('SP1',N'Hoa Cúc','L1','NCC1',100,100000),
('SP2',N'Hoa Hồng','L1','NCC2',120,250000),
('SP3',N'Hoa Phát Tài','L2','NCC3',140,47000),
('SP4',N'Hoa Tulip','L2','NCC4',80,260000),
('SP5',N'Hoa Huệ','L2','NCC5',60,430000),
('SP6',N'Hoa Cỏ May Mắn','L3','NCC6',28,560000),
('SP7',N'Hoa Lavender','L3','NCC1',70,670000),
('SP8',N'Hoa Cúc Dại','L4','NCC2',60,770000),
('SP9',N'Hoa Hướng Dương','L4','NCC3',50,320000),
('SP10',N'Hoa Đỗ Quyên ','L4','NCC4',80,620000),
('SP11',N'Hoa Lài','L4','NCC5',90,750000),
('SP12',N'Hoa Lưỡi Hổ','L5','NCC6',200,160000),
('SP13',N'Hoa Mẫu Đơn','L5','NCC1',210,270000),
('SP14',N'Hoa Thược Dược','L5','NCC2',50,535000),
('SP15',N'Hoa Lan','L6','NCC3',80,560000),
('SP16',N'Hoa Phát Đạt','L6','NCC4',90,607000),
('SP17',N'Hoa Sen','L6','NCC5',180,630000),
('SP18',N'Hoa Kim Ngân','L7','NCC6',124,260000),
('SP19',N'Hoa Đào','L7','NCC1',153,660000),
('SP20',N' Hoa Phượng','L7','NCC2',165,670000)

INSERT INTO donhang VALUES 
('DH1','NV1','KH15',N'Hà Nội','3/22/2024','12/1/2024'),
('DH2','NV2','KH14',N'Hà Nội','4/21/2024','5/2/2024'),
('DH3','NV3','KH13',N'Hà Nội','6/12/2024','6/22/2024'),
('DH4','NV4','KH12',N'Hà Nội','4/24/2024','6/22/2024'),
('DH5','NV5','KH11',N'Hà Nội','5/5/2024','7/22/2024'),
('DH6','NV6','KH10',N'Hà Nội','2/1/2024','6/22/2024'),
('DH7','NV7','KH9',N'Ninh Bình','1/5/2024','5/2/2024'),
('DH8','NV8','KH8',N'Ninh Bình','5/2/2024','6/2/2024'),
('DH9','NV9','KH7',N'Ninh Bình','6/5/2024','7/22/2024'),
('DH10','NV10','KH6',N'Hải Phòng','2/6/2024','4/2/2024'),
('DH11','NV11','KH5',N'Hải Phòng','1/2/2024','4/22/2024'),
('DH12','NV12','KH4',N'Hải Phòng','4/6/2024','4/30/2024'),
('DH13','NV13','KH3',N'Hải Phòng','3/6/2024','4/22/2024'),
('DH14','NV14','KH2',N'Hải Phòng','5/6/2024','6/2/2024'),
('DH15','NV15','KH1',N'Nghệ An','5/6/2024','7/2/2024'),
('DH16','NV1','KH12',N'Nghệ An','2/7/2024','4/2/2024'),
('DH17','NV2','KH13',N'Nghệ An','5/7/2024','6/2/2024'),
('DH18','NV3','KH1',N'Hà Nội','2/5/2024','4/12/2024'),
('DH19','NV4','KH1',N'Hà Nội','3/22/2024','4/22/2024'),
('DH20','NV5','KH1',N'Hà Nội','3/26/2024','4/1/2024')

INSERT INTO  chitietdonhang VALUES
('DH1','SP1',200000,10,10000),
('DH1','SP2',150000,1,0),
('DH1','SP3',500000,5,12000),
('DH1','SP4',300000,6,16000),
('DH2','SP5',500000,3,14000),
('DH2','SP6',600000,17,15000),
('DH2','SP7',800000,20,10000),
('DH3','SP8',200000,5,12000),
('DH4','SP9',500000,2,14000),
('DH5','SP10',600000,5,0),
('DH6','SP11',700000,4,12000),
('DH7','SP12',200000,5,12000),
('DH8','SP13',250000,15,12000),
('DH9','SP14',250000,12,13000),
('DH10','SP15',240000,14,14000),
('DH11','SP16',250000,1,14000),
('DH12','SP17',220000,2,10000),
('DH13','SP18',250000,4,10000),
('DH14','SP19',210000,5,10000),
('DH15','SP20',260000,15,10000),
('DH16','SP1',250000,12,10000),
('DH17','SP18',260000,15,10000),
('DH18','SP15',230000,12,10000),
('DH19','SP16',250000,15,10000),
('DH20','SP17',260000,12,10000),
('DH20','SP13',230000,1,0),
('DH18','SP13',260000,5,0),
('DH10','SP1',230000,6,0),
('DH4','SP1',230000,7,12000),
('DH5','SP1',230000,8,15000)

-- tao view
--VIEW LUONG NHAN VIEN
CREATE VIEW LuongCuaNhanVien
AS 
SELECT manv,tennv,gioitinh,diachi,sdt,nhanvien.chucvu,luongcoban,phucap 
FROM  nhanvien ,luong 
WHERE luong.chucvu = nhanvien.chucvu
--VIEW SAN PHAM CO GIA >500000
CREATE VIEW SanPhamGiaCao
AS
SELECT masp,tensp,gia,soluong
FROM sanpham
WHERE gia >500000
--VIEW NHAN VIEN THU NGAN
CREATE VIEW NhanVienThuNgan
AS
SELECT * 
FROM nhanvien
WHERE chucvu = 'Thu Ngân'
--Tong tien cua moi hoa don
CREATE VIEW SanPhamXuatXuHaNoi
AS
SELECT masp,tensp,soluong,gia,diachi
FROM sanpham,nhacungcap
where sanpham.mancc = nhacungcap.mancc
AND nhacungcap.diachi = N'Hà Nội'
--Thong tin chi tiet san pham 
CREATE VIEW SAHPHAMCHITIET
AS
SELECT masp,tensp ,gia,soluong,diachi,tenloaisp
FROM sanpham ,nhacungcap,loaisp
WHERE sanpham.mancc = nhacungcap.mancc
AND loaisp.maloaisp = sanpham.maloaisp
--bai tap ve thong ke 
--1 Thong ke nhan vien co chuc vu quan ly, dia chi tai Nghệ An
SELECT * 
FROM nhanvien
Where diachi = N'Nghệ An'
AND chucvu =N'Quản Lý'
--2 Thông kê các đơn hàng chưa được giao  
SELECT *
FROM donhang
where ngaygiao <GETDATE()
--3 Thống kê tổng tiền hóa đơn 
SELECT donhang.madh,ngaydat,ngaygiao,sum(gia*soluong-giamgia) as TongSoTien
FROM donhang,chitietdonhang
WHERE donhang.madh = chitietdonhang.madh
GROUP BY donhang.madh,ngaydat,ngaygiao
--4 Thông kê danh sách mã nhân viên, tên nhân viên, số hóa đơn lập được trong tháng 4

SELECT nhanvien.manv ,tennv,COUNT(donhang.madh) as SoHoaDon
FROM donhang,nhanvien
WHERE DATEPART(mm,ngaydat) = 4
and nhanvien.manv = donhang.manv
GROUP BY nhanvien.manv,nhanvien.tennv 
ORDER BY SoHoaDon
--8 Thống kê danh các hóa đơn trị giá hơn trung bình giá trị của các hóa đơn.
SELECT sum(gia*soluong-giamgia) as giatri ,c.madh
FROM donhang as d,chitietdonhang as c
WHERE d.madh = c.madh
GROUP BY c.madh
having sum(gia*soluong-giamgia) >
(SELECT avg(giatri)
FROM (
SELECT sum(gia*soluong-giamgia) as giatri ,c.madh
FROM donhang as d,chitietdonhang as c
WHERE d.madh = c.madh
GROUP BY c.madh
) as k)

--6 Thông kê các loại sản phẩm được mua nhiều nhất
SELECT c.masp,tensp ,count(c.masp) as soluong
from sanpham as s,chitietdonhang as c
where s.masp = c.masp
group By c.masp ,s.tensp
having count(c.masp) = 
(SELECT top 1 COUNT(masp) as soluong
from chitietdonhang
group by masp
order by soluong desc
)
--7 Thống kê các khách hàng mua sản phẩm có mã sản phẩm là sp1
SELECT k.*
FROM khachhang as k , donhang as d,chitietdonhang as c
where k.Makh = d.makh
and c.madh = d.madh
and c.masp = 'SP1'


--	Thiết kế các Procedure (tối thiểu 5 Procedure)
-- 1 kiem tra trạng thái don hàng (ngay giao > hom nay => đơn hàng chưa được giao)
alter PROC kiemTra_ThongtinDonHang
@madh VARCHAR(10)
as 
declare @date date
SELECT @date = ngaygiao 
from donhang
where madh = @madh
if(@date > GETDATE())
print N'đơn hàng chưa được giao'
else print N'đơn hàng đã được giao'

Kiemtra_ThongtinDonHang 'DH1'

--2 Tìm kiêm thông tin khách hàng 
CREATE PROC TIMKIEM_khachHang
@makh varchar(10)
as 
SELECT *
FROM khachhang
WHERE Makh = @makh

TIMKIEM_khachHang 'KH1'
--3 Tinh Tien Don Hang
CREATE PROC TinhTien 
@madh varchar(10)
as
SELECT donhang.madh,sum(gia*soluong-giamgia) as TongSoTien
FROM donhang,chitietdonhang
WHERE donhang.madh = chitietdonhang.madh
AND donhang.madh = @madh
GROUP BY donhang.madh,ngaydat,ngaygiao

TinhTien 'DH1'
-- 4 hien thi thong tin chi tiet hoa don
create PROC ChiTietHoaDon
@madh varchar(10)
as
declare @ngaygiao date ,@ngayDat date, @KhachHang nvarchar(50),@nhanvien nvarchar(50)
SELECT @ngaygiao =d.ngaygiao,@ngayDat = d.ngaydat ,@KhachHang = k.tenkh ,@nhanvien = n.tennv
FROM donhang as d,nhanvien as n , khachhang as k
where d.manv= n.manv and k.Makh = d.makh and madh = @madh
PRINT N'CHí tiết hóa đơn '+@madh+N' của khách hàng '+@KhachHang+N' được lập bởi nhân viên '+@nhanvien
Print N'Ngay Giao : '+convert(nvarchar(20),@ngaygiao) +N' Ngay Đặt :'+convert(nvarchar(20),@ngayDat) 
SELECT k.*
FROM chitietdonhang as k,donhang as d
WHERE @madh = k.madh 
and k.madh = d.madh

ChitietHoaDon 'DH1'

--Thêm nhà cung câp và loại sản phẩm 
create proc Them_sanPham_loai_sp
@maloaisp VARCHAR (10) ,@tenloaisp NVARCHAR (100),@mancc VARCHAR (10) ,@diachi NVARCHAR (100),@sdt VARCHAR (50)
as 
	insert into nhacungcap values (@mancc,@diachi,@sdt)
	insert into loaisp values (@maloaisp,@tenloaisp)
Print 'Thêm loại sản phẩm và nhà cung cấp thành công thành công'

Them_sanPham_loai_sp 

--Tạo trigger
--trigger khong the xoa nhân viên có chức vụ quản lý 
CREATE TRIGGER trigger_nhanvien_onDELETE_QL ON nhanvien
AFTER DELETE
AS
IF (SELECT chucvu from deleted) =N'Quản Lý'
PRINT N'Bạn Không thể xóa nhân viên có chức vụ quản lý'
ROLLBACK TRANSACTION 
END
--trigger thêm sửa xóa 
CREATE TRIGGER trigger_add_sanPham on sanpham
after insert
as 
declare @sanpham int
select @sanpham = count(masp) from sanpham
print N'Tổng số sản phẩm là : '+ cast(@sanpham as varchar)
-- trigger tự động cập nhật dữ liệu 
--ví dụ đưa vào giá tiền và số lượng => thành tiền 
--tọa trigger ko cho phép xóa sinh quê ở hà nooimj 