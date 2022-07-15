using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace coreWeb_MVC.Migrations
{
    public partial class Userschange : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "BannerImage",
                columns: table => new
                {
                    BannerID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Path = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: true),
                    Paths = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: true),
                    Title = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: true),
                    TitleDesc = table.Column<string>(type: "nvarchar(300)", maxLength: 300, nullable: true),
                    TitleDescs = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    Text_1 = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    Text_2 = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    Text_3 = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    State = table.Column<int>(type: "int", nullable: true),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BannerImage", x => x.BannerID);
                });

            migrationBuilder.CreateTable(
                name: "ProductCollect",
                columns: table => new
                {
                    CollectID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    ShopID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    ProductID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShopCollect", x => x.CollectID);
                });

            migrationBuilder.CreateTable(
                name: "ProductCommentLike",
                columns: table => new
                {
                    LikeID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CommentID = table.Column<int>(type: "int", nullable: true),
                    CommreplyID = table.Column<int>(type: "int", nullable: true),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductCommentLike", x => x.LikeID);
                });

            migrationBuilder.CreateTable(
                name: "ProductStars",
                columns: table => new
                {
                    StarID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StarType = table.Column<int>(type: "int", nullable: true),
                    StarTxt = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
                    StarDesc = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    StarNum = table.Column<decimal>(type: "decimal(5,2)", nullable: true),
                    StarOrderby = table.Column<int>(type: "int", nullable: true),
                    State = table.Column<int>(type: "int", nullable: true),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductStars", x => x.StarID);
                });

            migrationBuilder.CreateTable(
                name: "ShopProductStarRating",
                columns: table => new
                {
                    StarNum = table.Column<decimal>(type: "decimal(5,2)", nullable: false),
                    StarDesc = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Star1 = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    Star2 = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    Star3 = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    Star4 = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    Star5 = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    StarType = table.Column<int>(type: "int", nullable: true),
                    StarOrder = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductStarRating", x => x.StarNum);
                });

            migrationBuilder.CreateTable(
                name: "ShopProductTypes",
                columns: table => new
                {
                    ProductType = table.Column<int>(type: "int", nullable: false),
                    ProductTypeName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ProductDesc = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    TypeName = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShopTypes", x => x.ProductType);
                });

            migrationBuilder.CreateTable(
                name: "TitleList",
                columns: table => new
                {
                    TitleID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    about = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    TitleDesc = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    Title = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    TitleUrl = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    TitleClass = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    TitleClass1 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    TitleClass2 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    TitleClass3 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Titleothername = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    TitleOrderby = table.Column<int>(type: "int", nullable: false),
                    State = table.Column<int>(type: "int", nullable: false),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TitleList", x => x.TitleID);
                });

            migrationBuilder.CreateTable(
                name: "UserLoginLog",
                columns: table => new
                {
                    LogID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    LoginIP = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    LoginVpnIP1 = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    LoginVpnIP2 = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    LoginVpnIP3 = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    LoginState = table.Column<int>(type: "int", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserLoginLog", x => x.LogID);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Account = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Password = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    UserEmail = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Sex = table.Column<string>(type: "nchar(4)", fixedLength: true, maxLength: 4, nullable: false),
                    Age = table.Column<int>(type: "int", nullable: true),
                    Introduce = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    Address = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Birthday = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UserType = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    UserState = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.UserID);
                });

            migrationBuilder.CreateTable(
                name: "Shop",
                columns: table => new
                {
                    ShopID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ShopName = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    ShopIntroduce = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    ShopAddress = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    ShopMobile = table.Column<string>(type: "nvarchar(11)", maxLength: 11, nullable: false),
                    ShopBoss = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    ShopOpenTime = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    ShopStarNum = table.Column<decimal>(type: "decimal(5,2)", nullable: false),
                    ShopType = table.Column<int>(type: "int", nullable: true, defaultValueSql: "((101))"),
                    ShopState = table.Column<int>(type: "int", nullable: true, defaultValueSql: "((1))"),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Shop_1", x => x.ShopID);
                    table.ForeignKey(
                        name: "FK_Shop_ProductStarRating",
                        column: x => x.ShopStarNum,
                        principalTable: "ShopProductStarRating",
                        principalColumn: "StarNum");
                    table.ForeignKey(
                        name: "FK_Shop_ShopProductTypes",
                        column: x => x.ShopType,
                        principalTable: "ShopProductTypes",
                        principalColumn: "ProductType");
                });

            migrationBuilder.CreateTable(
                name: "UserAddress",
                columns: table => new
                {
                    AddressID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Mobile = table.Column<string>(type: "nvarchar(11)", maxLength: 11, nullable: true),
                    Province = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    City = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Area = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Town = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    DetailAddress = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    State = table.Column<int>(type: "int", nullable: true, defaultValueSql: "((1))"),
                    Other = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Address", x => x.AddressID);
                    table.ForeignKey(
                        name: "FK_UserAddress_UserAddress",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "UserImageList",
                columns: table => new
                {
                    ImgID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    UserImagePath = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: false),
                    ImgSize = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    ImgWidth = table.Column<int>(type: "int", nullable: true),
                    ImgHeight = table.Column<int>(type: "int", nullable: true),
                    ImgState = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    ImgType = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserImage", x => x.ImgID);
                    table.ForeignKey(
                        name: "FK_UserImageList_Users",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "UserSearch",
                columns: table => new
                {
                    searchID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    SearchName = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserSearch", x => x.searchID);
                    table.ForeignKey(
                        name: "FK_UserSearch_Users",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "Product",
                columns: table => new
                {
                    ProductID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ShopID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ProductName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ProductType = table.Column<int>(type: "int", nullable: false),
                    Price = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    ActivityPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    discount = table.Column<decimal>(type: "decimal(5,2)", nullable: true),
                    discountType = table.Column<int>(type: "int", nullable: true, defaultValueSql: "((0))"),
                    ProductNum = table.Column<int>(type: "int", nullable: true, defaultValueSql: "((0))"),
                    ProductIntroduce = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    ProductStarNum = table.Column<decimal>(type: "decimal(5,2)", nullable: true),
                    ProductState = table.Column<int>(type: "int", nullable: true),
                    ProductStock = table.Column<int>(type: "int", nullable: true),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Shop", x => x.ProductID);
                    table.ForeignKey(
                        name: "FK_Product_ProductStarRating",
                        column: x => x.ProductStarNum,
                        principalTable: "ShopProductStarRating",
                        principalColumn: "StarNum");
                    table.ForeignKey(
                        name: "FK_Product_ShopProductTypes",
                        column: x => x.ProductType,
                        principalTable: "ShopProductTypes",
                        principalColumn: "ProductType");
                    table.ForeignKey(
                        name: "FK_Shop_Product",
                        column: x => x.ShopID,
                        principalTable: "Shop",
                        principalColumn: "ShopID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ProductOrder",
                columns: table => new
                {
                    OrderNo = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    OrderID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    OrderName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    OrderAmountPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    OrderDiscountPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    OrderSumPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    OrderNum = table.Column<int>(type: "int", nullable: true),
                    OrderAddressId = table.Column<int>(type: "int", nullable: true),
                    OrderType = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    OrderState = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    OrderDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShopOrder", x => x.OrderNo);
                    table.ForeignKey(
                        name: "FK_ProductOrder_ProductOrder",
                        column: x => x.OrderAddressId,
                        principalTable: "UserAddress",
                        principalColumn: "AddressID");
                    table.ForeignKey(
                        name: "FK_ProductOrder_Users",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "ProductCart",
                columns: table => new
                {
                    CartID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ProductID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ProductCartNum = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    ProductPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    CartType = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShopCar", x => x.CartID);
                    table.ForeignKey(
                        name: "FK_ProductCart_Product",
                        column: x => x.ProductID,
                        principalTable: "Product",
                        principalColumn: "ProductID");
                    table.ForeignKey(
                        name: "FK_ProductCart_Users",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "ProductComment",
                columns: table => new
                {
                    CommentID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ShopID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ProductID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    CommentTxt = table.Column<string>(type: "text", nullable: false),
                    CommentStarNum = table.Column<decimal>(type: "decimal(5,2)", nullable: false),
                    CommentType = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    CommentState = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShopComment", x => x.CommentID);
                    table.ForeignKey(
                        name: "FK_ProductComment_Product",
                        column: x => x.ProductID,
                        principalTable: "Product",
                        principalColumn: "ProductID");
                    table.ForeignKey(
                        name: "FK_ProductComment_ShopProductStarRating",
                        column: x => x.CommentStarNum,
                        principalTable: "ShopProductStarRating",
                        principalColumn: "StarNum");
                    table.ForeignKey(
                        name: "FK_ProductComment_Users",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "ProductImage",
                columns: table => new
                {
                    ImgID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ShopID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    ProductID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    ImgType = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
                    ImgName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ImgPath = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: true),
                    ImgSize = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ImgOrderby = table.Column<int>(type: "int", nullable: true),
                    ImgState = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductImage", x => x.ImgID);
                    table.ForeignKey(
                        name: "FK_ProductImage_Product",
                        column: x => x.ProductID,
                        principalTable: "Product",
                        principalColumn: "ProductID");
                    table.ForeignKey(
                        name: "FK_ProductImage_Shop",
                        column: x => x.ShopID,
                        principalTable: "Shop",
                        principalColumn: "ShopID");
                });

            migrationBuilder.CreateTable(
                name: "ShopImage",
                columns: table => new
                {
                    ImgID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ShopID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    ProductID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    UserID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ImgType = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
                    ImgName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ImgPath = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: true),
                    ImgSize = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ImgOrderby = table.Column<int>(type: "int", nullable: true),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShopImage", x => x.ImgID);
                    table.ForeignKey(
                        name: "FK_ShopImage_Product",
                        column: x => x.ProductID,
                        principalTable: "Product",
                        principalColumn: "ProductID");
                    table.ForeignKey(
                        name: "FK_ShopImage_Shop",
                        column: x => x.ShopID,
                        principalTable: "Shop",
                        principalColumn: "ShopID");
                });

            migrationBuilder.CreateTable(
                name: "UserLike",
                columns: table => new
                {
                    LikeID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ProductID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    ShopID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    LikeType = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserLike", x => x.LikeID);
                    table.ForeignKey(
                        name: "FK_UserLike_Product",
                        column: x => x.ProductID,
                        principalTable: "Product",
                        principalColumn: "ProductID");
                    table.ForeignKey(
                        name: "FK_UserLike_Shop",
                        column: x => x.ShopID,
                        principalTable: "Shop",
                        principalColumn: "ShopID");
                    table.ForeignKey(
                        name: "FK_UserLike_Users",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "UserLookProduct",
                columns: table => new
                {
                    LookID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    PoductID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    ShopID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserLookProduct", x => x.LookID);
                    table.ForeignKey(
                        name: "FK_UserLookProduct_Product",
                        column: x => x.PoductID,
                        principalTable: "Product",
                        principalColumn: "ProductID");
                    table.ForeignKey(
                        name: "FK_UserLookProduct_Users",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "ProductOrderDetail",
                columns: table => new
                {
                    DetailID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    OrderNo = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ShopID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ProductID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    OrderdetailAddressID = table.Column<int>(type: "int", nullable: true),
                    ProductPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    DiscountPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    OrderProductNum = table.Column<int>(type: "int", nullable: true),
                    OrderDetailState = table.Column<int>(type: "int", nullable: true, defaultValueSql: "((1))")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShopOrderDetail", x => x.DetailID);
                    table.ForeignKey(
                        name: "FK_ProductOrderDetail_Product",
                        column: x => x.ProductID,
                        principalTable: "Product",
                        principalColumn: "ProductID");
                    table.ForeignKey(
                        name: "FK_ProductOrderDetail_ProductOrder",
                        column: x => x.OrderNo,
                        principalTable: "ProductOrder",
                        principalColumn: "OrderNo");
                });

            migrationBuilder.CreateTable(
                name: "ProductCommentImage",
                columns: table => new
                {
                    ComImgID = table.Column<int>(type: "int", nullable: false),
                    CommentID = table.Column<int>(type: "int", nullable: false),
                    UserID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    ComImgPath = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: false),
                    ComImgSize = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    ComOrderby = table.Column<int>(type: "int", nullable: false),
                    ComState = table.Column<int>(type: "int", nullable: false, defaultValueSql: "((1))"),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductCommentImage", x => x.ComImgID);
                    table.ForeignKey(
                        name: "FK_ProductCommentImage_ProductComment",
                        column: x => x.ComImgID,
                        principalTable: "ProductComment",
                        principalColumn: "CommentID");
                });

            migrationBuilder.CreateTable(
                name: "ProductCommentReply",
                columns: table => new
                {
                    CommreplyID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CommentID = table.Column<int>(type: "int", nullable: false),
                    UserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    toUserID = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    ComText = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    addDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductCommentReply", x => x.CommreplyID);
                    table.ForeignKey(
                        name: "FK_ProductCommentReply_ProductComment",
                        column: x => x.CommentID,
                        principalTable: "ProductComment",
                        principalColumn: "CommentID");
                });

            migrationBuilder.CreateTable(
                name: "ProductOrderLogistics",
                columns: table => new
                {
                    LogisticsID = table.Column<int>(type: "int", nullable: false),
                    DetailID = table.Column<int>(type: "int", nullable: true),
                    ExpressID = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    ExpressCompany = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    ExpressType = table.Column<int>(type: "int", nullable: true),
                    ExpressDesc = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    AddDate = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductPorderLogistics", x => x.LogisticsID);
                    table.ForeignKey(
                        name: "FK_ProductOrderLogistics_ProductOrderDetail",
                        column: x => x.DetailID,
                        principalTable: "ProductOrderDetail",
                        principalColumn: "DetailID");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductStarNum",
                table: "Product",
                column: "ProductStarNum");

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductType",
                table: "Product",
                column: "ProductType");

            migrationBuilder.CreateIndex(
                name: "IX_Product_ShopID",
                table: "Product",
                column: "ShopID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductID",
                table: "Product",
                column: "ProductID",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ProductCart_ProductID",
                table: "ProductCart",
                column: "ProductID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductCart_UserID",
                table: "ProductCart",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductComment_CommentStarNum",
                table: "ProductComment",
                column: "CommentStarNum");

            migrationBuilder.CreateIndex(
                name: "IX_ProductComment_ProductID",
                table: "ProductComment",
                column: "ProductID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductComment_UserID",
                table: "ProductComment",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductCommentReply_CommentID",
                table: "ProductCommentReply",
                column: "CommentID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductImage_ProductID",
                table: "ProductImage",
                column: "ProductID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductImage_ShopID",
                table: "ProductImage",
                column: "ShopID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductOrder_OrderAddressId",
                table: "ProductOrder",
                column: "OrderAddressId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductOrder_UserID",
                table: "ProductOrder",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductOrderDetail_OrderNo",
                table: "ProductOrderDetail",
                column: "OrderNo");

            migrationBuilder.CreateIndex(
                name: "IX_ProductOrderDetail_ProductID",
                table: "ProductOrderDetail",
                column: "ProductID");

            migrationBuilder.CreateIndex(
                name: "IX_ProductOrderLogistics_DetailID",
                table: "ProductOrderLogistics",
                column: "DetailID");

            migrationBuilder.CreateIndex(
                name: "IX_Shop_ShopStarNum",
                table: "Shop",
                column: "ShopStarNum");

            migrationBuilder.CreateIndex(
                name: "IX_Shop_ShopType",
                table: "Shop",
                column: "ShopType");

            migrationBuilder.CreateIndex(
                name: "IX_ShopID",
                table: "Shop",
                column: "ID",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ShopImage_ProductID",
                table: "ShopImage",
                column: "ProductID");

            migrationBuilder.CreateIndex(
                name: "IX_ShopImage_ShopID",
                table: "ShopImage",
                column: "ShopID");

            migrationBuilder.CreateIndex(
                name: "IX_UserAddress_UserID",
                table: "UserAddress",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_UserImageList_UserID",
                table: "UserImageList",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_UserLike_ProductID",
                table: "UserLike",
                column: "ProductID");

            migrationBuilder.CreateIndex(
                name: "IX_UserLike_ShopID",
                table: "UserLike",
                column: "ShopID");

            migrationBuilder.CreateIndex(
                name: "IX_UserLike_UserID",
                table: "UserLike",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_UserLookProduct_PoductID",
                table: "UserLookProduct",
                column: "PoductID");

            migrationBuilder.CreateIndex(
                name: "IX_UserLookProduct_UserID",
                table: "UserLookProduct",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_UserSearch_UserID",
                table: "UserSearch",
                column: "UserID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BannerImage");

            migrationBuilder.DropTable(
                name: "ProductCart");

            migrationBuilder.DropTable(
                name: "ProductCollect");

            migrationBuilder.DropTable(
                name: "ProductCommentImage");

            migrationBuilder.DropTable(
                name: "ProductCommentLike");

            migrationBuilder.DropTable(
                name: "ProductCommentReply");

            migrationBuilder.DropTable(
                name: "ProductImage");

            migrationBuilder.DropTable(
                name: "ProductOrderLogistics");

            migrationBuilder.DropTable(
                name: "ProductStars");

            migrationBuilder.DropTable(
                name: "ShopImage");

            migrationBuilder.DropTable(
                name: "TitleList");

            migrationBuilder.DropTable(
                name: "UserImageList");

            migrationBuilder.DropTable(
                name: "UserLike");

            migrationBuilder.DropTable(
                name: "UserLoginLog");

            migrationBuilder.DropTable(
                name: "UserLookProduct");

            migrationBuilder.DropTable(
                name: "UserSearch");

            migrationBuilder.DropTable(
                name: "ProductComment");

            migrationBuilder.DropTable(
                name: "ProductOrderDetail");

            migrationBuilder.DropTable(
                name: "Product");

            migrationBuilder.DropTable(
                name: "ProductOrder");

            migrationBuilder.DropTable(
                name: "Shop");

            migrationBuilder.DropTable(
                name: "UserAddress");

            migrationBuilder.DropTable(
                name: "ShopProductStarRating");

            migrationBuilder.DropTable(
                name: "ShopProductTypes");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
