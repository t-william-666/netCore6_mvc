USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 2022/4/30 14:05:08 ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'D:\SQL2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'D:\SQL2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB', N'ON'
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 2022/4/30 14:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductType] [int] NOT NULL,
	[ProductTypeName] [nvarchar](50) NULL,
	[ProductDesc] [nvarchar](50) NULL,
	[TypeName] [nvarchar](20) NULL,
 CONSTRAINT [PK_ShopTypes] PRIMARY KEY CLUSTERED 
(
	[ProductType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1001,1) NOT NULL,
	[ShopID] [nvarchar](50) NOT NULL,
	[ShopName] [nvarchar](200) NULL,
	[ShopIntroduce] [nvarchar](500) NULL,
	[ShopAddress] [nvarchar](500) NULL,
	[ShopMobile] [nvarchar](11) NULL,
	[ShopBoss] [nvarchar](50) NULL,
	[ShopStars] [nvarchar](10) NULL,
	[ShopType] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Shop_1] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ImgID] [int] IDENTITY(1001,1) NOT NULL,
	[ShopID] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL,
	[ImgType] [nvarchar](20) NULL,
	[ImgName] [nvarchar](50) NULL,
	[ImgPath] [nvarchar](1000) NULL,
	[ImgSize] [nvarchar](50) NULL,
	[ImgOrderby] [int] NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1001,1) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[ShopID] [nvarchar](50) NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductType] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[ActivityPrice] [decimal](18, 2) NULL,
	[discount] [decimal](5, 2) NULL,
	[discountType] [int] NULL,
	[ProductNum] [int] NULL,
	[ProductIntroduce] [nvarchar](500) NULL,
	[ProductStarNum] [nvarchar](20) NULL,
	[ProductState] [int] NULL,
	[ShopStock] [int] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStarRating]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStarRating](
	[StarNum] [nvarchar](20) NOT NULL,
	[StarDesc] [nvarchar](50) NULL,
	[Star1] [nvarchar](200) NULL,
	[Star2] [nvarchar](200) NULL,
	[Star3] [nvarchar](200) NULL,
	[Star4] [nvarchar](200) NULL,
	[Star5] [nvarchar](200) NULL,
	[StarType] [int] NULL,
	[StarOrder] [int] NULL,
 CONSTRAINT [PK_ProductStarRating] PRIMARY KEY CLUSTERED 
(
	[StarNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SuperProductView]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SuperProductView]
AS
SELECT  dbo.Product.ID, dbo.Product.ProductID, dbo.Product.ShopID, dbo.Product.ProductName, dbo.Product.ProductType, 
                   dbo.Product.Price, dbo.Product.ActivityPrice, dbo.Product.discount, dbo.Product.discountType, dbo.Product.ProductNum, 
                   dbo.Product.ProductIntroduce, dbo.Product.ProductStarNum, dbo.Product.ProductState, dbo.Product.ShopStock, 
                   dbo.Product.AddDate, dbo.ProductTypes.ProductTypeName, dbo.ProductTypes.ProductDesc, 
                   dbo.ProductTypes.TypeName,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 1)) AS ImgPath1,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 2)) AS ImgPath2, 
                   dbo.ProductStarRating.Star1, dbo.ProductStarRating.Star2, dbo.ProductStarRating.Star3, dbo.ProductStarRating.Star4, 
                   dbo.ProductStarRating.Star5, dbo.Shop.ShopName, dbo.Shop.ShopIntroduce, dbo.Shop.ShopAddress, 
                   dbo.Shop.ShopMobile, dbo.Shop.ShopBoss, dbo.Shop.ShopStars, dbo.Shop.ShopType, dbo.Shop.AddDate AS Expr1
FROM      dbo.Product INNER JOIN
                   dbo.ProductTypes ON dbo.Product.ProductType = dbo.ProductTypes.ProductType INNER JOIN
                   dbo.ProductStarRating ON dbo.Product.ProductStarNum = dbo.ProductStarRating.StarNum INNER JOIN
                   dbo.Shop ON dbo.Product.ShopID = dbo.Shop.ShopID
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](13) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](11) NULL,
	[Province] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Town] [nvarchar](50) NULL,
	[DetailAddress] [nvarchar](100) NULL,
	[Other] [nvarchar](200) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BannerImage]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerImage](
	[BannerID] [int] IDENTITY(1001,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Path] [nvarchar](1000) NULL,
	[Paths] [nvarchar](1000) NULL,
	[Title] [nvarchar](150) NULL,
	[TitleDesc] [nvarchar](300) NULL,
	[TitleDescs] [nvarchar](500) NULL,
	[Text_1] [nvarchar](500) NULL,
	[Text_2] [nvarchar](500) NULL,
	[Text_3] [nvarchar](500) NULL,
	[State] [int] NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BannerImage] PRIMARY KEY CLUSTERED 
(
	[BannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStars]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStars](
	[StarID] [int] IDENTITY(1,101) NOT NULL,
	[StarType] [int] NULL,
	[StarTxt] [nvarchar](20) NULL,
	[StarDesc] [nvarchar](200) NULL,
	[StarNum] [nvarchar](50) NULL,
	[StarOrderby] [int] NULL,
	[State] [int] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_ProductStars] PRIMARY KEY CLUSTERED 
(
	[StarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCar]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCar](
	[CarID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[ProductNum] [int] NOT NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[CarType] [int] NOT NULL,
 CONSTRAINT [PK_ShopCar] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCollect]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCollect](
	[CollectID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ShopCollect] PRIMARY KEY CLUSTERED 
(
	[CollectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopComment]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopComment](
	[CommentID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ShopID] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[CommentTxt] [text] NOT NULL,
	[CommentStars] [nvarchar](10) NOT NULL,
	[CommentType] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ShopComment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCommentLike]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCommentLike](
	[LikeID] [int] NOT NULL,
	[CommentID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopImage]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopImage](
	[ImgID] [int] IDENTITY(1001,1) NOT NULL,
	[ShopID] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[ImgType] [nvarchar](20) NULL,
	[ImgName] [nvarchar](50) NULL,
	[ImgPath] [nvarchar](1000) NULL,
	[ImgSize] [nvarchar](50) NULL,
	[ImgOrderby] [int] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_ShopImage] PRIMARY KEY CLUSTERED 
(
	[ImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopOrder]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopOrder](
	[OrderID] [int] IDENTITY(1001,1) NOT NULL,
	[OrderNo] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[OrderName] [nvarchar](50) NULL,
	[AmountPrice] [decimal](18, 2) NULL,
	[DiscountPrice] [decimal](18, 2) NULL,
	[SumPrice] [decimal](18, 2) NULL,
	[OrderNum] [int] NULL,
	[OrderType] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_ShopOrder] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopOrderDetail]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopOrderDetail](
	[DetailID] [int] IDENTITY(1001,1) NOT NULL,
	[OrderNo] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ShopID] [nvarchar](50) NOT NULL,
	[ShopPrice] [decimal](18, 2) NOT NULL,
	[DiscountPrice] [decimal](18, 2) NULL,
	[ShopNum] [int] NULL,
 CONSTRAINT [PK_ShopOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleList]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleList](
	[TitleID] [int] IDENTITY(1001,1) NOT NULL,
	[about] [nvarchar](50) NULL,
	[TitleDesc] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[TitleUrl] [nvarchar](500) NULL,
	[TitleOrderby] [int] NOT NULL,
	[State] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TitleList] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLoginLog]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLoginLog](
	[LogID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[LoginIP] [nvarchar](100) NULL,
	[LoginState] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_UserLoginLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2022/4/30 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Sex] [nchar](4) NOT NULL,
	[Age] [int] NULL,
	[Introduce] [nvarchar](200) NULL,
	[Address] [nvarchar](50) NULL,
	[Birthday] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UserImage] [nvarchar](max) NULL,
	[UserType] [int] NOT NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220415035847_Userschange', N'6.0.4')
GO
SET IDENTITY_INSERT [dbo].[BannerImage] ON 

INSERT [dbo].[BannerImage] ([BannerID], [Type], [Path], [Paths], [Title], [TitleDesc], [TitleDescs], [Text_1], [Text_2], [Text_3], [State], [AddDate]) VALUES (1001, N'1', N'/images/other/1.jpg', NULL, N'轮播图片标题', N'轮播图片内容', NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-21T10:30:13.320' AS DateTime))
INSERT [dbo].[BannerImage] ([BannerID], [Type], [Path], [Paths], [Title], [TitleDesc], [TitleDescs], [Text_1], [Text_2], [Text_3], [State], [AddDate]) VALUES (1002, N'1', N'/images/other/2.jpg', NULL, N'轮播图片标题2', N'轮播图片内容2', NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-21T10:30:19.870' AS DateTime))
INSERT [dbo].[BannerImage] ([BannerID], [Type], [Path], [Paths], [Title], [TitleDesc], [TitleDescs], [Text_1], [Text_2], [Text_3], [State], [AddDate]) VALUES (1003, N'1', N'/images/other/3.jpg', NULL, N'轮播图片标题3', N'333', NULL, NULL, NULL, NULL, 1, CAST(N'2022-04-21T10:30:21.250' AS DateTime))
SET IDENTITY_INSERT [dbo].[BannerImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1001, N'wx-10001', N'SD-2022042115', N'薯条', 101, CAST(9.90 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(0.80 AS Decimal(5, 2)), 0, 100, N'美味薯条，你值得拥有。', N'4.5', 1, 1000, NULL)
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1002, N'wx-10002', N'SD-2022042115', N'辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。', 101, CAST(10.90 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.80 AS Decimal(5, 2)), 1, 100, N'美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。', N'5', 1, 1000, NULL)
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1003, N'wx-10003', N'SD-2022042115', N'试试哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇', 101, CAST(19.90 AS Decimal(18, 2)), CAST(19.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'方式发送给然后优酷一份节能环保的v', N'4', 1, 1000, CAST(N'2022-04-27T14:02:36.500' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1004, N'wx-10004', N'SD-2022042115', N'酷酷酷酷酷酷酷酷酷酷酷酷', 101, CAST(139.90 AS Decimal(18, 2)), CAST(139.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'空间和广泛的三维人体与脚后跟范德萨', N'4', 1, 1000, CAST(N'2022-04-27T14:02:40.700' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1005, N'wx-10005', N'SD-2022042115', N'柔柔弱弱也一样', 101, CAST(129.90 AS Decimal(18, 2)), CAST(129.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'的道德观广告经济全球啊啊', N'3.5', 1, 1000, CAST(N'2022-04-27T14:02:44.770' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1006, N'wx-10006', N'SD-2022042115', N'全球企业应用怕怕怕怕和皇后娘娘', 101, CAST(159.90 AS Decimal(18, 2)), CAST(159.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'水水水水顶顶顶烦烦烦哥哥回家看了', N'5', 1, 1000, CAST(N'2022-04-27T14:02:49.803' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1007, N'wx-10007', N'SD-2022042115', N'政治制度的日日日涛涛', 101, CAST(199.90 AS Decimal(18, 2)), CAST(199.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'嘻嘻嘻错错错不不不你你你你你你', N'3', 1, 1000, CAST(N'2022-04-27T14:02:53.853' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1008, N'wx-10008', N'SD-2022042115', N'事实上踩踩吃吃喝喝', 101, CAST(19.90 AS Decimal(18, 2)), CAST(19.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'沾沾自喜喜喜成都色网提供', N'4', 1, 1000, CAST(N'2022-04-27T14:02:56.803' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1009, N'wx-10009', N'SD-2022042115', N'得到的哈哈哈哈也一样', 101, CAST(39.90 AS Decimal(18, 2)), CAST(39.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'神神叨叨的太太体育用品品牌', N'4.5', 1, 1000, CAST(N'2022-04-27T14:03:01.657' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1010, N'wx-10010', N'SD-2022042115', N'点点滴滴八八八八', 101, CAST(29.90 AS Decimal(18, 2)), CAST(29.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'亲切慰问慰问厄尔特意跑来看过', N'2.5', 1, 1000, CAST(N'2022-04-27T14:03:21.310' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1011, N'wx-10011', N'SD-2022042115', N'水水水水水水水水', 101, CAST(49.90 AS Decimal(18, 2)), CAST(49.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'是围绕太阳评论家和房东实行差别那么', N'2', 1, 1000, CAST(N'2022-04-27T14:03:26.453' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1012, N'wx-10012', N'SD-2022042115', N'反反复复烦烦烦反反复复烦烦烦', 101, CAST(59.90 AS Decimal(18, 2)), CAST(59.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'之前我是的人非常不那么饥渴了', N'1', 1, 1000, CAST(N'2022-04-27T14:03:31.007' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ShopStock], [AddDate]) VALUES (1013, N'wx-10013', N'SD-2022042115', N'兢兢业业也天天天天', 101, CAST(69.90 AS Decimal(18, 2)), CAST(69.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'按时的发人体一会进口快件', N'0', 1, 1000, CAST(N'2022-04-27T14:03:37.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1001, N'SD-2022042115', N'wx-10001', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1002, N'SD-2022042115', N'wx-10001', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1003, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1004, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1005, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1006, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1007, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1008, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1009, N'SD-2022042115', N'wx-10002', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1010, N'SD-2022042115', N'wx-10002', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1011, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1012, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1013, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1014, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1015, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1016, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1017, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T15:14:08.737' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1018, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T15:14:34.233' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1019, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 9, CAST(N'2022-04-25T15:16:36.380' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1020, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 10, CAST(N'2022-04-25T15:17:59.683' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1021, N'SD-2022042115', N'wx-10003', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1022, N'SD-2022042115', N'wx-10003', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1023, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1024, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1025, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1026, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1027, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1028, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1029, N'SD-2022042115', N'wx-10005', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1030, N'SD-2022042115', N'wx-10005', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1031, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1032, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1033, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1034, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1035, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1036, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1037, N'SD-2022042115', N'wx-10004', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1038, N'SD-2022042115', N'wx-10004', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1039, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1040, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1041, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1042, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1043, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1044, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1045, N'SD-2022042115', N'wx-10006', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1046, N'SD-2022042115', N'wx-10006', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1047, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1048, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1049, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1050, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1051, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1052, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1053, N'SD-2022042115', N'wx-10007', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1054, N'SD-2022042115', N'wx-10007', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1055, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1056, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1057, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1058, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1059, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1060, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1061, N'SD-2022042115', N'wx-10008', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1062, N'SD-2022042115', N'wx-10008', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1063, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1064, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1065, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1066, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1067, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1068, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1069, N'SD-2022042115', N'wx-10009', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1070, N'SD-2022042115', N'wx-10009', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1071, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1072, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1073, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1074, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1075, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1076, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1077, N'SD-2022042115', N'wx-10010', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1078, N'SD-2022042115', N'wx-10010', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1079, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1080, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1081, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1082, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1083, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1084, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1085, N'SD-2022042115', N'wx-10011', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1086, N'SD-2022042115', N'wx-10011', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1087, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1088, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1089, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1090, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1091, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1092, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1093, N'SD-2022042115', N'wx-10012', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1094, N'SD-2022042115', N'wx-10012', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1095, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1096, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1097, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1098, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1099, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1100, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1101, N'SD-2022042115', N'wx-10013', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1102, N'SD-2022042115', N'wx-10013', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1103, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1104, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1105, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1106, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1107, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1108, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1109, N'SD-2022042115', N'wx-10014', N'1', N'主图', NULL, NULL, 1, CAST(N'2022-04-27T15:09:59.770' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1110, N'SD-2022042115', N'wx-10014', N'1', N'副主图', NULL, NULL, 2, CAST(N'2022-04-27T15:10:19.887' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1111, N'SD-2022042115', N'wx-10014', N'2', N'副图', NULL, NULL, 3, CAST(N'2022-04-27T15:11:46.760' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'0', N'星级评分', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 1)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'0.5', N'星级评分', N'fa fa-star-half-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 2)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'1', N'星级评分', N'fa fa-star', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 3)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'1.5', N'星级评分', N'fa fa-star', N'fa fa-star-half-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 4)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'2', N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 5)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'2.5', N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star-half-o', N'fa fa-star-o', N'fa fa-star-o', 1, 6)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'3', N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star-o', N'<i class="fa fa-star-o"></i>', 1, 7)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'3.5', N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star-half-o', N'fa fa-star-o', 1, 8)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'4', N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star-o', 1, 9)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'4.5', N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star-half-o', 1, 10)
INSERT [dbo].[ProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (N'5', N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star', 1, 11)
GO
SET IDENTITY_INSERT [dbo].[ProductStars] ON 

INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (101, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'0', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (102, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'0', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (103, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'0', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (104, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'0', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (105, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'0', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (106, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', N'0.5', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (107, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'0.5', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (108, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'0.5', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (109, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'0.5', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (110, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'0.5', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (111, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'1', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (112, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'1', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (113, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'1', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (114, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'1', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (115, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'1', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (116, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'1.5', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (117, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', N'1.5', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (118, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'1.5', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (119, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'1.5', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (120, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'1.5', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (121, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'2', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (122, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'2', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (123, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'2', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (124, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'2', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (125, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'2', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (126, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'2.5', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (127, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'2.5', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (128, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', N'2.5', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (129, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'2.5', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (130, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'2.5', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (131, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'3', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (132, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'3', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (133, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'3', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (134, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'3', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (135, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'3', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (136, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'3.5', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (137, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'3.5', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (138, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'3.5', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (139, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', N'3.5', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (140, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'3.5', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (141, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'4', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (142, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'4', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (143, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'4', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (144, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'4', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (145, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', N'4', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (146, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'4.5', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (147, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'4.5', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (148, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'4.5', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (149, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'4.5', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (150, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', N'4.5', 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (151, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'5', 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (152, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'5', 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (153, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'5', 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (154, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'5', 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (155, NULL, N'星级评分', N'<i class="fa fa-star"></i>', N'5', 5, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductStars] OFF
GO
INSERT [dbo].[ProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (101, N'食品类', NULL, N'SP')
INSERT [dbo].[ProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (102, N'服装类', NULL, N'FZ')
INSERT [dbo].[ProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (103, N'洗护类', NULL, N'XH')
INSERT [dbo].[ProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (104, N'手办类', NULL, N'SB')
INSERT [dbo].[ProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (105, N'书画类', NULL, N'SH')
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([ID], [ShopID], [ShopName], [ShopIntroduce], [ShopAddress], [ShopMobile], [ShopBoss], [ShopStars], [ShopType], [AddDate]) VALUES (1001, N'SD-2022042115', N'万物商店', N'应有尽有，无所不有，在这里没有你找不到的东西，只有你想不到！', N'珠海市香洲区', N'18377412687', N'夜老板', N'4.5', 1, CAST(N'2022-04-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopImage] ON 

INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1001, N'SD-2022042115', N'wx-10001', NULL, N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1002, N'SD-2022042115', N'wx-10001', NULL, N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1003, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1004, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 2, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1005, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1006, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1007, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1008, N'SD-2022042115', N'wx-10002', NULL, N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1009, N'SD-2022042115', N'wx-10002', NULL, N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1010, N'SD-2022042115', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1011, N'SD-2022042115', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 2, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1012, N'SD-2022042115', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1013, N'SD-2022042115', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, NULL)
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1014, N'SD-2022042115', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, NULL)
SET IDENTITY_INSERT [dbo].[ShopImage] OFF
GO
SET IDENTITY_INSERT [dbo].[TitleList] ON 

INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1003, N'导航栏', N'手办周边', N'手办', NULL, 1, 1, CAST(N'2022-04-20T17:08:08.737' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1004, N'导航栏', N'图书漫画', N'书画', NULL, 2, 1, CAST(N'2022-04-20T17:08:21.570' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1005, N'导航栏', N'服装服饰', N'服饰', NULL, 3, 1, CAST(N'2022-04-20T17:08:37.387' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1006, N'导航栏', N'洗护用品', N'洗护', NULL, 4, 1, CAST(N'2022-04-20T17:08:49.703' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1007, N'导航栏', N'优选零食', N'零食', NULL, 5, 1, CAST(N'2022-04-20T17:09:03.640' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1008, N'导航栏', N'活动专区', N'活动', NULL, 6, 1, CAST(N'2022-04-20T17:09:15.153' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1009, N'user-menu', N'个人信息', N'fa fa-user', NULL, 1, 1, CAST(N'2022-04-27T13:43:42.800' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1010, N'user-menu', N'我的订单', N'fa fa-file-text', NULL, 2, 1, CAST(N'2022-04-27T13:44:22.927' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1011, N'user-menu', N'物流查询', N'fa-bus', NULL, 3, 1, CAST(N'2022-04-27T13:44:41.620' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1012, N'user-menu', N'收货地址', N'fa-home', NULL, 4, 1, CAST(N'2022-04-27T13:44:22.927' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1013, N'user-menu', N'评价中心', N'fa-comment', NULL, 5, 1, CAST(N'2022-04-27T13:44:41.620' AS DateTime))
SET IDENTITY_INSERT [dbo].[TitleList] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1001, N'13577882233', N'111111', N'呵呵呵', N'1   ', 131, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1002, N'13577882234', N'123456', N'哈哈哈', N'2   ', 131, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1003, N'13577882235', N'123456', N'好好好', N'1   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1004, N'13577882236', N'123456', N'嘿嘿嘿', N'2   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1005, N'13577882237', N'123456', N'吼吼吼', N'1   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1006, N'13577882238', N'123456', N'呱呱呱', N'2   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1007, N'13577882239', N'123456', N'烦烦烦', N'1   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1016, N'123456', N'123456', N'新用户', N'3   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1017, N'1234561', N'123456', N'新用户', N'3   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1018, N'12345611', N'123456', N'新用户', N'3   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1019, N'false', N'123', N'新用户', N'3   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Password], [UserName], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserImage], [UserType], [AddDate]) VALUES (1020, N'123', N'123', N'新用户', N'3   ', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [ix_com_Users]    Script Date: 2022/4/30 14:05:09 ******/
CREATE NONCLUSTERED INDEX [ix_com_Users] ON [dbo].[Users]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BannerImage] ADD  CONSTRAINT [DF_BannerImage_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_discountType]  DEFAULT ((0)) FOR [discountType]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ProductNum]  DEFAULT ((0)) FOR [ProductNum]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[ProductImage] ADD  CONSTRAINT [DF_ProductImage_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_ShopType]  DEFAULT ((1)) FOR [ShopType]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[ShopCar] ADD  CONSTRAINT [DF_ShopCar_ShopNum]  DEFAULT ((1)) FOR [ProductNum]
GO
ALTER TABLE [dbo].[ShopCar] ADD  CONSTRAINT [DF_ShopCar_CarType]  DEFAULT ((1)) FOR [CarType]
GO
ALTER TABLE [dbo].[ShopComment] ADD  CONSTRAINT [DF_ShopComment_CommentType]  DEFAULT ((1)) FOR [CommentType]
GO
ALTER TABLE [dbo].[ShopOrder] ADD  CONSTRAINT [DF_ShopOrder_OrderType]  DEFAULT ((1)) FOR [OrderType]
GO
ALTER TABLE [dbo].[TitleList] ADD  CONSTRAINT [DF_TitleList_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[UserLoginLog] ADD  CONSTRAINT [DF_UserLoginLog_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserType]  DEFAULT ((1)) FOR [UserType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductStarRating] FOREIGN KEY([ProductStarNum])
REFERENCES [dbo].[ProductStarRating] ([StarNum])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductStarRating]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Product] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Shop_Product]
GO
ALTER TABLE [dbo].[ShopImage]  WITH CHECK ADD  CONSTRAINT [FK_ShopImage_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ShopImage] CHECK CONSTRAINT [FK_ShopImage_Product]
GO
ALTER TABLE [dbo].[ShopOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShopOrderDetail_ShopOrder] FOREIGN KEY([OrderNo])
REFERENCES [dbo].[ShopOrder] ([OrderNo])
GO
ALTER TABLE [dbo].[ShopOrderDetail] CHECK CONSTRAINT [FK_ShopOrderDetail_ShopOrder]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -360
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Product"
            Begin Extent = 
               Top = 13
               Left = 48
               Bottom = 170
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "ProductTypes"
            Begin Extent = 
               Top = 9
               Left = 387
               Bottom = 172
               Right = 619
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductStarRating"
            Begin Extent = 
               Top = 199
               Left = 423
               Bottom = 362
               Right = 590
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Shop"
            Begin Extent = 
               Top = 206
               Left = 50
               Bottom = 369
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 13032
         Alias = 1704
         Table = 1848
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SuperProductView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SuperProductView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SuperProductView'
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
