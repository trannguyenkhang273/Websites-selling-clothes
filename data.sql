USE [master]
GO
/****** Object:  Database [DuAnTotNghiep]    Script Date: 2/8/2023 3:38:57 PM ******/
CREATE DATABASE [DuAnTotNghiep]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DuAnTotNghiep', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DuAnTotNghiep.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DuAnTotNghiep_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DuAnTotNghiep_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DuAnTotNghiep] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DuAnTotNghiep].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DuAnTotNghiep] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET ARITHABORT OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DuAnTotNghiep] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DuAnTotNghiep] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DuAnTotNghiep] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DuAnTotNghiep] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DuAnTotNghiep] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DuAnTotNghiep] SET  MULTI_USER 
GO
ALTER DATABASE [DuAnTotNghiep] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DuAnTotNghiep] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DuAnTotNghiep] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DuAnTotNghiep] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DuAnTotNghiep] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DuAnTotNghiep] SET QUERY_STORE = OFF
GO
USE [DuAnTotNghiep]
GO
/****** Object:  User [admin_tho]    Script Date: 2/8/2023 3:38:57 PM ******/
CREATE USER [admin_tho] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Admin]    Script Date: 2/8/2023 3:38:57 PM ******/
CREATE USER [Admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/8/2023 3:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [varchar](100) NOT NULL,
	[Password] [varchar](max) NULL,
	[Email] [varchar](100) NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [varchar](200) NULL,
	[Coin] [int] NULL,
	[PhoneNumber] [varchar](20) NULL,
	[CreateDate] [date] NULL,
	[Status] [nvarchar](30) NULL,
	[RoleId] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdditionalImages]    Script Date: 2/8/2023 3:38:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalImages](
	[AdditionalImagesId] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](200) NULL,
	[ProductId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdditionalImagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2/8/2023 3:38:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Province] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
	[DetailAddress] [nvarchar](100) NULL,
	[DefaultAddress] [bit] NULL,
	[AccountId] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 2/8/2023 3:38:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[BannerPath] [nvarchar](100) NULL,
	[Position] [varchar](30) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/8/2023 3:38:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailCart]    Script Date: 2/8/2023 3:38:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailCart](
	[DetailCartId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[ProductRepositoryId] [int] NULL,
	[AccountId] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailCartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailOrder]    Script Date: 2/8/2023 3:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailOrder](
	[DetailOrderId] [int] IDENTITY(1,1) NOT NULL,
	[ProductPrice] [float] NULL,
	[ListedPrice] [float] NULL,
	[Quantity] [int] NULL,
	[ProductRepositoryId] [int] NULL,
	[OrderId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KOL]    Script Date: 2/8/2023 3:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KOL](
	[KOLId] [int] IDENTITY(1,1) NOT NULL,
	[KOLFullName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[KOLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KOLvoucher]    Script Date: 2/8/2023 3:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KOLvoucher](
	[KOLvoucherId] [int] IDENTITY(1,1) NOT NULL,
	[KOLId] [int] NULL,
	[VoucherId] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[KOLvoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/8/2023 3:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [date] NULL,
	[ShipFee] [float] NULL,
	[ProductMoney] [float] NULL,
	[TotalMoney] [float] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[PaymentService] [nvarchar](200) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[VoucherId] [varchar](30) NULL,
	[AccountId] [varchar](100) NULL,
	[OrderStatusId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 2/8/2023 3:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusTitle] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/8/2023 3:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[purchaseprice] [float] NULL,
	[ListedPrice] [float] NULL,
	[SellingPrice] [float] NULL,
	[Describe] [nvarchar](200) NULL,
	[MainProductImage] [nvarchar](100) NULL,
	[ProductStatus] [bit] NULL,
	[StyleId] [int] NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDiscount]    Script Date: 2/8/2023 3:39:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDiscount](
	[ProductDiscountId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[DisCount] [float] NULL,
	[ProductId] [int] NULL,
	[AccountId] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductDiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRepository]    Script Date: 2/8/2023 3:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRepository](
	[ProductRepositoryId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[SizeId] [varchar](5) NULL,
	[ProductId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductRepositoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 2/8/2023 3:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](300) NULL,
	[RateDate] [date] NULL,
	[StarNumber] [float] NULL,
	[Picture1] [nvarchar](100) NULL,
	[Picture2] [nvarchar](100) NULL,
	[Picture3] [nvarchar](100) NULL,
	[Picture4] [nvarchar](100) NULL,
	[AccountId] [varchar](100) NULL,
	[ProductId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 2/8/2023 3:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token] [varchar](100) NULL,
	[createdAt] [datetime] NULL,
	[expiresAt] [datetime] NULL,
	[AccountId] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Response]    Script Date: 2/8/2023 3:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Response](
	[ResponseId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](300) NULL,
	[ResponseDate] [date] NULL,
	[RateId] [int] NULL,
	[AccountId] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/8/2023 3:39:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [varchar](10) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 2/8/2023 3:39:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeId] [varchar](5) NOT NULL,
	[Describe] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Style]    Script Date: 2/8/2023 3:39:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Style](
	[StyleId] [int] IDENTITY(1,1) NOT NULL,
	[StyleName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[StyleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 2/8/2023 3:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[VoucherId] [varchar](30) NOT NULL,
	[VoucherTitle] [nvarchar](50) NULL,
	[VoucherContent] [nvarchar](100) NULL,
	[MinimunMoney] [float] NULL,
	[PercentDiscount] [float] NULL,
	[MoneyDiscount] [float] NULL,
	[Quantity] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[VoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountId], [Password], [Email], [Name], [Avatar], [Coin], [PhoneNumber], [CreateDate], [Status], [RoleId]) VALUES (N'ad', N'$2a$10$l/J//h1g5aPIsUxO0I6lI.SHt.4pfk3jtRzNPVML75T67qmXd/Hru', N'thotaps18597@fpt.edu.vn', N'Thọ', NULL, NULL, N'03337376008', CAST(N'2022-11-27' AS Date), NULL, N'3')
SET IDENTITY_INSERT [dbo].[AdditionalImages] ON 

INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (1, N'ao_thun_1', 1)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (2, N'ao_thun_1_1', 1)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (3, N'ao_thun_1_2', 1)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (4, N'ao_thun_2', 2)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (5, N'ao_thun_2_1', 2)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (6, N'ao_thun_2_2', 2)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (7, N'ao_thun_2_3', 2)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (8, N'ao_thun_3', 3)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (9, N'ao_thun_3_1', 3)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (10, N'ao_thun_3_2', 3)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (11, N'ao_thun_3_3', 3)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (12, N'ao_thun_3_4', 3)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (13, N'ao_thun_4', 4)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (14, N'ao_thun_4_1', 4)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (15, N'ao_thun_4_2', 4)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (16, N'ao_thun_4_3', 4)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (17, N'ao_thun_4_4', 4)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (18, N'ao_thun_5', 5)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (19, N'ao_thun_5_1', 5)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (20, N'ao_thun_5_2', 5)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (21, N'ao_thun_5_3', 5)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (22, N'ao_thun_6', 6)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (23, N'ao_thun_6_1', 6)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (24, N'ao_thun_6_2', 6)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (25, N'ao_thun_6_3', 6)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (26, N'ao_thun_6_4', 6)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (27, N'ao_thun_7', 7)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (28, N'ao_thun_7_1', 7)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (29, N'ao_thun_7_2', 7)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (30, N'ao_thun_7_3', 7)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (31, N'ao_thun_8', 8)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (32, N'ao_thun_8_1', 8)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (33, N'ao_thun_8_2', 8)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (34, N'ao_thun_8_3', 8)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (35, N'ao_thun_8_4', 8)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (36, N'ao_thun_9', 9)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (37, N'ao_thun_9_1', 9)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (38, N'ao_thun_9_2', 9)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (39, N'ao_thun_9_3', 9)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (40, N'ao_thun_9_4', 9)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (41, N'ao_thun_10', 10)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (42, N'ao_thun_10_1', 10)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (43, N'ao_thun_10_2', 10)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (44, N'ao_thun_10_3', 10)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (45, N'ao_thun_10_4', 10)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (46, N'ao_thun_11', 11)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (47, N'ao_thun_11_1', 11)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (48, N'ao_thun_11_2', 11)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (49, N'ao_thun_11_3', 11)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (50, N'ao_thun_11_4', 11)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (51, N'ao_thun_12', 12)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (52, N'ao_thun_12_1', 12)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (53, N'ao_thun_12_2', 12)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (54, N'ao_thun_12_3', 12)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (55, N'ao_thun_13', 13)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (56, N'ao_thun_13_1', 13)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (57, N'ao_thun_13_2', 13)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (58, N'ao_thun_13_3', 13)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (59, N'ao_thun_13_4', 13)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (60, N'ao_thun_14', 14)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (61, N'ao_thun_14_1', 14)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (62, N'ao_thun_14_2', 14)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (63, N'ao_thun_14_3', 14)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (64, N'ao_thun_15', 15)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (65, N'ao_thun_15_1', 15)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (66, N'ao_thun_15_2', 15)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (67, N'ao_thun_15_3', 15)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (68, N'ao_thun_15_4', 15)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (69, N'ao_thun_16', 16)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (70, N'ao_thun_16_1', 16)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (71, N'ao_thun_16_2', 16)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (72, N'ao_thun_16_3', 16)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (73, N'ao_thun_16_4', 16)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (74, N'outwear1', 17)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (75, N'outwear1_1', 17)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (76, N'outwear1_2', 17)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (77, N'outwear2', 18)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (78, N'outwear2_1', 18)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (79, N'outwear2_2', 18)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (80, N'outwear2_3', 18)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (81, N'outwear2_4', 18)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (82, N'outwear3', 19)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (83, N'outwear3_1', 19)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (84, N'outwear3_2', 19)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (85, N'outwear3_3', 19)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (86, N'outwear3_4', 19)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (87, N'outwear4', 20)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (88, N'outwear4_1', 20)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (89, N'outwear4_2', 20)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (90, N'outwear4_3', 20)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (91, N'outwear4_4', 20)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (92, N'outwear5', 21)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (93, N'outwear5_1', 21)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (94, N'outwear5_2', 21)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (95, N'outwear5_3', 21)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (96, N'outwear5_4', 21)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (97, N'outwear6', 22)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (98, N'outwear6_1', 22)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (99, N'outwear6_2', 22)
GO
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (100, N'outwear6_3', 22)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (101, N'outwear6_4', 22)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (102, N'outwear7', 23)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (103, N'outwear7_1', 23)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (104, N'outwear7_2', 23)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (105, N'outwear7_3', 23)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (106, N'outwear8', 24)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (107, N'outwear8_1', 24)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (108, N'outwear8_2', 24)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (109, N'outwear8_3', 24)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (110, N'outwear8_4', 24)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (111, N'outwear9', 25)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (112, N'outwear9_1', 25)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (113, N'outwear9_2', 25)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (114, N'outwear9_3', 25)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (115, N'outwear9_4', 25)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (116, N'outwear10', 26)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (117, N'outwear10_1', 26)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (118, N'outwear10_2', 26)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (119, N'outwear10_4', 26)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (120, N'outwear10_4', 26)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (121, N'outwear11', 27)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (122, N'outwear11_1', 27)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (123, N'outwear11_2', 27)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (124, N'outwear11_3', 27)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (125, N'outwear11_4', 27)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (126, N'outwear12', 28)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (127, N'outwear12_1', 28)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (128, N'outwear12_2', 28)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (129, N'outwear12_3', 28)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (130, N'outwear12_4', 28)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (131, N'outwear13', 29)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (132, N'outwear13_1', 29)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (133, N'outwear13_2', 29)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (134, N'outwear13_3', 29)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (135, N'outwear13_4', 29)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (136, N'outwear13_5', 29)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (137, N'outwear14', 30)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (138, N'outwear14_1', 30)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (139, N'outwear14_2', 30)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (140, N'outwear14_3', 30)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (141, N'outwear14_4', 30)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (142, N'bottom1', 31)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (143, N'bottom1_1', 31)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (144, N'bottom1_2', 31)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (145, N'bottom1_3', 31)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (146, N'bottom1_4', 31)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (147, N'bottom2', 32)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (148, N'bottom2_1', 32)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (149, N'bottom2_2', 32)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (150, N'bottom2_3', 32)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (151, N'bottom2_4', 32)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (152, N'bottom2_5', 32)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (153, N'bottom3', 33)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (154, N'bottom3_1', 33)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (155, N'bottom3_2', 33)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (156, N'bottom3_3', 33)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (157, N'bottom3_4', 33)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (158, N'bottom4', 34)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (159, N'bottom4_1', 34)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (160, N'bottom4_2', 34)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (161, N'bottom4_3', 34)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (162, N'bottom4_4', 34)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (163, N'bottom5', 35)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (164, N'bottom5_1', 35)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (165, N'bottom5_2', 35)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (166, N'bottom5_3', 35)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (167, N'bottom5_4', 35)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (168, N'bottom6', 36)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (169, N'bottom6_1', 36)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (170, N'bottom6_2', 36)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (171, N'bottom6_3', 36)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (172, N'bottom6_4', 36)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (173, N'bottom7', 37)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (174, N'bottom7_1', 37)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (175, N'bottom7_2', 37)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (176, N'bottom7_3', 37)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (177, N'bottom8', 38)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (178, N'bottom8_1', 38)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (179, N'bottom8_2', 38)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (180, N'bottom8_3', 38)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (181, N'bottom9', 39)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (182, N'bottom9_1', 39)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (183, N'bottom9_2', 39)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (184, N'bottom9_3', 39)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (185, N'bottom10', 40)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (186, N'bottom10_1', 40)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (187, N'bottom10_2', 40)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (188, N'bottom10_3', 40)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (189, N'bottom10_4', 40)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (190, N'bottom11', 41)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (191, N'bottom11_1', 41)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (192, N'bottom11_2', 41)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (193, N'bottom11_3', 41)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (194, N'bottom11_4', 41)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (195, N'bottom12', 42)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (196, N'bottom12_1', 42)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (197, N'bottom12_2', 42)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (198, N'bottom12_3', 42)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (199, N'bottom12_4', 42)
GO
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (200, N'bottom13', 43)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (201, N'bottom13_1', 43)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (202, N'bottom13_2', 43)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (203, N'bottom13_3', 43)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (204, N'bottom13_4', 43)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (205, N'bottomlong1', 44)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (206, N'bottomlong1_1', 44)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (207, N'bottomlong1_2', 44)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (208, N'bottomlong1_3', 44)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (209, N'bottomlong1_4', 44)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (210, N'bottomlong2', 45)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (211, N'bottomlong2_1', 45)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (212, N'bottomlong2_2', 45)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (213, N'bottomlong2_3', 45)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (214, N'bottomlong2_4', 45)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (215, N'bottomlong2_5', 45)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (216, N'bottomlong3', 46)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (217, N'bottomlong3_1', 46)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (218, N'bottomlong3_2', 46)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (219, N'bottomlong3_3', 46)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (220, N'bottomlong3_4', 46)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (221, N'bottomlong3_5', 46)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (222, N'bottomlong4', 47)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (223, N'bottomlong4_1', 47)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (224, N'bottomlong4_2', 47)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (225, N'bottomlong4_3', 47)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (226, N'bottomlong4_4', 47)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (227, N'bottomlong4_5', 47)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (228, N'bottomlong5', 48)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (229, N'bottomlong5_1', 48)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (230, N'bottomlong5_2', 48)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (231, N'bottomlong5_3', 48)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (232, N'bottomlong5_4', 48)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (233, N'bottomlong5_5', 48)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (234, N'bottomlong6', 49)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (235, N'bottomlong6_1', 49)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (236, N'bottomlong6_2', 49)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (237, N'bottomlong6_3', 49)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (238, N'bottomlong6_4', 49)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (239, N'bottomlong6_5', 49)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (240, N'accessories1', 50)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (241, N'accessories1_1', 50)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (242, N'accessories1_2', 50)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (243, N'accessories1_3', 50)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (244, N'accessories1_4', 50)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (245, N'accessories2', 51)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (246, N'accessories2_1', 51)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (247, N'accessories2_2', 51)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (248, N'accessories2_3', 51)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (249, N'accessories3', 52)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (250, N'accessories3_1', 52)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (251, N'accessories3_2', 52)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (252, N'accessories3_3', 52)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (253, N'accessories3_4', 52)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (254, N'accessories3_5', 52)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (255, N'accessories4', 53)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (256, N'accessories4_1', 53)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (257, N'accessories4_2', 53)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (258, N'accessories4_3', 53)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (259, N'accessories4_4', 53)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (260, N'accessories5', 54)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (261, N'accessories5_1', 54)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (262, N'accessories5_2', 54)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (263, N'accessories6', 55)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (264, N'accessories6_1', 55)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (265, N'accessories6_2', 55)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (266, N'accessories6_3', 55)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (267, N'accessories6_4', 55)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (268, N'accessories7', 56)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (269, N'accessories7_1', 56)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (270, N'accessories7_2', 56)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (271, N'accessories7_3', 56)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (272, N'accessories7_4', 56)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (273, N'accessories8', 57)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (274, N'accessories8_1', 57)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (275, N'accessories8_2', 57)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (276, N'accessories8_3', 57)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (277, N'accessories8_4', 57)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (278, N'accessories9', 58)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (279, N'accessories9_1', 58)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (280, N'accessories9_2', 58)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (281, N'accessories10', 59)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (282, N'accessories10_1', 59)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (283, N'accessories10_2', 59)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (284, N'accessories10_3', 59)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (285, N'accessories10_4', 59)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (286, N'accessories10_5', 59)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (287, N'accessories11', 60)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (288, N'accessories11_1', 60)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (289, N'accessories11_2', 60)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (290, N'accessories12', 61)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (291, N'accessories12_1', 61)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (292, N'accessories12_2', 61)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (293, N'accessories13', 62)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (294, N'accessories13_1', 62)
INSERT [dbo].[AdditionalImages] ([AdditionalImagesId], [ImagePath], [ProductId]) VALUES (295, N'accessories13_2', 62)
SET IDENTITY_INSERT [dbo].[AdditionalImages] OFF
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerId], [BannerPath], [Position], [StartDate], [EndDate]) VALUES (3, N'5cc4b728.jpg', N'Middle', CAST(N'2022-12-02' AS Date), CAST(N'2023-01-07' AS Date))
INSERT [dbo].[Banner] ([BannerId], [BannerPath], [Position], [StartDate], [EndDate]) VALUES (4, N'682bb8c6.jpg', N'Right', CAST(N'2022-12-11' AS Date), CAST(N'2022-12-11' AS Date))
INSERT [dbo].[Banner] ([BannerId], [BannerPath], [Position], [StartDate], [EndDate]) VALUES (5, N'1745502b.jpg', N'Left', CAST(N'2022-12-11' AS Date), CAST(N'2022-12-11' AS Date))
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'T - Shirts')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Outwears')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Shorts')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Pants')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Accessories')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[DetailOrder] ON 

INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (24, 270000, 340000, 2, 3, 20)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (25, 270000, 340000, 1, 4, 21)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (26, 270000, 340000, 1, 5, 21)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (27, 270000, 340000, 1, 7, 21)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (28, 270000, 340000, 1, 4, 22)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (29, 270000, 340000, 2, 3, 22)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (30, 270000, 340000, 1, 1, 22)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (31, 270000, 340000, 1, 9, 23)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (32, 270000, 340000, 1, 7, 23)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (33, 240000, 300000, 1, 16, 24)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (34, 270000, 340000, 1, 14, 25)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (35, 270000, 340000, 1, 4, 25)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (36, 240000, 300000, 2, 17, 27)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (37, 270000, 340000, 3, 14, 27)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (38, 270000, 340000, 2, 15, 27)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (39, 240000, 300000, 2, 27, 28)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (40, 240000, 300000, 1, 16, 28)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (41, 240000, 300000, 2, 22, 28)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (42, 240000, 300000, 1, 25, 29)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (43, 240000, 300000, 1, 17, 29)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (44, 240000, 300000, 1, 23, 29)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (45, 270000, 340000, 1, 14, 39)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (46, 240000, 300000, 2, 17, 39)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (47, 240000, 300000, 3, 23, 39)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (48, 240000, 300000, 1, 25, 39)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (49, 270000, 340000, 4, 14, 40)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (50, 240000, 300000, 2, 16, 40)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (51, 280000, 340000, 4, 44, 40)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (52, 270000, 340000, 1, 13, 41)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (53, 240000, 300000, 1, 17, 41)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (54, 270000, 340000, 1, 5, 41)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (55, 270000, 340000, 2, 4, 41)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (56, 280000, 340000, 1, 44, 41)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (57, 270000, 340000, 1, 5, 42)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (58, 240000, 300000, 1, 35, 42)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (59, 240000, 360000, 1, 32, 42)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (60, 270000, 340000, 1, 4, 43)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (61, 240000, 300000, 1, 36, 43)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (62, 280000, 340000, 2, 44, 43)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (63, 240000, 360000, 1, 33, 43)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (64, 240000, 360000, 1, 32, 44)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (65, 270000, 340000, 1, 5, 44)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (66, 270000, 340000, 2, 5, 45)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (67, 280000, 340000, 2, 44, 45)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (68, 240000, 360000, 1, 32, 45)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (69, 240000, 360000, 4, 33, 46)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (70, 250000, 320000, 2, 38, 46)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (71, 250000, 320000, 1, 38, 47)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (72, 240000, 360000, 1, 33, 47)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (73, 250000, 320000, 1, 38, 48)
INSERT [dbo].[DetailOrder] ([DetailOrderId], [ProductPrice], [ListedPrice], [Quantity], [ProductRepositoryId], [OrderId]) VALUES (74, 240000, 360000, 1, 33, 48)
SET IDENTITY_INSERT [dbo].[DetailOrder] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (20, CAST(N'2022-11-11' AS Date), 28300, 540000, 368300, N'0123456789', N'Nhanh', NULL, N'Hồ Chí Minh, Quận 1, Phường nguyễn thái bình, 123', N'Thanh toán tiền mặt', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (21, CAST(N'2022-10-11' AS Date), 14650, 810000, 624650, N'0123456789', N'Nhanh', NULL, N'Hà Nội, Quận Hà Đông, Phường quang trung, Gần trường học Quang Trung', N'Thanh toán tiền mặt', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (22, CAST(N'2022-09-11' AS Date), 14650, 1080000, 894650, N'0124567891', N'Nhanh', NULL, N'Hà Nội, Quận Hai Bà Trưng, Phường minh khai, Đường Minh Khai', N'Thanh toán bằng thẻ', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (23, CAST(N'2022-08-11' AS Date), 28300, 540000, 368300, N'0123456789', N'Nhanh', NULL, N'Hồ Chí Minh, Quận 1, Phường nguyễn thái bình, Đường Quang Trung', N'Thanh toán bằng thẻ', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (24, CAST(N'2022-07-11' AS Date), 35650, 240000, 75650, N'0852963741', N'Nhanh', NULL, N'Hồ Chí Minh, Quận 1, Phường nguyễn cư trinh, Khu dân cư Văn Minh', N'Thanh toán tiền mặt', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (25, CAST(N'2022-06-11' AS Date), 28300, 540000, 368300, N'0852741963', N'Nhanh', NULL, N'Bà Rịa - Vũng Tàu, Huyện Long Điền, Xã an nhứt, Nhà thờ Hy Vọng', N'Thanh toán tiền mặt', N'2', N'ad', 3)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (26, CAST(N'2022-05-11' AS Date), 28300, 540000, 368300, N'0123456789', N'Nhanh', NULL, N'Hồ Chí Minh, Quận 1, Phường nguyễn thái bình, Đường Quang Trung', N'Thanh toán bằng thẻ', N'2', N'ad', 2)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (27, CAST(N'2022-02-11' AS Date), 14650, 2790000, 2804650, N'0852963147', N'Nhanh', NULL, N'Hà Nội, Quận Hai Bà Trưng, Phường minh khai, Trường Tôn Đức Thắng', N'Thanh toán tiền mặt', NULL, N'ad', 2)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (28, CAST(N'2022-03-11' AS Date), 13600, 1950000, 1963600, N'0987654123', N'Nhanh', NULL, N'Hà Nội, Quận Hai Bà Trưng, Phường minh khai, đường minh khai', N'Thanh toán tiền mặt', NULL, N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (29, CAST(N'2022-04-11' AS Date), 30400, 990000, 1020400, N'0741852963', N'Tiêu chuẩn', NULL, N'Hồ Chí Minh, Quận 10, Phường 2, Cty Lô Hội', N'Thanh toán bằng thẻ', NULL, N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (39, CAST(N'2022-05-11' AS Date), 35650, 1710000, 1745650, N'0963852741', N'Nhanh', NULL, N'Hồ Chí Minh, Quận 10, Phường 2, Cty LoHoi', N'Thanh toán bằng thẻ', NULL, N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (40, CAST(N'2022-12-11' AS Date), 28300, 3220000, 3048300, N'0852741963', N'Nhanh', NULL, N'Hồ Chí Minh, Quận 4, Phường 9, Trường Hoa Sen', N'Thanh toán tiền mặt', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (41, CAST(N'2022-12-11' AS Date), 35650, 1600000, 1635650, N'0852741963', N'Nhanh', NULL, N'Hồ Chí Minh, Quận 5, Phường 3, Trường Hoa Sen', N'Thanh toán bằng thẻ', NULL, N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (42, CAST(N'2022-03-11' AS Date), 30400, 1030000, 860400, N'0123456789', N'Tiêu chuẩn', NULL, N'An Giang, Huyện Châu Thành, Xã an hoà, Trường An Khang', N'Thanh toán tiền mặt', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (43, CAST(N'2022-12-11' AS Date), 30400, 1310000, 1140400, N'0963852741', N'Tiêu chuẩn', NULL, N'An Giang, Huyện Châu Phú, Thị trấn cái dầu, Chùa An Vương', N'Thanh toán tiền mặt', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (44, CAST(N'2022-02-11' AS Date), 30400, 510000, 340400, N'0852741963', N'Tiêu chuẩn', NULL, N'Hồ Chí Minh, Quận 10, Phường 1, Đường Lê Quý Đôn', N'Thanh toán tiền mặt', N'2', N'ad', 3)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (45, CAST(N'2022-01-11' AS Date), 30400, 1340000, 1170400, N'02589363741', N'Tiêu chuẩn', NULL, N'Hồ Chí Minh, Quận 10, Phường 2, Cty An Phú', N'Thanh toán bằng thẻ', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (46, CAST(N'2022-06-11' AS Date), 30400, 1460000, 1290400, N'0963852741', N'Nhanh', NULL, N'Bắc Ninh, Huyện Gia Bình, Xã đại bái, Đường Cách mạng tháng 8', N'Thanh toán bằng thẻ', N'2', N'ad', 4)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (47, CAST(N'2022-12-11' AS Date), 30400, 490000, 520400, N'0963852741', N'Tiêu chuẩn', NULL, N'Hồ Chí Minh, Quận 10, Phường 2, Cty LoHoi', N'Thanh toán bằng thẻ', NULL, N'ad', 1)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [ShipFee], [ProductMoney], [TotalMoney], [PhoneNumber], [PaymentService], [Email], [Address], [PaymentMethod], [VoucherId], [AccountId], [OrderStatusId]) VALUES (48, CAST(N'2022-12-11' AS Date), 30400, 490000, 320400, N'02589363741', N'Tiêu chuẩn', NULL, N'An Giang, Huyện Châu Thành, Xã an hoà, Cty An Nhiên', N'Thanh toán bằng thẻ', N'2', N'ad', 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([OrderStatusId], [OrderStatusTitle]) VALUES (1, N'Chưa xử lý')
INSERT [dbo].[OrderStatus] ([OrderStatusId], [OrderStatusTitle]) VALUES (2, N'Đang giao')
INSERT [dbo].[OrderStatus] ([OrderStatusId], [OrderStatusTitle]) VALUES (3, N'Đã hủy')
INSERT [dbo].[OrderStatus] ([OrderStatusId], [OrderStatusTitle]) VALUES (4, N'Thành công')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (1, N'WHITE SOUTHSIDE TEE', 150000, 340000, 270000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_1', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (2, N'BLACK SOUTHSIDE TEE', 150000, 340000, 270000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_2', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (3, N'BLACK SIMPLICITY POLO', 150000, 340000, 270000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_3', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (4, N'WHITE SIMPLICITY POLO', 150000, 340000, 270000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_4', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (5, N'AQUARELLE TEE ', 150000, 340000, 270000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_5', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (6, N'GREY MINI LOGO POLO', 150000, 300000, 240000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_6', 1, 2, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (7, N'CREAM MINI LOGO POLO', 150000, 300000, 240000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_7', 1, 2, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (8, N'BLACK MINI LOGO POLO', 150000, 300000, 240000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_8', 1, 2, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (9, N'WHITE MINI LOGO POLO', 150000, 300000, 240000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_9', 1, 2, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (10, N'BLACK SIMPLICITY TEE', 150000, 300000, 240000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_10', 1, 2, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (11, N'BLACK DESTINY TEE', 150000, 360000, 240000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_11', 1, 2, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (12, N'MALLARD BLUE EMINENCE TEE', 150000, 300000, 240000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_12', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (13, N'MALLARD BLUE EMINENCE TEE', 150000, 320000, 250000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_13', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (14, N'MALLARD BROW EMINENCE TEE', 150000, 340000, 250000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_14', 1, 2, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (15, N'MOSS EMINENCE TEE', 150000, 340000, 280000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_15', 1, 2, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (16, N'TAN BLUE EMINENCE TEE', 150000, 340000, 290000, N'– Chất liệu: Chất liệu: 100% Cotton Chính Phẩm 2 chiều, định lượng 250gsm– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'ao_thun_16', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (17, N'PEPPER REFLECTION HOODIE', 150000, 550000, 450000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear1', 1, 3, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (18, N'GREY DESTINY HOODIE', 150000, 550000, 450000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear2', 1, 3, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (19, N'HOTROD JACKET RACING', 150000, 550000, 450000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear3', 1, 3, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (20, N'MOCHA EMINENCE HOODIE ZIP', 150000, 550000, 450000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear4', 1, 3, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (21, N'BLACK EMINENCE HOODIE ZIP', 150000, 450000, 400000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear5', 1, 3, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (22, N'GRAY EMINENCE HOODIE ZIP', 150000, 450000, 400000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear6', 1, 3, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (23, N'TAN EMINENCE HOODIE ZIP', 150000, 450000, 400000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear7', 1, 3, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (24, N'GREY SOLID CORDUROY JACKET ', 150000, 450000, 400000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear8', 1, 4, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (25, N'BLACK SOLID CORDUROY JACKET ', 150000, 450000, 400000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear9', 1, 4, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (26, N'WHITE SOLID CORDUROY JACKET ', 150000, 420000, 390000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear10', 1, 4, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (27, N'HOODIE ZIP FLORA BEAN: ', 150000, 420000, 390000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear11', 1, 4, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (28, N'HOODIE ZIP FLORA WHITE: ', 150000, 420000, 390000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear12', 1, 4, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (29, N'HOODIE ZIP FLORA BLACK ', 150000, 420000, 390000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear13', 1, 4, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (30, N'HOODIE ZIP FLORA PEPPER ', 150000, 420000, 390000, N'- Chất Liệu: Nỉ Chân Cua- Họa tiết: Hình in cao su- Kiểu dáng: Regular fit.', N'outwear14', 1, 4, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (31, N'GREEN CASUAL SHORT', 150000, 350000, 280000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom1', 1, 1, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (32, N'GRAY CASUAL SHORT', 150000, 350000, 280000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom2', 1, 1, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (33, N'BLACK CASUAL SHORT', 150000, 350000, 280000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom3', 1, 1, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (34, N'BROWN CASUAL SHORT', 150000, 350000, 280000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom4', 1, 2, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (35, N'NAVY CASUAL SHORT', 150000, 350000, 280000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom5', 1, 2, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (36, N'PEPPER CASUAL SHORT', 150000, 350000, 280000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom6', 1, 3, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (37, N'BLACK SOLID CORDUROY SHORT', 150000, 380000, 250000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom7', 1, 3, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (38, N'TAN SOLID CORDUROY SHORT', 150000, 380000, 250000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom8', 1, 3, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (39, N'GREY SOLID CORDUROY SHORT', 150000, 380000, 250000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom9', 1, 4, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (40, N'BLUE SOLID CORDUROY SHORT', 150000, 380000, 250000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom10', 1, 4, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (41, N'SHORT FLORA WHITE', 150000, 350000, 210000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom11', 1, 4, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (42, N'SHORT FLORA BLACK', 150000, 350000, 210000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom12', 1, 4, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (43, N'SHORT FLORA GREY', 150000, 350000, 210000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottom13', 1, 4, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (44, N'TAN SOLID CORDUROY PANTS', 150000, 450000, 225000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottomlong1', 1, 2, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (45, N'BLACK SOLID CORDUROY PANTS', 150000, 450000, 225000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottomlong2', 1, 2, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (46, N'WHITE SOLID CORDUROY PANTS', 150000, 450000, 225000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottomlong3', 1, 3, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (47, N'PANTS FLORA WHITE', 150000, 390000, 234000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottomlong4', 1, 4, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (48, N'PANTS FLORA BLACK', 150000, 390000, 234000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottomlong5', 1, 3, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (49, N'PANTS FLORA PEPPER', 150000, 390000, 234000, N'– Chất liệu: Cotton nỉ bông, 350 GSM– Họa tiết: In lụa bền bỉ– Kiểu dáng: Form Regular Fit hiện đại phù hợp cho cả Nam lẫn Nữ.', N'bottomlong6', 1, 1, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (50, N'SHORT SAFFIANO WALLET', 150000, 420000, 280000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories1', 1, 1, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (51, N'LONG SAFFIANO WALLET', 150000, 420000, 280000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories2', 1, 1, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (52, N'GIFT PACKAGING SERVICE', 150000, 120000, 80000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories3', 1, 1, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (53, N'SOLID CAMP HAT', 150000, 250000, 125000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories4', 1, 1, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (54, N'SOLID SHOULDER BAG', 150000, 420000, 280000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories5', 1, 2, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (55, N'SOLID MESSENGER BAG GREY', 150000, 420000, 280000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories6', 1, 2, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (56, N'SOLID KEY CHAIN', 150000, 120000, 80000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories7', 1, 2, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (57, N'TOTE SOLID', 150000, 250000, 125000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories8', 1, 2, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (58, N'BACKPACK 83 NAVY', 150000, 420000, 280000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories9', 1, 3, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (59, N'BACKPACK DAYBACK1 LIGHTGREY', 150000, 420000, 280000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories10', 1, 3, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (60, N'BEANIE S GREY', 150000, 150000, 75000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories11', 1, 3, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (61, N'BEANIE S BLUE', 150000, 150000, 75000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories12', 1, 3, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (62, N'BEANIE S BLACK', 150000, 150000, 75000, N'–Chất Liệu: Da Saffiano cao cấp- Chi tiết: In UV Printing- Ví da được sơn mài góc cạnh tăng tính thẩm mỹ', N'accessories13', 1, 4, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (63, NULL, 150000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [purchaseprice], [ListedPrice], [SellingPrice], [Describe], [MainProductImage], [ProductStatus], [StyleId], [CategoryId]) VALUES (64, N'New Shirt', 990000, 159000, 139000, N'Beautiful', N'fe30078f.jpg', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductDiscount] ON 

INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (5, CAST(N'2022-11-29' AS Date), CAST(N'2023-01-05' AS Date), 200000, 2, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (6, CAST(N'2022-11-29' AS Date), CAST(N'2023-01-05' AS Date), 200000, 3, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (7, CAST(N'2022-11-29' AS Date), CAST(N'2023-01-05' AS Date), 200000, 1, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (8, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-11' AS Date), 399000, 1, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (9, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-11' AS Date), 399000, 2, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (10, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-11' AS Date), 399000, 17, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (11, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-11' AS Date), 399000, 18, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (12, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-11' AS Date), 399000, 3, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (13, CAST(N'2022-12-07' AS Date), CAST(N'2023-01-05' AS Date), 199000, 2, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (14, CAST(N'2022-12-07' AS Date), CAST(N'2023-01-05' AS Date), 199000, 1, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (15, CAST(N'2022-12-07' AS Date), CAST(N'2023-01-05' AS Date), 199000, 18, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (16, CAST(N'2022-12-07' AS Date), CAST(N'2023-01-05' AS Date), 199000, 17, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (17, CAST(N'2022-12-07' AS Date), CAST(N'2023-01-05' AS Date), 199000, 3, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (18, CAST(N'2022-12-07' AS Date), CAST(N'2023-01-05' AS Date), 199000, 45, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (19, CAST(N'2022-12-07' AS Date), CAST(N'2023-01-05' AS Date), 199000, 46, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (20, CAST(N'2022-12-07' AS Date), CAST(N'2023-01-05' AS Date), 199000, 44, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (21, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 45, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (22, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 1, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (23, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 31, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (24, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 46, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (25, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 17, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (26, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 2, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (27, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 18, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (28, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 44, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (29, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 3, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (30, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 33, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (31, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-31' AS Date), 200000, 32, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (32, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 1, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (33, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 45, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (34, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 31, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (35, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 46, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (36, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 18, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (37, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 44, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (38, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 17, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (39, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 3, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (40, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 2, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (41, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 32, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (42, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 14, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (43, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 33, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (44, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 7, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (45, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 12, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (46, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-22' AS Date), 180000, 10, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (47, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 17, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (48, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 18, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (49, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 1, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (50, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 2, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (51, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 31, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (52, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 3, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (53, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 46, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (54, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 45, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (55, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 32, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (56, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 44, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (57, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 28, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (58, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 29, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (59, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 33, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (60, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 12, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (61, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 30, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (62, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 10, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (63, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 27, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (64, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 7, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (65, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 25, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (66, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 26, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (67, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 23, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (68, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 14, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (69, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 24, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (70, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 17, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (71, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 22, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (72, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 18, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (73, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 20, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (74, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 21, N'ad')
INSERT [dbo].[ProductDiscount] ([ProductDiscountId], [StartDate], [EndDate], [DisCount], [ProductId], [AccountId]) VALUES (75, CAST(N'2022-12-11' AS Date), CAST(N'2022-12-24' AS Date), 200000, 19, N'ad')
SET IDENTITY_INSERT [dbo].[ProductDiscount] OFF
SET IDENTITY_INSERT [dbo].[ProductRepository] ON 

INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (1, 10, N'M', 1)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (2, 15, N'L', 1)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (3, 11, N'XL', 1)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (4, 5, N'M', 2)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (5, 9, N'L', 2)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (6, 30, N'XL', 2)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (7, 9, N'M', 3)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (8, 15, N'L', 3)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (9, 9, N'XL', 3)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (10, 11, N'M', 4)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (11, 15, N'L', 4)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (12, 10, N'XL', 4)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (13, 10, N'M', 5)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (14, 6, N'L', 5)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (15, 8, N'XL', 5)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (16, 7, N'M', 6)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (17, 9, N'L', 6)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (18, 0, N'XL', 6)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (19, 11, N'M', 7)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (20, 20, N'L', 7)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (21, 10, N'XL', 7)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (22, 9, N'M', 8)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (23, 11, N'L', 8)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (24, 10, N'XL', 8)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (25, 9, N'M', 9)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (26, 15, N'L', 9)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (27, 8, N'XL', 9)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (28, 11, N'M', 10)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (29, 15, N'L', 10)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (30, 10, N'XL', 10)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (31, 11, N'M', 11)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (32, 12, N'L', 11)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (33, 3, N'XL', 11)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (34, 11, N'M', 12)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (35, 14, N'L', 12)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (36, 9, N'XL', 12)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (37, 11, N'M', 13)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (38, 11, N'L', 13)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (39, 10, N'XL', 13)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (40, 11, N'M', 14)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (41, 15, N'L', 14)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (42, 10, N'XL', 14)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (43, 11, N'M', 15)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (44, 6, N'L', 15)
INSERT [dbo].[ProductRepository] ([ProductRepositoryId], [Quantity], [SizeId], [ProductId]) VALUES (45, 10, N'XL', 16)
SET IDENTITY_INSERT [dbo].[ProductRepository] OFF
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (N'1', N'GUEST')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (N'2', N'STAFF')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (N'3', N'MANAGER')
INSERT [dbo].[Size] ([SizeId], [Describe]) VALUES (N'L', NULL)
INSERT [dbo].[Size] ([SizeId], [Describe]) VALUES (N'M', NULL)
INSERT [dbo].[Size] ([SizeId], [Describe]) VALUES (N'XL', NULL)
SET IDENTITY_INSERT [dbo].[Style] ON 

INSERT [dbo].[Style] ([StyleId], [StyleName]) VALUES (1, N'Thanh lịch')
INSERT [dbo].[Style] ([StyleId], [StyleName]) VALUES (2, N'Dễ thương')
INSERT [dbo].[Style] ([StyleId], [StyleName]) VALUES (3, N'Thoải mái')
INSERT [dbo].[Style] ([StyleId], [StyleName]) VALUES (4, N'Gợi cảm')
SET IDENTITY_INSERT [dbo].[Style] OFF
INSERT [dbo].[Voucher] ([VoucherId], [VoucherTitle], [VoucherContent], [MinimunMoney], [PercentDiscount], [MoneyDiscount], [Quantity], [StartDate], [EndDate]) VALUES (N'1', N'Càng mua càng vui', N'Giảm 20%(tối đa 50.000đ) cho đơn hàng từ 500.000đ', 50000, 20, 500000, 20, CAST(N'2022-02-02' AS Date), CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Voucher] ([VoucherId], [VoucherTitle], [VoucherContent], [MinimunMoney], [PercentDiscount], [MoneyDiscount], [Quantity], [StartDate], [EndDate]) VALUES (N'2', N'Mua nhiều lãi nhiều', N'Giảm 15%(tối đa 30,000đ) cho đơn hàng tối thiểu 200.000đ', 30000, 15, 200000, 7, CAST(N'2022-02-02' AS Date), CAST(N'2023-01-01' AS Date))
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[AdditionalImages]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[DetailCart]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[DetailCart]  WITH CHECK ADD FOREIGN KEY([ProductRepositoryId])
REFERENCES [dbo].[ProductRepository] ([ProductRepositoryId])
GO
ALTER TABLE [dbo].[DetailOrder]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[DetailOrder]  WITH CHECK ADD FOREIGN KEY([ProductRepositoryId])
REFERENCES [dbo].[ProductRepository] ([ProductRepositoryId])
GO
ALTER TABLE [dbo].[KOLvoucher]  WITH CHECK ADD FOREIGN KEY([KOLId])
REFERENCES [dbo].[KOL] ([KOLId])
GO
ALTER TABLE [dbo].[KOLvoucher]  WITH CHECK ADD FOREIGN KEY([VoucherId])
REFERENCES [dbo].[Voucher] ([VoucherId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([OrderStatusId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([VoucherId])
REFERENCES [dbo].[Voucher] ([VoucherId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([StyleId])
REFERENCES [dbo].[Style] ([StyleId])
GO
ALTER TABLE [dbo].[ProductDiscount]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[ProductDiscount]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductRepository]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductRepository]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD FOREIGN KEY([RateId])
REFERENCES [dbo].[Rate] ([RateId])
GO
USE [master]
GO
ALTER DATABASE [DuAnTotNghiep] SET  READ_WRITE 
GO
