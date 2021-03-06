USE [master]
GO
/****** Object:  Database [QLHG]    Script Date: 12/29/2021 3:36:00 PM ******/
CREATE DATABASE [QLHG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLHG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLHG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLHG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLHG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLHG] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLHG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLHG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLHG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLHG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLHG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLHG] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLHG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLHG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLHG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLHG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLHG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLHG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLHG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLHG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLHG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLHG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLHG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLHG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLHG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLHG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLHG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLHG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLHG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLHG] SET RECOVERY FULL 
GO
ALTER DATABASE [QLHG] SET  MULTI_USER 
GO
ALTER DATABASE [QLHG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLHG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLHG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLHG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLHG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLHG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLHG', N'ON'
GO
ALTER DATABASE [QLHG] SET QUERY_STORE = OFF
GO
USE [QLHG]
GO
/****** Object:  User [minhphuc]    Script Date: 12/29/2021 3:36:00 PM ******/
CREATE USER [minhphuc] FOR LOGIN [minhphuc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [minhphat]    Script Date: 12/29/2021 3:36:00 PM ******/
CREATE USER [minhphat] FOR LOGIN [minhphat] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [kimphuong]    Script Date: 12/29/2021 3:36:00 PM ******/
CREATE USER [kimphuong] FOR LOGIN [kimphuong] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [hongphat]    Script Date: 12/29/2021 3:36:00 PM ******/
CREATE USER [hongphat] FOR LOGIN [hongphat] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [QuanLi]    Script Date: 12/29/2021 3:36:00 PM ******/
CREATE ROLE [QuanLi]
GO
/****** Object:  DatabaseRole [NHANVIEN]    Script Date: 12/29/2021 3:36:00 PM ******/
CREATE ROLE [NHANVIEN]
GO
/****** Object:  DatabaseRole [adminn]    Script Date: 12/29/2021 3:36:00 PM ******/
CREATE ROLE [adminn]
GO
ALTER ROLE [NHANVIEN] ADD MEMBER [minhphuc]
GO
ALTER ROLE [NHANVIEN] ADD MEMBER [minhphat]
GO
ALTER ROLE [adminn] ADD MEMBER [kimphuong]
GO
ALTER ROLE [QuanLi] ADD MEMBER [kimphuong]
GO
ALTER ROLE [db_owner] ADD MEMBER [kimphuong]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [kimphuong]
GO
ALTER ROLE [db_datareader] ADD MEMBER [kimphuong]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [kimphuong]
GO
ALTER ROLE [NHANVIEN] ADD MEMBER [hongphat]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [QuanLi]
GO
ALTER ROLE [db_datareader] ADD MEMBER [QuanLi]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [QuanLi]
GO
ALTER ROLE [db_owner] ADD MEMBER [adminn]
GO
/****** Object:  Table [dbo].[CHUCVU]    Script Date: 12/29/2021 3:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUCVU](
	[MaCV] [nvarchar](255) NOT NULL,
	[TenCV] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 12/29/2021 3:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[STT] [int] NOT NULL,
	[MaHD] [nvarchar](255) NULL,
	[MaKH] [nvarchar](255) NULL,
	[TenKH] [nvarchar](255) NULL,
	[MaSP] [nvarchar](255) NULL,
	[TenSP] [nvarchar](255) NULL,
	[NgayMua] [date] NULL,
	[SoLuong] [int] NULL,
	[GiaSP] [int] NULL,
	[TongTien] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 12/29/2021 3:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[MaHD] [nvarchar](255) NOT NULL,
	[MaKH] [nvarchar](255) NULL,
	[NgayMua] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/29/2021 3:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [nvarchar](255) NOT NULL,
	[TenKh] [nvarchar](255) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SDT] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 12/29/2021 3:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNCC] [nvarchar](255) NOT NULL,
	[TenNCC] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SDT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/29/2021 3:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [nvarchar](225) NOT NULL,
	[TenNV] [nvarchar](255) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](255) NULL,
	[IDCMND] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[SDT] [nvarchar](50) NULL,
	[NgayVaoLam] [date] NULL,
	[MaCV] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUANLY]    Script Date: 12/29/2021 3:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUANLY](
	[UserName] [nvarchar](225) NOT NULL,
	[PasswordHint] [nvarchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 12/29/2021 3:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [nvarchar](255) NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[GiaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[TrongLuong] [nvarchar](255) NULL,
	[MaNCC] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/29/2021 3:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TaiKhoan] [nvarchar](225) NOT NULL,
	[MatKhau] [nvarchar](225) NULL,
	[TenNV] [nvarchar](255) NULL,
	[PhanQuyen] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHUCVU] ([MaCV], [TenCV]) VALUES (N'CV01', N'Nhân viên')
INSERT [dbo].[CHUCVU] ([MaCV], [TenCV]) VALUES (N'CV02', N'Quản lý')
GO
INSERT [dbo].[CTHD] ([STT], [MaHD], [MaKH], [TenKH], [MaSP], [TenSP], [NgayMua], [SoLuong], [GiaSP], [TongTien]) VALUES (1, N'HD01', N'KH02', N'Nguyễn Tuấn Kiệt', N'SP012', N'Cây Dừa', CAST(N'2021-12-28' AS Date), 1000, 150000, 150000000)
INSERT [dbo].[CTHD] ([STT], [MaHD], [MaKH], [TenKH], [MaSP], [TenSP], [NgayMua], [SoLuong], [GiaSP], [TongTien]) VALUES (2, N'HD02', N'KH02', N'Nguyễn Tuấn Kiệt', N'SP03', N'Hạt Dâu', CAST(N'2021-12-28' AS Date), 1000, 20000, 20000000)
INSERT [dbo].[CTHD] ([STT], [MaHD], [MaKH], [TenKH], [MaSP], [TenSP], [NgayMua], [SoLuong], [GiaSP], [TongTien]) VALUES (3, N'HD01', N'KH02', N'Nguyễn Tuấn Kiệt', N'SP05', N'Xà Lách', CAST(N'2021-12-28' AS Date), 100, 17000, 1700000)
INSERT [dbo].[CTHD] ([STT], [MaHD], [MaKH], [TenKH], [MaSP], [TenSP], [NgayMua], [SoLuong], [GiaSP], [TongTien]) VALUES (4, N'HD01', N'KH01', N'Nguyễn Văn Tân', N'SP06', N'Xẻng Vận Dụng', CAST(N'2021-12-13' AS Date), 5, 10000, 50000)
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [NgayMua]) VALUES (N'HD01', N'KH01', CAST(N'2021-12-13' AS Date))
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [NgayMua]) VALUES (N'HD02', N'KH02', CAST(N'2021-11-24' AS Date))
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [NgayMua]) VALUES (N'HD03', N'KH03', CAST(N'2021-12-13' AS Date))
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [NgayMua]) VALUES (N'HD04', N'KH04', CAST(N'2021-12-13' AS Date))
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [NgayMua]) VALUES (N'HD05', N'KH05', CAST(N'2021-12-13' AS Date))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKh], [NgaySinh], [DiaChi], [SDT]) VALUES (N'KH01', N'Nguyễn Văn Tân', CAST(N'2001-07-08' AS Date), N'Phan Thiết', 30123512)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKh], [NgaySinh], [DiaChi], [SDT]) VALUES (N'KH02', N'Nguyễn Tuấn Kiệt', CAST(N'2003-03-12' AS Date), N'TP HCM', 34623154)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKh], [NgaySinh], [DiaChi], [SDT]) VALUES (N'KH03', N'Trần Hồng Nhi', CAST(N'2003-03-12' AS Date), N'TP HCM', 23165412)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKh], [NgaySinh], [DiaChi], [SDT]) VALUES (N'KH04', N'Trần Trọng Nhân', CAST(N'2004-11-05' AS Date), N'Phan Thiết', 215451221)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKh], [NgaySinh], [DiaChi], [SDT]) VALUES (N'KH05', N'Hoàng Minh Huệ', CAST(N'2001-01-25' AS Date), N'Phan Thiết', 345165441)
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [Email], [SDT]) VALUES (N'NCC01', N'Công ty cổ phần tăng trưởng hạt giống cây trồng VN', N'TP HCM', N'nhkhatgiong@gmail.com', 315545123)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [Email], [SDT]) VALUES (N'NCC02', N'Công ty Đông Nam', N'TP HCM', N'dongnamhg@gmail.com', 354456412)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [Email], [SDT]) VALUES (N'NCC03', N'Công ty sản lượng hạt giống', N'TP HCM', N'Slhatgiongvn@gmail.com', 231542245)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [IDCMND], [Email], [SDT], [NgayVaoLam], [MaCV]) VALUES (N'NV01', N'Kim Phương', CAST(N'2003-12-10' AS Date), N'Hồ Chí Minh', N'26546512', N'phuong2312@gmail.com', N'0214135421', CAST(N'2021-12-10' AS Date), N'CV02')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [IDCMND], [Email], [SDT], [NgayVaoLam], [MaCV]) VALUES (N'NV02', N'Minh Phát', CAST(N'2001-01-01' AS Date), N'Hồ Chí Minh', N'26452111', N'phat2321@gmail.com', N'0325465411', CAST(N'2020-10-10' AS Date), N'CV01')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [IDCMND], [Email], [SDT], [NgayVaoLam], [MaCV]) VALUES (N'NV03', N'Nguyễn Minh Phúc', CAST(N'2001-12-01' AS Date), N'Hồ Chí Minh', N'54512312', N'minhphat@gmail.com', N'346528791', CAST(N'2021-12-10' AS Date), N'CV01')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [IDCMND], [Email], [SDT], [NgayVaoLam], [MaCV]) VALUES (N'NV04', N'Nguyễn Hồng Phát', CAST(N'2001-12-01' AS Date), N'Hồ Chí Minh', N'1212312', N'hongphat@gmail.com', N'445128791', CAST(N'2021-12-10' AS Date), N'CV01')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [IDCMND], [Email], [SDT], [NgayVaoLam], [MaCV]) VALUES (N'NV05', N'Nguyễn Gia Ngọc', CAST(N'2000-12-20' AS Date), N'Hồ Chí Minh', N'54512312', N'giangoc123@gmail.com', N'346325760', CAST(N'2020-12-01' AS Date), N'CV02')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [IDCMND], [Email], [SDT], [NgayVaoLam], [MaCV]) VALUES (N'NV06', N'Phan Văn Tuyển', CAST(N'2001-06-01' AS Date), N'Quảng Ngãi', N'165465', N'546545', N'5465465', CAST(N'2021-01-01' AS Date), N'CV02')
GO
INSERT [dbo].[QUANLY] ([UserName], [PasswordHint]) VALUES (N'admin', N'admin')
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaSP], [SoLuong], [TrongLuong], [MaNCC]) VALUES (N'SP01', N'Cây Lúa', 50000, 15987, N'50kg', N'NCC01')
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaSP], [SoLuong], [TrongLuong], [MaNCC]) VALUES (N'SP012', N'Cây Dừa', 150000, 600, N'15kg', N'NCC01')
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaSP], [SoLuong], [TrongLuong], [MaNCC]) VALUES (N'SP03', N'Hạt Dâu', 20000, 4000, N'200g', N'NCC01')
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaSP], [SoLuong], [TrongLuong], [MaNCC]) VALUES (N'SP04', N'Rau Cải', 19000, 5000, N'200g', N'NCC02')
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaSP], [SoLuong], [TrongLuong], [MaNCC]) VALUES (N'SP05', N'Xà Lách', 17000, 3900, N'200g', N'NCC03')
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaSP], [SoLuong], [TrongLuong], [MaNCC]) VALUES (N'SP06', N'Xẻng Vận Dụng', 10000, 95, N'Không xác định', N'NCC01')
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaSP], [SoLuong], [TrongLuong], [MaNCC]) VALUES (N'SP07', N'Thuốc Diệt côn trùng', 100000, 100, N'Không xác định', N'NCC02')
GO
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [TenNV], [PhanQuyen]) VALUES (N'admin', N'admin', N'Kim Phương', N'Admin')
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [TenNV], [PhanQuyen]) VALUES (N'phat', N'phat', N'Minh Phát', N'Nhân Viên')
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [TenNV], [PhanQuyen]) VALUES (N'phuc', N'phuc', N'Nguyễn Minh Phúc', N'Nhân Viên')
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HOADON] ([MaHD])
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD FOREIGN KEY([MaCV])
REFERENCES [dbo].[CHUCVU] ([MaCV])
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
/****** Object:  StoredProcedure [dbo].[SP_SANPHAMMAX]    Script Date: 12/29/2021 3:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SANPHAMMAX]
AS
BEGIN
	SELECT SANPHAM.TenSP ,SUM(CTHD.SoLuong)AS 'SL'
	FROM SANPHAM, CTHD
	WHERE SANPHAM.MaSP = CTHD.MaSP
	GROUP BY SANPHAM.TenSP
	HAVING SUM(CTHD.SoLuong)>0 
	order by SL DESC
END
EXEC SP_SANPHAMMAX
GO
/****** Object:  StoredProcedure [dbo].[SP_THONGKE]    Script Date: 12/29/2021 3:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THONGKE]
AS
BEGIN
	SELECT YEAR(CTHD.NgayMua) AS 'NAM', SUM(CTHD.TongTien) AS 'DOANHTHU'
	FROM CTHD
	GROUP BY YEAR(CTHD.NgayMua)
END
EXEC SP_THONGKE
GO
/****** Object:  StoredProcedure [dbo].[SP_TONGTIENMUA]    Script Date: 12/29/2021 3:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TONGTIENMUA]
AS
BEGIN
	SELECT KHACHHANG.TenKh, Sum(TongTien) AS 'TIEN'
	FROM  KHACHHANG,CTHD
	WHERE KHACHHANG.MaKH = CTHD.MaKH
	GROUP BY KHACHHANG.TenKh
	HAVING SUM(TongTien)>20000
End
EXEC SP_TONGTIENMUA  
GO
/****** Object:  StoredProcedure [dbo].[Tk_NHACC]    Script Date: 12/29/2021 3:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tk_NHACC]
AS
BEGIN
	SELECT TenSP,SoLuong,TenNCC
	FROM SANPHAM,NHACUNGCAP
	WHERE SANPHAM.MaNCC = NHACUNGCAP.MaNCC And
			NHACUNGCAP.MaNCC Like N'%NCC01%'
END
EXEC Tk_NHACC
GO
/****** Object:  StoredProcedure [dbo].[Tk_SANPHAM]    Script Date: 12/29/2021 3:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tk_SANPHAM]
AS
BEGIN
	SELECT *
	FROM SANPHAM
	WHERE TenSP Like N'%Cây Dừa%'
END
EXEC Tk_SANPHAM
GO
USE [master]
GO
ALTER DATABASE [QLHG] SET  READ_WRITE 
GO
