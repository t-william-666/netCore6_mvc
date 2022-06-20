USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 2022/6/18 0:20:27 ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Users]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[Account] [nvarchar](50) NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](50) NULL,
	[Sex] [nchar](4) NOT NULL,
	[Age] [int] NULL,
	[Introduce] [nvarchar](200) NULL,
	[Address] [nvarchar](50) NULL,
	[Birthday] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UserType] [int] NOT NULL,
	[UserState] [int] NOT NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopProductStarRating]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopProductStarRating](
	[StarNum] [decimal](5, 2) NOT NULL,
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
/****** Object:  Table [dbo].[ProductComment]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComment](
	[CommentID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[ShopID] [nvarchar](50) NULL,
	[ProductID] [nvarchar](100) NOT NULL,
	[CommentTxt] [text] NOT NULL,
	[CommentStarNum] [decimal](5, 2) NOT NULL,
	[CommentType] [int] NOT NULL,
	[CommentState] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ShopComment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCommentImage]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCommentImage](
	[ComImgID] [int] IDENTITY(1001,1) NOT NULL,
	[CommentID] [int] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ComImgPath] [nvarchar](1000) NOT NULL,
	[ComImgSize] [nvarchar](50) NOT NULL,
	[ComOrderby] [int] NOT NULL,
	[ComState] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductCommentImage] PRIMARY KEY CLUSTERED 
(
	[ComImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCommentLike]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCommentLike](
	[LikeID] [int] NOT NULL,
	[CommentID] [nvarchar](50) NULL,
	[UserID] [nvarchar](100) NULL,
	[AddDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImageList]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImageList](
	[ID] [int] IDENTITY(1001,1) NOT NULL,
	[ImgID] [nvarchar](100) NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[UserImagePath] [nvarchar](1000) NOT NULL,
	[ImgSize] [nvarchar](200) NULL,
	[ImgWidth] [int] NULL,
	[ImgHeight] [int] NULL,
	[ImgState] [int] NOT NULL,
	[ImgType] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserImage] PRIMARY KEY CLUSTERED 
(
	[ImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SupUserCommentView]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SupUserCommentView]
AS
SELECT  dbo.Users.UserID, dbo.Users.Account, dbo.Users.UserName, dbo.Users.Sex, dbo.Users.Age, dbo.Users.Introduce, 
                   dbo.UserImageList.ImgID, dbo.UserImageList.UserImagePath, dbo.UserImageList.ImgSize, dbo.UserImageList.ImgWidth, 
                   dbo.UserImageList.ImgHeight, dbo.UserImageList.ImgState, dbo.UserImageList.ImgType, 
                   dbo.ProductComment.CommentID, dbo.ProductComment.ShopID, dbo.ProductComment.ProductID, 
                   dbo.ProductComment.CommentTxt, dbo.ProductComment.CommentStarNum, dbo.ProductComment.CommentType, 
                   dbo.ProductComment.CommentState, dbo.ProductComment.AddDate, ShopProductStarRating_1.StarNum, 
                   ShopProductStarRating_1.StarDesc, ShopProductStarRating_1.Star1, ShopProductStarRating_1.Star2, 
                   ShopProductStarRating_1.Star3, ShopProductStarRating_1.Star4, ShopProductStarRating_1.Star5, 
                   ShopProductStarRating_1.StarType, ShopProductStarRating_1.StarOrder,
                       (SELECT  COUNT(*) AS Expr1
                        FROM       dbo.ProductCommentLike
                        WHERE    (CommentID = dbo.ProductComment.CommentID)) AS CommentLike, dbo.ProductCommentImage.ComImgID, 
                   dbo.ProductCommentImage.ComImgPath, dbo.ProductCommentImage.ComImgSize, 
                   dbo.ProductCommentImage.ComOrderby, dbo.ProductCommentImage.ComState
FROM      dbo.Users INNER JOIN
                   dbo.UserImageList ON dbo.Users.UserID = dbo.UserImageList.UserID INNER JOIN
                   dbo.ProductComment ON dbo.Users.UserID = dbo.ProductComment.UserID INNER JOIN
                   dbo.ShopProductStarRating AS ShopProductStarRating_1 ON 
                   dbo.ProductComment.CommentStarNum = ShopProductStarRating_1.StarNum INNER JOIN
                   dbo.ProductCommentImage ON dbo.ProductComment.CommentID = dbo.ProductCommentImage.ComImgID
GO
/****** Object:  Table [dbo].[ProductCart]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCart](
	[CartID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[ProductCartNum] [int] NOT NULL,
	[ProductPrice] [decimal](18, 2) NULL,
	[CartType] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ShopCar] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1001,1) NOT NULL,
	[ProductID] [nvarchar](100) NOT NULL,
	[ShopID] [nvarchar](100) NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductType] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[ActivityPrice] [decimal](18, 2) NULL,
	[discount] [decimal](5, 2) NULL,
	[discountType] [int] NULL,
	[ProductNum] [int] NULL,
	[ProductIntroduce] [nvarchar](500) NULL,
	[ProductStarNum] [decimal](5, 2) NULL,
	[ProductState] [int] NULL,
	[ProductStock] [int] NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ImgID] [int] IDENTITY(1001,1) NOT NULL,
	[ShopID] [nvarchar](100) NULL,
	[ProductID] [nvarchar](100) NULL,
	[ImgType] [nvarchar](20) NULL,
	[ImgName] [nvarchar](50) NULL,
	[ImgPath] [nvarchar](1000) NULL,
	[ImgSize] [nvarchar](50) NULL,
	[ImgOrderby] [int] NULL,
	[ImgState] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SupUserProductCartView]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SupUserProductCartView]
AS
SELECT  dbo.Users.UserID, dbo.ProductCart.CartID, dbo.ProductCart.ProductCartNum, dbo.ProductCart.ProductID, 
                   dbo.ProductCart.ProductPrice, dbo.ProductCart.CartType, dbo.Product.ShopID, dbo.Product.ProductName, 
                   dbo.Product.ProductType, dbo.Product.Price, dbo.Product.ActivityPrice, dbo.Product.discount, dbo.Product.discountType, 
                   dbo.Product.ProductNum, dbo.Product.ProductIntroduce, dbo.Product.ProductStarNum, dbo.Product.ProductState, 
                   dbo.Product.ProductStock, dbo.Product.AddDate,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 1)) AS ImgPath1,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 2)) AS ImgPath2
FROM      dbo.Users INNER JOIN
                   dbo.ProductCart ON dbo.Users.UserID = dbo.ProductCart.UserID INNER JOIN
                   dbo.Product ON dbo.ProductCart.ProductID = dbo.Product.ProductID
GO
/****** Object:  Table [dbo].[ShopProductTypes]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopProductTypes](
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
/****** Object:  Table [dbo].[Shop]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1001,1) NOT NULL,
	[ShopID] [nvarchar](100) NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[ShopName] [nvarchar](200) NOT NULL,
	[ShopIntroduce] [nvarchar](500) NOT NULL,
	[ShopAddress] [nvarchar](500) NOT NULL,
	[ShopMobile] [nvarchar](11) NOT NULL,
	[ShopBoss] [nvarchar](50) NOT NULL,
	[ShopOpenTime] [nvarchar](200) NULL,
	[ShopStarNum] [decimal](5, 2) NOT NULL,
	[ShopType] [int] NULL,
	[ShopState] [int] NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Shop_1] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SuperProductView]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SuperProductView]
AS
SELECT  dbo.Product.ID, dbo.Product.ProductID, dbo.Product.ShopID, dbo.Product.ProductName, dbo.Product.ProductType, 
                   dbo.Product.Price, dbo.Product.ActivityPrice, dbo.Product.discount, dbo.Product.discountType, dbo.Product.ProductNum, 
                   dbo.Product.ProductIntroduce, dbo.Product.ProductStarNum, dbo.Product.ProductState, dbo.Product.ProductStock, 
                   dbo.Product.AddDate, dbo.ShopProductTypes.ProductTypeName, dbo.ShopProductTypes.ProductDesc, 
                   dbo.ShopProductTypes.TypeName, dbo.ShopProductStarRating.StarNum, dbo.ShopProductStarRating.StarDesc, 
                   dbo.ShopProductStarRating.Star1, dbo.ShopProductStarRating.Star2, dbo.ShopProductStarRating.Star3, 
                   dbo.ShopProductStarRating.Star4, dbo.ShopProductStarRating.Star5, dbo.ShopProductStarRating.StarType, 
                   dbo.ShopProductStarRating.StarOrder,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 1)) AS ImgPath1,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 2)) AS ImgPath2, 
                   dbo.Shop.ShopName, dbo.Shop.ShopIntroduce, dbo.Shop.ShopAddress, dbo.Shop.ShopMobile, dbo.Shop.ShopBoss, 
                   dbo.Shop.ShopOpenTime, dbo.Shop.ShopStarNum, dbo.Shop.ShopType, dbo.Shop.ShopState
FROM      dbo.Product INNER JOIN
                   dbo.ShopProductStarRating ON dbo.Product.ProductStarNum = dbo.ShopProductStarRating.StarNum INNER JOIN
                   dbo.ShopProductTypes ON dbo.Product.ProductType = dbo.ShopProductTypes.ProductType INNER JOIN
                   dbo.Shop ON dbo.Product.ShopID = dbo.Shop.ShopID
GO
/****** Object:  Table [dbo].[ShopImage]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopImage](
	[ImgID] [int] IDENTITY(1001,1) NOT NULL,
	[ShopID] [nvarchar](100) NULL,
	[ProductID] [nvarchar](100) NULL,
	[UserID] [nvarchar](50) NULL,
	[ImgType] [nvarchar](20) NULL,
	[ImgName] [nvarchar](50) NULL,
	[ImgPath] [nvarchar](1000) NULL,
	[ImgSize] [nvarchar](50) NULL,
	[ImgOrderby] [int] NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ShopImage] PRIMARY KEY CLUSTERED 
(
	[ImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SupShopdetailView]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SupShopdetailView]
AS
SELECT  dbo.Shop.ID, dbo.Shop.ShopID, dbo.Shop.ShopName, dbo.Shop.ShopIntroduce, dbo.Shop.ShopAddress, 
                   dbo.Shop.ShopMobile, dbo.Shop.ShopBoss, dbo.Shop.ShopOpenTime, dbo.Shop.ShopStarNum, dbo.Shop.ShopType, 
                   dbo.Shop.ShopState, dbo.Shop.AddDate, dbo.ShopImage.ImgID, dbo.ShopImage.ImgType, dbo.ShopImage.ImgName, 
                   dbo.ShopImage.ImgPath, dbo.ShopImage.ImgSize, dbo.ShopImage.ImgOrderby, dbo.ShopImage.AddDate AS ImgAddDate, 
                   dbo.ShopProductStarRating.StarNum, dbo.ShopProductStarRating.StarDesc, dbo.ShopProductStarRating.Star1, 
                   dbo.ShopProductStarRating.Star2, dbo.ShopProductStarRating.Star3, dbo.ShopProductStarRating.Star4, 
                   dbo.ShopProductStarRating.Star5, dbo.ShopProductStarRating.StarType, dbo.ShopProductStarRating.StarOrder, 
                   dbo.ShopProductTypes.ProductTypeName, dbo.ShopProductTypes.ProductDesc, 
                   dbo.ShopProductTypes.TypeName
FROM      dbo.Shop INNER JOIN
                   dbo.ShopImage ON dbo.Shop.ShopID = dbo.ShopImage.ShopID INNER JOIN
                   dbo.ShopProductStarRating ON dbo.Shop.ShopStarNum = dbo.ShopProductStarRating.StarNum INNER JOIN
                   dbo.ShopProductTypes ON dbo.Shop.ShopType = dbo.ShopProductTypes.ProductType
GO
/****** Object:  Table [dbo].[ProductOrder]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrder](
	[OrderID] [int] IDENTITY(1001,1) NOT NULL,
	[OrderNo] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[OrderName] [nvarchar](50) NULL,
	[OrderAmountPrice] [decimal](18, 2) NULL,
	[OrderDiscountPrice] [decimal](18, 2) NULL,
	[OrderSumPrice] [decimal](18, 2) NULL,
	[OrderNum] [int] NULL,
	[OrderType] [int] NOT NULL,
	[OrderState] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ShopOrder] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOrderDetail]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrderDetail](
	[DetailID] [int] IDENTITY(1001,1) NOT NULL,
	[OrderNo] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ShopID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](100) NOT NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[DiscountPrice] [decimal](18, 2) NULL,
	[OrderProductNum] [int] NULL,
	[OrderDetailState] [int] NOT NULL,
 CONSTRAINT [PK_ShopOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SupUserOrderdetailView]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SupUserOrderdetailView]
AS
SELECT  dbo.Users.UserID, dbo.ProductOrder.OrderID, dbo.ProductOrder.OrderNo, dbo.ProductOrder.UserID AS Expr1, 
                   dbo.ProductOrder.OrderName, dbo.ProductOrder.OrderAmountPrice, dbo.ProductOrder.OrderDiscountPrice, 
                   dbo.ProductOrder.OrderSumPrice, dbo.ProductOrder.OrderNum, dbo.ProductOrder.OrderType, 
                   dbo.ProductOrder.OrderState, dbo.ProductOrder.OrderDate, dbo.ProductOrderDetail.DetailID, 
                   dbo.ProductOrderDetail.ProductPrice, dbo.ProductOrderDetail.DiscountPrice, dbo.ProductOrderDetail.OrderProductNum, 
                   dbo.ProductOrderDetail.OrderDetailState, dbo.Product.ProductID, dbo.Product.ShopID, dbo.Product.ProductName, 
                   dbo.Product.ProductType, dbo.Product.Price, dbo.Product.ActivityPrice, dbo.Product.discount, dbo.Product.discountType, 
                   dbo.Product.ProductNum, dbo.Product.ProductIntroduce, dbo.Product.ProductStarNum, dbo.Product.ProductState, 
                   dbo.Product.ProductStock, dbo.Product.AddDate, dbo.ShopProductTypes.ProductTypeName, 
                   dbo.ShopProductTypes.ProductDesc, dbo.ShopProductTypes.TypeName,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 1)) AS ImgPath1,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 2)) AS ImgPath2
FROM      dbo.Users INNER JOIN
                   dbo.ProductOrder ON dbo.Users.UserID = dbo.ProductOrder.UserID INNER JOIN
                   dbo.ProductOrderDetail ON dbo.ProductOrder.OrderNo = dbo.ProductOrderDetail.OrderNo INNER JOIN
                   dbo.Product ON dbo.ProductOrderDetail.ProductID = dbo.Product.ProductID INNER JOIN
                   dbo.ShopProductTypes ON dbo.Product.ProductType = dbo.ShopProductTypes.ProductType
GO
/****** Object:  Table [dbo].[UserLike]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLike](
	[LikeID] [int] NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[ProductID] [nvarchar](100) NULL,
	[ShopID] [nvarchar](100) NULL,
	[LikeType] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SupUserLikeProductView]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SupUserLikeProductView]
AS
SELECT  dbo.Users.UserID, dbo.UserLike.LikeID, dbo.UserLike.ProductID, dbo.UserLike.ShopID, dbo.UserLike.LikeType, 
                   dbo.UserLike.AddDate, dbo.Product.ProductName, dbo.Product.ProductType, dbo.Product.Price, 
                   dbo.Product.ActivityPrice, dbo.Product.discount, dbo.Product.discountType, dbo.Product.ProductNum, 
                   dbo.Product.ProductIntroduce, dbo.Product.ProductStarNum, dbo.Product.ProductState, dbo.Product.ProductStock, 
                   dbo.ShopProductStarRating.StarNum, dbo.ShopProductStarRating.StarDesc, dbo.ShopProductStarRating.Star1, 
                   dbo.ShopProductStarRating.Star2, dbo.ShopProductStarRating.Star3, dbo.ShopProductStarRating.Star4, 
                   dbo.ShopProductStarRating.Star5, dbo.ShopProductStarRating.StarType, dbo.ShopProductStarRating.StarOrder, 
                   dbo.ShopProductTypes.ProductTypeName, dbo.ShopProductTypes.ProductDesc, dbo.ShopProductTypes.TypeName,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 1)) AS ImgPath1,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 2)) AS ImgPath2
FROM      dbo.Users INNER JOIN
                   dbo.UserLike ON dbo.Users.UserID = dbo.UserLike.UserID INNER JOIN
                   dbo.Product ON dbo.UserLike.ProductID = dbo.Product.ProductID INNER JOIN
                   dbo.ShopProductStarRating ON dbo.Product.ProductStarNum = dbo.ShopProductStarRating.StarNum INNER JOIN
                   dbo.ShopProductTypes ON dbo.Product.ProductType = dbo.ShopProductTypes.ProductType
GO
/****** Object:  View [dbo].[SupUserLikeShopView]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SupUserLikeShopView]
AS
SELECT  dbo.UserLike.UserID, dbo.UserLike.ShopID, dbo.UserLike.AddDate, dbo.Shop.ShopName, dbo.Shop.ShopIntroduce, 
                   dbo.Shop.ShopAddress, dbo.Shop.ShopMobile, dbo.Shop.ShopBoss, dbo.Shop.ShopOpenTime, dbo.Shop.ShopStarNum, 
                   dbo.Shop.ShopType, dbo.Shop.ShopState, dbo.ShopProductStarRating.StarNum, dbo.ShopProductStarRating.StarDesc, 
                   dbo.ShopProductStarRating.Star1, dbo.ShopProductStarRating.Star2, dbo.ShopProductStarRating.Star3, 
                   dbo.ShopProductStarRating.Star4, dbo.ShopProductStarRating.Star5, dbo.ShopProductStarRating.StarType, 
                   dbo.ShopProductStarRating.StarOrder, dbo.ShopProductTypes.ProductTypeName, dbo.ShopProductTypes.ProductDesc, 
                   dbo.ShopProductTypes.TypeName,
                       (SELECT  ImgPath
                        FROM       dbo.ShopImage AS g
                        WHERE    (ShopID = dbo.Shop.ShopID) AND (ImgType = 1) AND (ImgOrderby = 1)) AS ImgPath1,
                       (SELECT  ImgPath
                        FROM       dbo.ShopImage AS g
                        WHERE    (ShopID = dbo.Shop.ShopID) AND (ImgType = 1) AND (ImgOrderby = 2)) AS ImgPath2
FROM      dbo.UserLike INNER JOIN
                   dbo.Shop ON dbo.UserLike.ShopID = dbo.Shop.ShopID INNER JOIN
                   dbo.ShopProductStarRating ON dbo.Shop.ShopStarNum = dbo.ShopProductStarRating.StarNum INNER JOIN
                   dbo.ShopProductTypes ON dbo.Shop.ShopType = dbo.ShopProductTypes.ProductType
GO
/****** Object:  Table [dbo].[ProductPorderLogistics]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPorderLogistics](
	[LogisticsID] [int] NOT NULL,
	[DetailID] [int] NULL,
	[ExpressID] [nvarchar](200) NULL,
	[ExpressCompany] [nvarchar](100) NULL,
	[ExpressType] [int] NULL,
	[ExpressDesc] [nvarchar](500) NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductPorderLogistics] PRIMARY KEY CLUSTERED 
(
	[LogisticsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SupUserOrderLogisticView]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SupUserOrderLogisticView]
AS
SELECT  dbo.ProductOrderDetail.DetailID, dbo.ProductOrderDetail.OrderNo, dbo.ProductOrderDetail.UserID, 
                   dbo.ProductOrderDetail.ShopID, dbo.ProductOrderDetail.ProductID, dbo.ProductOrderDetail.ProductPrice, 
                   dbo.ProductOrderDetail.DiscountPrice, dbo.ProductOrderDetail.OrderProductNum, 
                   dbo.ProductOrderDetail.OrderDetailState, dbo.ProductPorderLogistics.LogisticsID, 
                   dbo.ProductPorderLogistics.ExpressID, dbo.ProductPorderLogistics.ExpressCompany, 
                   dbo.ProductPorderLogistics.ExpressType, dbo.ProductPorderLogistics.ExpressDesc, 
                   dbo.ProductPorderLogistics.AddDate, dbo.Product.ProductName, dbo.Product.ProductType, dbo.Product.Price, 
                   dbo.Product.ActivityPrice, dbo.Product.discount, dbo.Product.discountType, dbo.Product.ProductNum, 
                   dbo.Product.ProductIntroduce, dbo.Product.ProductStarNum, dbo.Product.ProductState, dbo.Product.ProductStock,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 1)) AS ImgPath1,
                       (SELECT  ImgPath
                        FROM       dbo.ProductImage AS g
                        WHERE    (ProductID = dbo.Product.ProductID) AND (ImgType = 1) AND (ImgOrderby = 2)) AS ImgPath2
FROM      dbo.ProductOrderDetail INNER JOIN
                   dbo.ProductPorderLogistics ON dbo.ProductOrderDetail.DetailID = dbo.ProductPorderLogistics.DetailID INNER JOIN
                   dbo.Product ON dbo.ProductOrderDetail.ProductID = dbo.Product.ProductID
GO
/****** Object:  View [dbo].[SupProductdetailView]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SupProductdetailView]
AS
SELECT  dbo.Product.ID, dbo.Product.ProductID, dbo.Product.ShopID, dbo.Product.ProductName, dbo.Product.ProductType, 
                   dbo.Product.Price, dbo.Product.ActivityPrice, dbo.Product.discount, dbo.Product.discountType, dbo.Product.ProductNum, 
                   dbo.Product.ProductIntroduce, dbo.Product.ProductStarNum, dbo.Product.ProductState, dbo.Product.ProductStock, 
                   dbo.Product.AddDate, dbo.ProductImage.ImgID, dbo.ProductImage.ImgType, dbo.ProductImage.ImgName, 
                   dbo.ProductImage.ImgPath, dbo.ProductImage.ImgSize, dbo.ProductImage.ImgOrderby, dbo.ProductImage.ImgState, 
                   dbo.ProductImage.AddDate AS ImgAddDate, dbo.ShopProductTypes.ProductTypeName, 
                   dbo.ShopProductTypes.ProductDesc, dbo.ShopProductTypes.TypeName, dbo.ShopProductStarRating.StarNum, 
                   dbo.ShopProductStarRating.StarDesc, dbo.ShopProductStarRating.Star1, dbo.ShopProductStarRating.Star2, 
                   dbo.ShopProductStarRating.Star3, dbo.ShopProductStarRating.Star4, dbo.ShopProductStarRating.Star5, 
                   dbo.ShopProductStarRating.StarType, dbo.ShopProductStarRating.StarOrder, dbo.Shop.ShopName, 
                   dbo.Shop.ShopIntroduce, dbo.Shop.ShopAddress, dbo.Shop.ShopMobile, dbo.Shop.ShopBoss, dbo.Shop.ShopOpenTime, 
                   dbo.Shop.ShopStarNum, dbo.Shop.ShopType, dbo.Shop.ShopState, dbo.Shop.AddDate AS ShopAddDate
FROM      dbo.Product INNER JOIN
                   dbo.ProductImage ON dbo.Product.ProductID = dbo.ProductImage.ProductID INNER JOIN
                   dbo.ShopProductTypes ON dbo.Product.ProductType = dbo.ShopProductTypes.ProductType INNER JOIN
                   dbo.ShopProductStarRating ON dbo.Product.ProductStarNum = dbo.ShopProductStarRating.StarNum LEFT OUTER JOIN
                   dbo.Shop ON dbo.Product.ShopID = dbo.Shop.ShopID AND dbo.ShopProductTypes.ProductType = dbo.Shop.ShopType AND
                    dbo.ShopProductStarRating.StarNum = dbo.Shop.ShopStarNum
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022/6/18 0:20:27 ******/
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
/****** Object:  Table [dbo].[BannerImage]    Script Date: 2022/6/18 0:20:27 ******/
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
/****** Object:  Table [dbo].[ProductCollect]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCollect](
	[CollectID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ShopID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ShopCollect] PRIMARY KEY CLUSTERED 
(
	[CollectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStars]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStars](
	[StarID] [int] IDENTITY(1,101) NOT NULL,
	[StarType] [int] NULL,
	[StarTxt] [nvarchar](20) NULL,
	[StarDesc] [nvarchar](200) NULL,
	[StarNum] [decimal](5, 2) NULL,
	[StarOrderby] [int] NULL,
	[State] [int] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_ProductStars] PRIMARY KEY CLUSTERED 
(
	[StarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleList]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleList](
	[TitleID] [int] IDENTITY(1001,1) NOT NULL,
	[about] [nvarchar](50) NULL,
	[TitleDesc] [nvarchar](250) NULL,
	[Title] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[UserAddress]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddress](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](11) NULL,
	[Province] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Town] [nvarchar](50) NULL,
	[DetailAddress] [nvarchar](100) NULL,
	[State] [int] NULL,
	[Other] [nvarchar](200) NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLoginLog]    Script Date: 2022/6/18 0:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLoginLog](
	[LogID] [int] IDENTITY(1001,1) NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[LoginIP] [nvarchar](250) NULL,
	[LoginVpnIP1] [nvarchar](250) NULL,
	[LoginVpnIP2] [nvarchar](250) NULL,
	[LoginVpnIP3] [nvarchar](250) NULL,
	[LoginState] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_UserLoginLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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

INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1001, N'wx-10001', N'SD-2022042115', N'薯条', 101, CAST(9.90 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(0.80 AS Decimal(5, 2)), 0, 100, N'美味薯条，你值得拥有。', CAST(4.50 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1002, N'wx-10002', N'SD-2022042115', N'辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。辣条，超级辣，变态辣。', 101, CAST(10.90 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.80 AS Decimal(5, 2)), 1, 100, N'美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。美味辣条，你值得拥有。', CAST(5.00 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1003, N'wx-10003', N'SD-2022042115', N'试试哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇', 101, CAST(19.90 AS Decimal(18, 2)), CAST(19.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'方式发送给然后优酷一份节能环保的v', CAST(4.00 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:02:36.500' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1004, N'wx-10004', N'SD-2022042115', N'酷酷酷酷酷酷酷酷酷酷酷酷', 101, CAST(139.90 AS Decimal(18, 2)), CAST(139.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'空间和广泛的三维人体与脚后跟范德萨', CAST(4.00 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:02:40.700' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1005, N'wx-10005', N'SD-2022042115', N'柔柔弱弱也一样', 101, CAST(129.90 AS Decimal(18, 2)), CAST(129.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'的道德观广告经济全球啊啊', CAST(3.50 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:02:44.770' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1006, N'wx-10006', N'SD-2022042115', N'全球企业应用怕怕怕怕和皇后娘娘', 101, CAST(159.90 AS Decimal(18, 2)), CAST(159.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'水水水水顶顶顶烦烦烦哥哥回家看了', CAST(5.00 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:02:49.803' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1007, N'wx-10007', N'SD-2022042115', N'政治制度的日日日涛涛', 101, CAST(199.90 AS Decimal(18, 2)), CAST(199.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'嘻嘻嘻错错错不不不你你你你你你', CAST(3.00 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:02:53.853' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1008, N'wx-10008', N'SD-2022042115', N'事实上踩踩吃吃喝喝', 101, CAST(19.90 AS Decimal(18, 2)), CAST(19.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 1, 0, N'沾沾自喜喜喜成都色网提供', CAST(4.00 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:02:56.803' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1009, N'wx-10009', N'SD-2022042115', N'得到的哈哈哈哈也一样', 101, CAST(39.90 AS Decimal(18, 2)), CAST(39.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'神神叨叨的太太体育用品品牌', CAST(4.50 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:03:01.657' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1010, N'wx-10010', N'SD-2022042115', N'点点滴滴八八八八', 101, CAST(29.90 AS Decimal(18, 2)), CAST(29.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'亲切慰问慰问厄尔特意跑来看过', CAST(2.50 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:03:21.310' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1011, N'wx-10011', N'SD-2022042115', N'水水水水水水水水', 101, CAST(49.90 AS Decimal(18, 2)), CAST(49.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'是围绕太阳评论家和房东实行差别那么', CAST(2.00 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:03:26.453' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1012, N'wx-10012', N'SD-2022042115', N'反反复复烦烦烦反反复复烦烦烦', 101, CAST(59.90 AS Decimal(18, 2)), CAST(59.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'之前我是的人非常不那么饥渴了', CAST(1.00 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:03:31.007' AS DateTime))
INSERT [dbo].[Product] ([ID], [ProductID], [ShopID], [ProductName], [ProductType], [Price], [ActivityPrice], [discount], [discountType], [ProductNum], [ProductIntroduce], [ProductStarNum], [ProductState], [ProductStock], [AddDate]) VALUES (1013, N'wx-10013', N'SD-2022042115', N'兢兢业业也天天天天', 101, CAST(69.90 AS Decimal(18, 2)), CAST(69.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(5, 2)), 0, 0, N'按时的发人体一会进口快件', CAST(0.00 AS Decimal(5, 2)), 1, 1000, CAST(N'2022-04-27T14:03:37.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCart] ON 

INSERT [dbo].[ProductCart] ([CartID], [UserID], [ProductID], [ProductCartNum], [ProductPrice], [CartType], [AddDate]) VALUES (1001, N'US202206141001', N'wx-10002', 2, CAST(199.00 AS Decimal(18, 2)), 1, CAST(N'2022-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductCart] ([CartID], [UserID], [ProductID], [ProductCartNum], [ProductPrice], [CartType], [AddDate]) VALUES (1002, N'US202206141001', N'wx-10005', 2, CAST(199.00 AS Decimal(18, 2)), 1, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductCart] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1001, N'SD-2022042115', N'wx-10001', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1002, N'SD-2022042115', N'wx-10001', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1003, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1004, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1005, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1006, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1007, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1008, N'SD-2022042115', N'wx-10001', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1009, N'SD-2022042115', N'wx-10002', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1010, N'SD-2022042115', N'wx-10002', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1011, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1012, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1013, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1014, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1015, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1016, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1017, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T15:14:08.737' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1018, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T15:14:34.233' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1019, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 9, 1, CAST(N'2022-04-25T15:16:36.380' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1020, N'SD-2022042115', N'wx-10002', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 10, 1, CAST(N'2022-04-25T15:17:59.683' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1021, N'SD-2022042115', N'wx-10003', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1022, N'SD-2022042115', N'wx-10003', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1023, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1024, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1025, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1026, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1027, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1028, N'SD-2022042115', N'wx-10003', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1029, N'SD-2022042115', N'wx-10005', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1030, N'SD-2022042115', N'wx-10005', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1031, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1032, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1033, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1034, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1035, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1036, N'SD-2022042115', N'wx-10005', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1037, N'SD-2022042115', N'wx-10004', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1038, N'SD-2022042115', N'wx-10004', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1039, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1040, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1041, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1042, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1043, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1044, N'SD-2022042115', N'wx-10004', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1045, N'SD-2022042115', N'wx-10006', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1046, N'SD-2022042115', N'wx-10006', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1047, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1048, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1049, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1050, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1051, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1052, N'SD-2022042115', N'wx-10006', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1053, N'SD-2022042115', N'wx-10007', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1054, N'SD-2022042115', N'wx-10007', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1055, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1056, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1057, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1058, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1059, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1060, N'SD-2022042115', N'wx-10007', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1061, N'SD-2022042115', N'wx-10008', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1062, N'SD-2022042115', N'wx-10008', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1063, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1064, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1065, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1066, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1067, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1068, N'SD-2022042115', N'wx-10008', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1069, N'SD-2022042115', N'wx-10009', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1070, N'SD-2022042115', N'wx-10009', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1071, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1072, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1073, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1074, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1075, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1076, N'SD-2022042115', N'wx-10009', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1077, N'SD-2022042115', N'wx-10010', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1078, N'SD-2022042115', N'wx-10010', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1079, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1080, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1081, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1082, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1083, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1084, N'SD-2022042115', N'wx-10010', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1085, N'SD-2022042115', N'wx-10011', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1086, N'SD-2022042115', N'wx-10011', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1087, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1088, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1089, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1090, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1091, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1092, N'SD-2022042115', N'wx-10011', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1093, N'SD-2022042115', N'wx-10012', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1094, N'SD-2022042115', N'wx-10012', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1095, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1096, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1097, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1098, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1099, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
GO
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1100, N'SD-2022042115', N'wx-10012', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1101, N'SD-2022042115', N'wx-10013', N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, 1, CAST(N'2022-04-25T09:27:40.710' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1102, N'SD-2022042115', N'wx-10013', N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1103, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1104, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1105, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1106, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 6, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1107, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 7, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1108, N'SD-2022042115', N'wx-10013', N'2', N'副图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 8, 1, CAST(N'2022-04-25T09:27:40.000' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1109, N'SD-2022042115', N'wx-10014', N'1', N'主图', NULL, NULL, 1, 1, CAST(N'2022-04-27T15:09:59.770' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1110, N'SD-2022042115', N'wx-10014', N'1', N'副主图', NULL, NULL, 2, 1, CAST(N'2022-04-27T15:10:19.887' AS DateTime))
INSERT [dbo].[ProductImage] ([ImgID], [ShopID], [ProductID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [ImgState], [AddDate]) VALUES (1111, N'SD-2022042115', N'wx-10014', N'2', N'副图', NULL, NULL, 3, 1, CAST(N'2022-04-27T15:11:46.760' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductStars] ON 

INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (101, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(0.00 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (102, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(0.00 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (103, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(0.00 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (104, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(0.00 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (105, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(0.00 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (106, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', CAST(0.50 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (107, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(0.50 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (108, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(0.50 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (109, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(0.50 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (110, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(0.50 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (111, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(1.00 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (112, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(1.00 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (113, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(1.00 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (114, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(1.00 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (115, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(1.00 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (116, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(1.50 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (117, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', CAST(1.50 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (118, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(1.50 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (119, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(1.50 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (120, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(1.50 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (121, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(2.00 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (122, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(2.00 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (123, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(2.00 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (124, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(2.00 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (125, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(2.00 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (126, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(2.50 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (127, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(2.50 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (128, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', CAST(2.50 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (129, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(2.50 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (130, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(2.50 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (131, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(3.00 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (132, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(3.00 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (133, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(3.00 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (134, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(3.00 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (135, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(3.00 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (136, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(3.50 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (137, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(3.50 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (138, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(3.50 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (139, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', CAST(3.50 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (140, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(3.50 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (141, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(4.00 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (142, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(4.00 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (143, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(4.00 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (144, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(4.00 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (145, NULL, N'星级评分', N'<i class="fa fa-star-o"></i>', CAST(4.00 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (146, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(4.50 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (147, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(4.50 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (148, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(4.50 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (149, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(4.50 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (150, NULL, N'星级评分', N'<i class="fa fa-star-half-o"></i>', CAST(4.50 AS Decimal(5, 2)), 5, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (151, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(5.00 AS Decimal(5, 2)), 1, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (152, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(5.00 AS Decimal(5, 2)), 2, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (153, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(5.00 AS Decimal(5, 2)), 3, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (154, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(5.00 AS Decimal(5, 2)), 4, 1, NULL)
INSERT [dbo].[ProductStars] ([StarID], [StarType], [StarTxt], [StarDesc], [StarNum], [StarOrderby], [State], [AddDate]) VALUES (155, NULL, N'星级评分', N'<i class="fa fa-star"></i>', CAST(5.00 AS Decimal(5, 2)), 5, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductStars] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([ID], [ShopID], [UserID], [ShopName], [ShopIntroduce], [ShopAddress], [ShopMobile], [ShopBoss], [ShopOpenTime], [ShopStarNum], [ShopType], [ShopState], [AddDate]) VALUES (1001, N'SD-2022042115', N'123456', N'万物商店', N'应有尽有，无所不有，在这里没有你找不到的东西，只有你想不到！', N'珠海市香洲区', N'18377412687', N'夜老板', NULL, CAST(4.50 AS Decimal(5, 2)), 103, 1, CAST(N'2022-04-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([ID], [ShopID], [UserID], [ShopName], [ShopIntroduce], [ShopAddress], [ShopMobile], [ShopBoss], [ShopOpenTime], [ShopStarNum], [ShopType], [ShopState], [AddDate]) VALUES (1002, N'SD-2022042116', N'123456', N'万物商店222', N'应有尽有，无所不有，在这里没有你找不到的东西，只有你想不到！', N'珠海市香洲区', N'18377412687', N'夜老板222', NULL, CAST(4.50 AS Decimal(5, 2)), 103, 1, CAST(N'2022-04-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopImage] ON 

INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1001, N'SD-2022042115', N'wx-10001', NULL, N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1002, N'SD-2022042115', N'wx-10001', NULL, N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1003, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1004, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 2, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1005, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1006, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1007, N'SD-2022042115', N'wx-10001', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1008, N'SD-2022042116', N'wx-10002', NULL, N'1', N'主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1009, N'SD-2022042116', N'wx-10002', NULL, N'1', N'副主图', N'/images/other/fadf8f4844ebceedaa41956a889608b5.jpg', NULL, 2, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1010, N'SD-2022042116', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 1, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1011, N'SD-2022042116', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 2, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1012, N'SD-2022042116', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 3, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1013, N'SD-2022042116', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 4, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ShopImage] ([ImgID], [ShopID], [ProductID], [UserID], [ImgType], [ImgName], [ImgPath], [ImgSize], [ImgOrderby], [AddDate]) VALUES (1014, N'SD-2022042116', N'wx-10002', NULL, N'2', N'副主图', N'/images/other/small223420RYybl1641220460.jpg', NULL, 5, CAST(N'2022-06-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShopImage] OFF
GO
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(0.00 AS Decimal(5, 2)), N'星级评分', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 1)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(0.50 AS Decimal(5, 2)), N'星级评分', N'fa fa-star-half-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 2)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(1.00 AS Decimal(5, 2)), N'星级评分', N'fa fa-star', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 3)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(1.50 AS Decimal(5, 2)), N'星级评分', N'fa fa-star', N'fa fa-star-half-o', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 4)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(2.00 AS Decimal(5, 2)), N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star-o', N'fa fa-star-o', N'fa fa-star-o', 1, 5)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(2.50 AS Decimal(5, 2)), N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star-half-o', N'fa fa-star-o', N'fa fa-star-o', 1, 6)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(3.00 AS Decimal(5, 2)), N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star-o', N'<i class="fa fa-star-o"></i>', 1, 7)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(3.50 AS Decimal(5, 2)), N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star-half-o', N'fa fa-star-o', 1, 8)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(4.00 AS Decimal(5, 2)), N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star-o', 1, 9)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(4.50 AS Decimal(5, 2)), N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star-half-o', 1, 10)
INSERT [dbo].[ShopProductStarRating] ([StarNum], [StarDesc], [Star1], [Star2], [Star3], [Star4], [Star5], [StarType], [StarOrder]) VALUES (CAST(5.00 AS Decimal(5, 2)), N'星级评分', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star', N'fa fa-star', 1, 11)
GO
INSERT [dbo].[ShopProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (101, N'食品类', NULL, N'SP')
INSERT [dbo].[ShopProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (102, N'服装类', NULL, N'FZ')
INSERT [dbo].[ShopProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (103, N'洗护类', NULL, N'XH')
INSERT [dbo].[ShopProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (104, N'手办类', NULL, N'SB')
INSERT [dbo].[ShopProductTypes] ([ProductType], [ProductTypeName], [ProductDesc], [TypeName]) VALUES (105, N'书画类', NULL, N'SH')
GO
SET IDENTITY_INSERT [dbo].[TitleList] ON 

INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1001, N'导航栏', N'手办周边', N'手办', NULL, 1, 1, CAST(N'2022-04-20T17:08:08.737' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1002, N'导航栏', N'图书漫画', N'书画', NULL, 2, 1, CAST(N'2022-04-20T17:08:21.570' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1003, N'导航栏', N'服装服饰', N'服饰', NULL, 3, 1, CAST(N'2022-04-20T17:08:37.387' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1004, N'导航栏', N'洗护用品', N'洗护', NULL, 4, 1, CAST(N'2022-04-20T17:08:49.703' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1005, N'导航栏', N'优选零食', N'零食', NULL, 5, 1, CAST(N'2022-04-20T17:09:03.640' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1006, N'导航栏', N'活动专区', N'活动', NULL, 6, 1, CAST(N'2022-04-20T17:09:15.153' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1007, N'user-menu', N'个人信息', N'fa fa-user', NULL, 1, 1, CAST(N'2022-04-27T13:43:42.800' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1008, N'user-menu', N'我的订单', N'fa fa-file-text', NULL, 2, 1, CAST(N'2022-04-27T13:44:22.927' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1009, N'user-menu', N'物流查询', N'fa fa-bus', NULL, 3, 1, CAST(N'2022-04-27T13:44:41.620' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1010, N'user-menu', N'收货地址', N'fa fa-home', NULL, 4, 1, CAST(N'2022-04-27T13:44:22.927' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1011, N'user-menu', N'评价中心', N'fa fa-comment', NULL, 5, 1, CAST(N'2022-04-27T13:44:41.620' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1012, N'order-by', N'当前排序: 由系统进行排序', N'1', NULL, 0, 1, CAST(N'2022-06-13T09:44:30.453' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1013, N'order-by', N'按新意排序', N'2', NULL, 1, 1, CAST(N'2022-06-13T09:44:55.453' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1014, N'order-by', N'产品名称排序', N'3', NULL, 2, 1, CAST(N'2022-06-13T09:45:30.897' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1015, N'order-by', N'受欢迎程度排序', N'4', NULL, 3, 1, CAST(N'2022-06-13T09:45:48.223' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1016, N'order-by', N'按价格排序: 低到高', N'5', NULL, 4, 1, CAST(N'2022-06-13T09:46:06.000' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1017, N'order-by', N'按价格排序: 高到低', N'6', NULL, 5, 1, CAST(N'2022-06-13T09:46:25.490' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1018, N'agreement', N'1-2工作日开始发货', N'1', NULL, 1, 1, CAST(N'2022-06-14T15:38:27.610' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1019, N'agreement', N'支持7天无理由退款', N'1', NULL, 2, 1, CAST(N'2022-06-14T15:38:27.610' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1020, N'agreement', N'支持30天退钱担保', N'1', NULL, 3, 1, CAST(N'2022-06-14T15:38:27.610' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1021, N'agreement', N'破损包退，签收72小时内，商品破损并提供有效凭证的，商家24小时内响应并退款。', N'1', NULL, 4, 1, CAST(N'2022-06-14T15:38:27.610' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1022, N'agreement', N'退货运费险，卖家投保退货运费险，负担一定金额退货运费（保单生效以商家显示为准）', N'1', NULL, 5, 1, CAST(N'2022-06-14T15:38:27.610' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1023, N'agreement', N'30天价保服务，若您购买的商品发生了降价，可在订单商品妥投之前及妥投30天内申请价保。申请成功，如已付款订单，将返还您与差额部分等值现金', N'1', NULL, 6, 1, CAST(N'2022-06-14T15:38:27.610' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1024, N'agreement', N'其他', N'1', NULL, 7, 1, CAST(N'2022-06-14T15:38:27.610' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1025, N'user-tab', N'我的订单', N'fa fa-file-text', NULL, 1, 1, CAST(N'2022-04-27T13:43:42.800' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1026, N'user-tab', N'我的收藏', N'fa fa-heart', NULL, 2, 1, CAST(N'2022-04-27T13:44:22.927' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1027, N'user-tab', N'修改个人信息', N'fa fa-user', NULL, 3, 1, CAST(N'2022-04-27T13:44:41.620' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1028, N'user-tab', N'收货地址管理', N'fa fa-home', NULL, 4, 1, CAST(N'2022-04-27T13:44:22.927' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1029, N'user-tab', N'商品物流查询', N'fa fa-bus', NULL, 5, 1, CAST(N'2022-04-27T13:44:41.620' AS DateTime))
INSERT [dbo].[TitleList] ([TitleID], [about], [TitleDesc], [Title], [TitleUrl], [TitleOrderby], [State], [AddDate]) VALUES (1030, N'user-tab', N'商品评价管理', N'fa fa-comment', NULL, 6, 1, CAST(N'2022-04-27T13:44:41.620' AS DateTime))
SET IDENTITY_INSERT [dbo].[TitleList] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserID], [Account], [Password], [UserName], [UserEmail], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserType], [UserState], [AddDate]) VALUES (1001, N'US202206141001', N'123456', N'oBHRGubEPQZwNKQQxO5orw==.RcMtQNgyrcLlOChESqnBe8FieSmSWjFKkGnQ37eKzxY=', N'新用户', NULL, N'3   ', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Account], [Password], [UserName], [UserEmail], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserType], [UserState], [AddDate]) VALUES (1002, N'US202206141002', N'111', N'zOsCynopqck2z3j5PjwH7g==.kjYR54C3wXlAYOJZH54ZNEkLXhIe5Z1orITnhlCgQm4=', N'新用户', NULL, N'3   ', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Account], [Password], [UserName], [UserEmail], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserType], [UserState], [AddDate]) VALUES (1003, N'US202206141003', N'222', N'MAYi/lIq8zdKJlV8Vyey5Q==.PJXjEs5du54nwznbbGE3cMxrlBwF+xsLja0jf5T8lhw=', N'新用户', NULL, N'3   ', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Users] ([ID], [UserID], [Account], [Password], [UserName], [UserEmail], [Sex], [Age], [Introduce], [Address], [Birthday], [CreatedAt], [UserType], [UserState], [AddDate]) VALUES (1004, N'US202206141004', N'111111', N'111111', N'111', NULL, N'3   ', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [ix_com_Users]    Script Date: 2022/6/18 0:20:28 ******/
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
ALTER TABLE [dbo].[ProductCart] ADD  CONSTRAINT [DF_ShopCar_ShopNum]  DEFAULT ((1)) FOR [ProductCartNum]
GO
ALTER TABLE [dbo].[ProductCart] ADD  CONSTRAINT [DF_ShopCar_CarType]  DEFAULT ((1)) FOR [CartType]
GO
ALTER TABLE [dbo].[ProductCart] ADD  CONSTRAINT [DF_ProductCart_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[ProductCollect] ADD  CONSTRAINT [DF_ProductCollect_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[ProductComment] ADD  CONSTRAINT [DF_ShopComment_CommentType]  DEFAULT ((1)) FOR [CommentType]
GO
ALTER TABLE [dbo].[ProductComment] ADD  CONSTRAINT [DF_ShopComment_CommentState]  DEFAULT ((1)) FOR [CommentState]
GO
ALTER TABLE [dbo].[ProductComment] ADD  CONSTRAINT [DF_ProductComment_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[ProductCommentImage] ADD  CONSTRAINT [DF_ProductCommentImage_ComState]  DEFAULT ((1)) FOR [ComState]
GO
ALTER TABLE [dbo].[ProductCommentImage] ADD  CONSTRAINT [DF_ProductCommentImage_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[ProductCommentLike] ADD  CONSTRAINT [DF_ProductCommentLike_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[ProductImage] ADD  CONSTRAINT [DF_ProductImage_ImgState]  DEFAULT ((1)) FOR [ImgState]
GO
ALTER TABLE [dbo].[ProductImage] ADD  CONSTRAINT [DF_ProductImage_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[ProductOrder] ADD  CONSTRAINT [DF_ShopOrder_OrderType]  DEFAULT ((1)) FOR [OrderType]
GO
ALTER TABLE [dbo].[ProductOrder] ADD  CONSTRAINT [DF_ProductOrder_OrderState]  DEFAULT ((1)) FOR [OrderState]
GO
ALTER TABLE [dbo].[ProductOrder] ADD  CONSTRAINT [DF_ProductOrder_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[ProductOrderDetail] ADD  CONSTRAINT [DF_ProductOrderDetail_OrderState]  DEFAULT ((1)) FOR [OrderDetailState]
GO
ALTER TABLE [dbo].[ProductPorderLogistics] ADD  CONSTRAINT [DF_ProductPorderLogistics_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_ShopType]  DEFAULT ((101)) FOR [ShopType]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_ShopState]  DEFAULT ((1)) FOR [ShopState]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[ShopImage] ADD  CONSTRAINT [DF_ShopImage_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[TitleList] ADD  CONSTRAINT [DF_TitleList_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[UserAddress] ADD  CONSTRAINT [DF_UserAddress_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[UserAddress] ADD  CONSTRAINT [DF_UserAddress_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[UserImageList] ADD  CONSTRAINT [DF_UserImageList_ImgState]  DEFAULT ((1)) FOR [ImgState]
GO
ALTER TABLE [dbo].[UserImageList] ADD  CONSTRAINT [DF_UserImage_ImgType]  DEFAULT ((1)) FOR [ImgType]
GO
ALTER TABLE [dbo].[UserImageList] ADD  CONSTRAINT [DF_UserImageList_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[UserLike] ADD  CONSTRAINT [DF_UserLike_LikeType]  DEFAULT ((1)) FOR [LikeType]
GO
ALTER TABLE [dbo].[UserLike] ADD  CONSTRAINT [DF_UserLike_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[UserLoginLog] ADD  CONSTRAINT [DF_UserLoginLog_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserType]  DEFAULT ((1)) FOR [UserType]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserState]  DEFAULT ((1)) FOR [UserState]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductStarRating] FOREIGN KEY([ProductStarNum])
REFERENCES [dbo].[ShopProductStarRating] ([StarNum])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductStarRating]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ShopProductTypes] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ShopProductTypes] ([ProductType])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ShopProductTypes]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Product] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Shop_Product]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_Product]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_ShopProductStarRating] FOREIGN KEY([CommentStarNum])
REFERENCES [dbo].[ShopProductStarRating] ([StarNum])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_ShopProductStarRating]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_Users]
GO
ALTER TABLE [dbo].[ProductCommentImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductCommentImage_ProductComment] FOREIGN KEY([ComImgID])
REFERENCES [dbo].[ProductComment] ([CommentID])
GO
ALTER TABLE [dbo].[ProductCommentImage] CHECK CONSTRAINT [FK_ProductCommentImage_ProductComment]
GO
ALTER TABLE [dbo].[ProductImage]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Shop]
GO
ALTER TABLE [dbo].[ProductOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrder_ProductOrder] FOREIGN KEY([OrderNo])
REFERENCES [dbo].[ProductOrder] ([OrderNo])
GO
ALTER TABLE [dbo].[ProductOrder] CHECK CONSTRAINT [FK_ProductOrder_ProductOrder]
GO
ALTER TABLE [dbo].[ProductOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrder_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProductOrder] CHECK CONSTRAINT [FK_ProductOrder_Users]
GO
ALTER TABLE [dbo].[ProductOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductOrderDetail] CHECK CONSTRAINT [FK_ProductOrderDetail_Product]
GO
ALTER TABLE [dbo].[ProductOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderDetail_ProductOrder] FOREIGN KEY([OrderNo])
REFERENCES [dbo].[ProductOrder] ([OrderNo])
GO
ALTER TABLE [dbo].[ProductOrderDetail] CHECK CONSTRAINT [FK_ProductOrderDetail_ProductOrder]
GO
ALTER TABLE [dbo].[ProductPorderLogistics]  WITH CHECK ADD  CONSTRAINT [FK_ProductPorderLogistics_ProductOrderDetail] FOREIGN KEY([DetailID])
REFERENCES [dbo].[ProductOrderDetail] ([DetailID])
GO
ALTER TABLE [dbo].[ProductPorderLogistics] CHECK CONSTRAINT [FK_ProductPorderLogistics_ProductOrderDetail]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_ProductStarRating] FOREIGN KEY([ShopStarNum])
REFERENCES [dbo].[ShopProductStarRating] ([StarNum])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_ProductStarRating]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_ShopProductTypes] FOREIGN KEY([ShopType])
REFERENCES [dbo].[ShopProductTypes] ([ProductType])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_ShopProductTypes]
GO
ALTER TABLE [dbo].[ShopImage]  WITH CHECK ADD  CONSTRAINT [FK_ShopImage_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ShopImage] CHECK CONSTRAINT [FK_ShopImage_Product]
GO
ALTER TABLE [dbo].[ShopImage]  WITH CHECK ADD  CONSTRAINT [FK_ShopImage_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[ShopImage] CHECK CONSTRAINT [FK_ShopImage_Shop]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_UserAddress_UserAddress] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [FK_UserAddress_UserAddress]
GO
ALTER TABLE [dbo].[UserImageList]  WITH CHECK ADD  CONSTRAINT [FK_UserImageList_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserImageList] CHECK CONSTRAINT [FK_UserImageList_Users]
GO
ALTER TABLE [dbo].[UserLike]  WITH CHECK ADD  CONSTRAINT [FK_UserLike_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[UserLike] CHECK CONSTRAINT [FK_UserLike_Product]
GO
ALTER TABLE [dbo].[UserLike]  WITH CHECK ADD  CONSTRAINT [FK_UserLike_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[UserLike] CHECK CONSTRAINT [FK_UserLike_Shop]
GO
ALTER TABLE [dbo].[UserLike]  WITH CHECK ADD  CONSTRAINT [FK_UserLike_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserLike] CHECK CONSTRAINT [FK_UserLike_Users]
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
         Top = -120
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Product"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShopProductStarRating"
            Begin Extent = 
               Top = 215
               Left = 491
               Bottom = 378
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "ShopProductTypes"
            Begin Extent = 
               Top = 6
               Left = 492
               Bottom = 169
               Right = 724
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Shop"
            Begin Extent = 
               Top = 221
               Left = 49
               Bottom = 384
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 9
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
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SuperProductView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SuperProductView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SuperProductView'
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
               Top = 7
               Left = 48
               Bottom = 170
               Right = 272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductImage"
            Begin Extent = 
               Top = 12
               Left = 741
               Bottom = 175
               Right = 925
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "ShopProductTypes"
            Begin Extent = 
               Top = 204
               Left = 48
               Bottom = 367
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShopProductStarRating"
            Begin Extent = 
               Top = 201
               Left = 746
               Bottom = 364
               Right = 913
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Shop"
            Begin Extent = 
               Top = 203
               Left = 388
               Bottom = 366
               Right = 597
            End
            DisplayFlags = 280
            TopColumn = 9
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1560
         Table = 2232
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupProductdetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupProductdetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupProductdetailView'
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Shop"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "ShopImage"
            Begin Extent = 
               Top = 7
               Left = 300
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShopProductStarRating"
            Begin Extent = 
               Top = 234
               Left = 51
               Bottom = 397
               Right = 317
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ShopProductTypes"
            Begin Extent = 
               Top = 164
               Left = 524
               Bottom = 327
               Right = 756
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2100
         Table = 3240
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupShopdetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupShopdetailView'
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
         Begin Table = "Users"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "UserImageList"
            Begin Extent = 
               Top = 7
               Left = 267
               Bottom = 170
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "ProductComment"
            Begin Extent = 
               Top = 194
               Left = 28
               Bottom = 357
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShopProductStarRating_1"
            Begin Extent = 
               Top = 193
               Left = 311
               Bottom = 356
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductCommentImage"
            Begin Extent = 
               Top = 398
               Left = 28
               Bottom = 561
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 11964
         Alias = 1428
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserCommentView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserCommentView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserCommentView'
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
         Top = -4560
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserLike"
            Begin Extent = 
               Top = 7
               Left = 269
               Bottom = 170
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Product"
            Begin Extent = 
               Top = 7
               Left = 485
               Bottom = 170
               Right = 709
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "ShopProductStarRating"
            Begin Extent = 
               Top = 7
               Left = 757
               Bottom = 170
               Right = 924
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "ShopProductTypes"
            Begin Extent = 
               Top = 214
               Left = 481
               Bottom = 377
               Right = 713
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 7356
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserLikeProductView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserLikeProductView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserLikeProductView'
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserLike"
            Begin Extent = 
               Top = 6
               Left = 135
               Bottom = 169
               Right = 303
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Shop"
            Begin Extent = 
               Top = 1
               Left = 388
               Bottom = 164
               Right = 597
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShopProductStarRating"
            Begin Extent = 
               Top = 7
               Left = 742
               Bottom = 170
               Right = 909
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShopProductTypes"
            Begin Extent = 
               Top = 7
               Left = 957
               Bottom = 170
               Right = 1189
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 11832
         Alias = 1536
         Table = 5844
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserLikeShopView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserLikeShopView'
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ProductOrder"
            Begin Extent = 
               Top = 7
               Left = 269
               Bottom = 170
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductOrderDetail"
            Begin Extent = 
               Top = 3
               Left = 512
               Bottom = 170
               Right = 753
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Product"
            Begin Extent = 
               Top = 11
               Left = 809
               Bottom = 174
               Right = 1033
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShopProductTypes"
            Begin Extent = 
               Top = 194
               Left = 508
               Bottom = 357
               Right = 740
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 11532
         Alias = 1272
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserOrderdetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserOrderdetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserOrderdetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[24] 2[20] 3) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ProductOrderDetail"
            Begin Extent = 
               Top = 16
               Left = 66
               Bottom = 179
               Right = 297
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "ProductPorderLogistics"
            Begin Extent = 
               Top = 6
               Left = 447
               Bottom = 169
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Product"
            Begin Extent = 
               Top = 200
               Left = 69
               Bottom = 363
               Right = 293
            End
            DisplayFlags = 280
            TopColumn = 11
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 9576
         Alias = 1704
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserOrderLogisticView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserOrderLogisticView'
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductCart"
            Begin Extent = 
               Top = 7
               Left = 269
               Bottom = 170
               Right = 487
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Product"
            Begin Extent = 
               Top = 7
               Left = 535
               Bottom = 170
               Right = 759
            End
            DisplayFlags = 280
            TopColumn = 11
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 12528
         Alias = 1236
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserProductCartView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SupUserProductCartView'
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
