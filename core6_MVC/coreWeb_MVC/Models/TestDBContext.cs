using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace coreWeb_MVC.Models
{
    public partial class TestDBContext : DbContext
    {
        public TestDBContext()
        {
        }

        public TestDBContext(DbContextOptions<TestDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<BannerImage> BannerImages { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<ProductCart> ProductCarts { get; set; } = null!;
        public virtual DbSet<ProductCollect> ProductCollects { get; set; } = null!;
        public virtual DbSet<ProductComment> ProductComments { get; set; } = null!;
        public virtual DbSet<ProductCommentImage> ProductCommentImages { get; set; } = null!;
        public virtual DbSet<ProductCommentLike> ProductCommentLikes { get; set; } = null!;
        public virtual DbSet<ProductCommentReply> ProductCommentReplies { get; set; } = null!;
        public virtual DbSet<ProductImage> ProductImages { get; set; } = null!;
        public virtual DbSet<ProductOrder> ProductOrders { get; set; } = null!;
        public virtual DbSet<ProductOrderDetail> ProductOrderDetails { get; set; } = null!;
        public virtual DbSet<ProductOrderLogistic> ProductOrderLogistics { get; set; } = null!;
        public virtual DbSet<ProductStar> ProductStars { get; set; } = null!;
        public virtual DbSet<Shop> Shops { get; set; } = null!;
        public virtual DbSet<ShopImage> ShopImages { get; set; } = null!;
        public virtual DbSet<ShopProductStarRating> ShopProductStarRatings { get; set; } = null!;
        public virtual DbSet<ShopProductType> ShopProductTypes { get; set; } = null!;
        public virtual DbSet<SupProductdetailView> SupProductdetailViews { get; set; } = null!;
        public virtual DbSet<SupShopdetailView> SupShopdetailViews { get; set; } = null!;
        public virtual DbSet<SupUserCommentView> SupUserCommentViews { get; set; } = null!;
        public virtual DbSet<SupUserLikeProductView> SupUserLikeProductViews { get; set; } = null!;
        public virtual DbSet<SupUserLikeShopView> SupUserLikeShopViews { get; set; } = null!;
        public virtual DbSet<SupUserOrderLogisticView> SupUserOrderLogisticViews { get; set; } = null!;
        public virtual DbSet<SupUserOrderdetailView> SupUserOrderdetailViews { get; set; } = null!;
        public virtual DbSet<SupUserProductCartView> SupUserProductCartViews { get; set; } = null!;
        public virtual DbSet<SuperProductView> SuperProductViews { get; set; } = null!;
        public virtual DbSet<TitleList> TitleLists { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserAddress> UserAddresses { get; set; } = null!;
        public virtual DbSet<UserImageList> UserImageLists { get; set; } = null!;
        public virtual DbSet<UserLike> UserLikes { get; set; } = null!;
        public virtual DbSet<UserLoginLog> UserLoginLogs { get; set; } = null!;
        public virtual DbSet<UserLookProduct> UserLookProducts { get; set; } = null!;
        public virtual DbSet<UserSearch> UserSearches { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BannerImage>(entity =>
            {
                entity.HasKey(e => e.BannerID);

                entity.ToTable("BannerImage");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Path).HasMaxLength(1000);

                entity.Property(e => e.Paths).HasMaxLength(1000);

                entity.Property(e => e.Text_1).HasMaxLength(500);

                entity.Property(e => e.Text_2).HasMaxLength(500);

                entity.Property(e => e.Text_3).HasMaxLength(500);

                entity.Property(e => e.Title).HasMaxLength(150);

                entity.Property(e => e.TitleDesc).HasMaxLength(300);

                entity.Property(e => e.TitleDescs).HasMaxLength(500);

                entity.Property(e => e.Type).HasMaxLength(50);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.ProductID)
                    .HasName("PK_Shop");

                entity.ToTable("Product");

                entity.HasIndex(e => e.ProductID, "IX_ProductID")
                    .IsUnique();

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ActivityPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ID).ValueGeneratedOnAdd();

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductIntroduce).HasMaxLength(500);

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.Property(e => e.ProductNum).HasDefaultValueSql("((0))");

                entity.Property(e => e.ProductStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.discount).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.discountType).HasDefaultValueSql("((0))");

                entity.HasOne(d => d.ProductStarNumNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.ProductStarNum)
                    .HasConstraintName("FK_Product_ProductStarRating");

                entity.HasOne(d => d.ProductTypeNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.ProductType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_ShopProductTypes");

                entity.HasOne(d => d.Shop)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.ShopID)
                    .HasConstraintName("FK_Shop_Product");
            });

            modelBuilder.Entity<ProductCart>(entity =>
            {
                entity.HasKey(e => e.CartID)
                    .HasName("PK_ShopCar");

                entity.ToTable("ProductCart");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CartType).HasDefaultValueSql("((1))");

                entity.Property(e => e.ProductCartNum).HasDefaultValueSql("((1))");

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ProductPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductCarts)
                    .HasForeignKey(d => d.ProductID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductCart_Product");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ProductCarts)
                    .HasForeignKey(d => d.UserID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductCart_Users");
            });

            modelBuilder.Entity<ProductCollect>(entity =>
            {
                entity.HasKey(e => e.CollectID)
                    .HasName("PK_ShopCollect");

                entity.ToTable("ProductCollect");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ProductID).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.UserID).HasMaxLength(50);
            });

            modelBuilder.Entity<ProductComment>(entity =>
            {
                entity.HasKey(e => e.CommentID)
                    .HasName("PK_ShopComment");

                entity.ToTable("ProductComment");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CommentStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.CommentState).HasDefaultValueSql("((1))");

                entity.Property(e => e.CommentTxt).HasColumnType("text");

                entity.Property(e => e.CommentType).HasDefaultValueSql("((1))");

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.HasOne(d => d.CommentStarNumNavigation)
                    .WithMany(p => p.ProductComments)
                    .HasForeignKey(d => d.CommentStarNum)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductComment_ShopProductStarRating");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductComments)
                    .HasForeignKey(d => d.ProductID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductComment_Product");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ProductComments)
                    .HasForeignKey(d => d.UserID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductComment_Users");
            });

            modelBuilder.Entity<ProductCommentImage>(entity =>
            {
                entity.HasKey(e => e.ComImgID);

                entity.ToTable("ProductCommentImage");

                entity.Property(e => e.ComImgID).ValueGeneratedOnAdd();

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ComImgPath).HasMaxLength(1000);

                entity.Property(e => e.ComImgSize).HasMaxLength(50);

                entity.Property(e => e.ComState).HasDefaultValueSql("((1))");

                entity.Property(e => e.UserID).HasMaxLength(50);

                entity.HasOne(d => d.ComImg)
                    .WithOne(p => p.ProductCommentImage)
                    .HasForeignKey<ProductCommentImage>(d => d.ComImgID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductCommentImage_ProductComment");
            });

            modelBuilder.Entity<ProductCommentLike>(entity =>
            {
                entity.HasKey(e => e.LikeID);

                entity.ToTable("ProductCommentLike");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.UserID).HasMaxLength(100);
            });

            modelBuilder.Entity<ProductCommentReply>(entity =>
            {
                entity.HasKey(e => e.CommreplyID);

                entity.ToTable("ProductCommentReply");

                entity.Property(e => e.ComText).HasMaxLength(500);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.Property(e => e.addDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.toUserID).HasMaxLength(100);

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.ProductCommentReplies)
                    .HasForeignKey(d => d.CommentID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductCommentReply_ProductComment");
            });

            modelBuilder.Entity<ProductImage>(entity =>
            {
                entity.HasKey(e => e.ImgID);

                entity.ToTable("ProductImage");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ImgName).HasMaxLength(50);

                entity.Property(e => e.ImgPath).HasMaxLength(1000);

                entity.Property(e => e.ImgSize).HasMaxLength(50);

                entity.Property(e => e.ImgState).HasDefaultValueSql("((1))");

                entity.Property(e => e.ImgType).HasMaxLength(20);

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductImages)
                    .HasForeignKey(d => d.ProductID)
                    .HasConstraintName("FK_ProductImage_Product");

                entity.HasOne(d => d.Shop)
                    .WithMany(p => p.ProductImages)
                    .HasForeignKey(d => d.ShopID)
                    .HasConstraintName("FK_ProductImage_Shop");
            });

            modelBuilder.Entity<ProductOrder>(entity =>
            {
                entity.HasKey(e => e.OrderNo)
                    .HasName("PK_ShopOrder");

                entity.ToTable("ProductOrder");

                entity.Property(e => e.OrderNo).HasMaxLength(100);

                entity.Property(e => e.OrderAmountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.OrderDiscountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderID).ValueGeneratedOnAdd();

                entity.Property(e => e.OrderName).HasMaxLength(50);

                entity.Property(e => e.OrderState).HasDefaultValueSql("((1))");

                entity.Property(e => e.OrderSumPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderType).HasDefaultValueSql("((1))");

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.HasOne(d => d.OrderAddress)
                    .WithMany(p => p.ProductOrders)
                    .HasForeignKey(d => d.OrderAddressId)
                    .HasConstraintName("FK_ProductOrder_ProductOrder");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ProductOrders)
                    .HasForeignKey(d => d.UserID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductOrder_Users");
            });

            modelBuilder.Entity<ProductOrderDetail>(entity =>
            {
                entity.HasKey(e => e.DetailID)
                    .HasName("PK_ShopOrderDetail");

                entity.ToTable("ProductOrderDetail");

                entity.Property(e => e.DiscountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderDetailState).HasDefaultValueSql("((1))");

                entity.Property(e => e.OrderNo).HasMaxLength(100);

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ProductPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.HasOne(d => d.OrderNoNavigation)
                    .WithMany(p => p.ProductOrderDetails)
                    .HasForeignKey(d => d.OrderNo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductOrderDetail_ProductOrder");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductOrderDetails)
                    .HasForeignKey(d => d.ProductID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductOrderDetail_Product");
            });

            modelBuilder.Entity<ProductOrderLogistic>(entity =>
            {
                entity.HasKey(e => e.LogisticsID)
                    .HasName("PK_ProductPorderLogistics");

                entity.Property(e => e.LogisticsID).ValueGeneratedNever();

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ExpressCompany).HasMaxLength(100);

                entity.Property(e => e.ExpressDesc).HasMaxLength(500);

                entity.Property(e => e.ExpressID).HasMaxLength(200);

                entity.HasOne(d => d.Detail)
                    .WithMany(p => p.ProductOrderLogistics)
                    .HasForeignKey(d => d.DetailID)
                    .HasConstraintName("FK_ProductOrderLogistics_ProductOrderDetail");
            });

            modelBuilder.Entity<ProductStar>(entity =>
            {
                entity.HasKey(e => e.StarID);

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.StarDesc).HasMaxLength(200);

                entity.Property(e => e.StarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.StarTxt).HasMaxLength(20);
            });

            modelBuilder.Entity<Shop>(entity =>
            {
                entity.HasKey(e => e.ShopID)
                    .HasName("PK_Shop_1");

                entity.ToTable("Shop");

                entity.HasIndex(e => e.ID, "IX_ShopID")
                    .IsUnique();

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ID).ValueGeneratedOnAdd();

                entity.Property(e => e.ShopAddress).HasMaxLength(500);

                entity.Property(e => e.ShopBoss).HasMaxLength(50);

                entity.Property(e => e.ShopIntroduce).HasMaxLength(500);

                entity.Property(e => e.ShopMobile).HasMaxLength(11);

                entity.Property(e => e.ShopName).HasMaxLength(200);

                entity.Property(e => e.ShopOpenTime).HasMaxLength(200);

                entity.Property(e => e.ShopStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ShopState).HasDefaultValueSql("((1))");

                entity.Property(e => e.ShopType).HasDefaultValueSql("((101))");

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.HasOne(d => d.ShopStarNumNavigation)
                    .WithMany(p => p.Shops)
                    .HasForeignKey(d => d.ShopStarNum)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Shop_ProductStarRating");

                entity.HasOne(d => d.ShopTypeNavigation)
                    .WithMany(p => p.Shops)
                    .HasForeignKey(d => d.ShopType)
                    .HasConstraintName("FK_Shop_ShopProductTypes");
            });

            modelBuilder.Entity<ShopImage>(entity =>
            {
                entity.HasKey(e => e.ImgID);

                entity.ToTable("ShopImage");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ImgName).HasMaxLength(50);

                entity.Property(e => e.ImgPath).HasMaxLength(1000);

                entity.Property(e => e.ImgSize).HasMaxLength(50);

                entity.Property(e => e.ImgType).HasMaxLength(20);

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.UserID).HasMaxLength(50);

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ShopImages)
                    .HasForeignKey(d => d.ProductID)
                    .HasConstraintName("FK_ShopImage_Product");

                entity.HasOne(d => d.Shop)
                    .WithMany(p => p.ShopImages)
                    .HasForeignKey(d => d.ShopID)
                    .HasConstraintName("FK_ShopImage_Shop");
            });

            modelBuilder.Entity<ShopProductStarRating>(entity =>
            {
                entity.HasKey(e => e.StarNum)
                    .HasName("PK_ProductStarRating");

                entity.ToTable("ShopProductStarRating");

                entity.Property(e => e.StarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.Star1).HasMaxLength(200);

                entity.Property(e => e.Star2).HasMaxLength(200);

                entity.Property(e => e.Star3).HasMaxLength(200);

                entity.Property(e => e.Star4).HasMaxLength(200);

                entity.Property(e => e.Star5).HasMaxLength(200);

                entity.Property(e => e.StarDesc).HasMaxLength(50);
            });

            modelBuilder.Entity<ShopProductType>(entity =>
            {
                entity.HasKey(e => e.ProductType)
                    .HasName("PK_ShopTypes");

                entity.Property(e => e.ProductType).ValueGeneratedNever();

                entity.Property(e => e.ProductDesc).HasMaxLength(50);

                entity.Property(e => e.ProductTypeName).HasMaxLength(50);

                entity.Property(e => e.TypeName).HasMaxLength(20);
            });

            modelBuilder.Entity<SupProductdetailView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SupProductdetailView");

                entity.Property(e => e.ActivityPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.ImgAddDate).HasColumnType("datetime");

                entity.Property(e => e.ImgName).HasMaxLength(50);

                entity.Property(e => e.ImgPath).HasMaxLength(1000);

                entity.Property(e => e.ImgSize).HasMaxLength(50);

                entity.Property(e => e.ImgType).HasMaxLength(20);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductDesc).HasMaxLength(50);

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ProductIntroduce).HasMaxLength(500);

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.Property(e => e.ProductStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ProductTypeName).HasMaxLength(50);

                entity.Property(e => e.ShopAddDate).HasColumnType("datetime");

                entity.Property(e => e.ShopAddress).HasMaxLength(500);

                entity.Property(e => e.ShopBoss).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.ShopIntroduce).HasMaxLength(500);

                entity.Property(e => e.ShopMobile).HasMaxLength(11);

                entity.Property(e => e.ShopName).HasMaxLength(200);

                entity.Property(e => e.ShopOpenTime).HasMaxLength(200);

                entity.Property(e => e.ShopStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.Star1).HasMaxLength(200);

                entity.Property(e => e.Star2).HasMaxLength(200);

                entity.Property(e => e.Star3).HasMaxLength(200);

                entity.Property(e => e.Star4).HasMaxLength(200);

                entity.Property(e => e.Star5).HasMaxLength(200);

                entity.Property(e => e.StarDesc).HasMaxLength(50);

                entity.Property(e => e.StarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.TypeName).HasMaxLength(20);

                entity.Property(e => e.discount).HasColumnType("decimal(5, 2)");
            });

            modelBuilder.Entity<SupShopdetailView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SupShopdetailView");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.ImgAddDate).HasColumnType("datetime");

                entity.Property(e => e.ImgName).HasMaxLength(50);

                entity.Property(e => e.ImgPath).HasMaxLength(1000);

                entity.Property(e => e.ImgSize).HasMaxLength(50);

                entity.Property(e => e.ImgType).HasMaxLength(20);

                entity.Property(e => e.ProductDesc).HasMaxLength(50);

                entity.Property(e => e.ProductTypeName).HasMaxLength(50);

                entity.Property(e => e.ShopAddress).HasMaxLength(500);

                entity.Property(e => e.ShopBoss).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.ShopIntroduce).HasMaxLength(500);

                entity.Property(e => e.ShopMobile).HasMaxLength(11);

                entity.Property(e => e.ShopName).HasMaxLength(200);

                entity.Property(e => e.ShopOpenTime).HasMaxLength(200);

                entity.Property(e => e.ShopStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.Star1).HasMaxLength(200);

                entity.Property(e => e.Star2).HasMaxLength(200);

                entity.Property(e => e.Star3).HasMaxLength(200);

                entity.Property(e => e.Star4).HasMaxLength(200);

                entity.Property(e => e.Star5).HasMaxLength(200);

                entity.Property(e => e.StarDesc).HasMaxLength(50);

                entity.Property(e => e.StarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.TypeName).HasMaxLength(20);
            });

            modelBuilder.Entity<SupUserCommentView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SupUserCommentView");

                entity.Property(e => e.Account).HasMaxLength(50);

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.ComImgPath).HasMaxLength(1000);

                entity.Property(e => e.ComImgSize).HasMaxLength(50);

                entity.Property(e => e.CommentStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.CommentTxt).HasColumnType("text");

                entity.Property(e => e.ImgID).HasMaxLength(100);

                entity.Property(e => e.ImgSize).HasMaxLength(200);

                entity.Property(e => e.Introduce).HasMaxLength(200);

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.Sex)
                    .HasMaxLength(4)
                    .IsFixedLength();

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.Star1).HasMaxLength(200);

                entity.Property(e => e.Star2).HasMaxLength(200);

                entity.Property(e => e.Star3).HasMaxLength(200);

                entity.Property(e => e.Star4).HasMaxLength(200);

                entity.Property(e => e.Star5).HasMaxLength(200);

                entity.Property(e => e.StarDesc).HasMaxLength(50);

                entity.Property(e => e.StarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.Property(e => e.UserImagePath).HasMaxLength(1000);

                entity.Property(e => e.UserName).HasMaxLength(50);
            });

            modelBuilder.Entity<SupUserLikeProductView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SupUserLikeProductView");

                entity.Property(e => e.ActivityPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.ImgPath1).HasMaxLength(1000);

                entity.Property(e => e.ImgPath2).HasMaxLength(1000);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductDesc).HasMaxLength(50);

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ProductIntroduce).HasMaxLength(500);

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.Property(e => e.ProductStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ProductTypeName).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.Star1).HasMaxLength(200);

                entity.Property(e => e.Star2).HasMaxLength(200);

                entity.Property(e => e.Star3).HasMaxLength(200);

                entity.Property(e => e.Star4).HasMaxLength(200);

                entity.Property(e => e.Star5).HasMaxLength(200);

                entity.Property(e => e.StarDesc).HasMaxLength(50);

                entity.Property(e => e.StarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.TypeName).HasMaxLength(20);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.Property(e => e.discount).HasColumnType("decimal(5, 2)");
            });

            modelBuilder.Entity<SupUserLikeShopView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SupUserLikeShopView");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.ImgPath1).HasMaxLength(1000);

                entity.Property(e => e.ImgPath2).HasMaxLength(1000);

                entity.Property(e => e.ProductDesc).HasMaxLength(50);

                entity.Property(e => e.ProductTypeName).HasMaxLength(50);

                entity.Property(e => e.ShopAddress).HasMaxLength(500);

                entity.Property(e => e.ShopBoss).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.ShopIntroduce).HasMaxLength(500);

                entity.Property(e => e.ShopMobile).HasMaxLength(11);

                entity.Property(e => e.ShopName).HasMaxLength(200);

                entity.Property(e => e.ShopOpenTime).HasMaxLength(200);

                entity.Property(e => e.ShopStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.Star1).HasMaxLength(200);

                entity.Property(e => e.Star2).HasMaxLength(200);

                entity.Property(e => e.Star3).HasMaxLength(200);

                entity.Property(e => e.Star4).HasMaxLength(200);

                entity.Property(e => e.Star5).HasMaxLength(200);

                entity.Property(e => e.StarDesc).HasMaxLength(50);

                entity.Property(e => e.StarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.TypeName).HasMaxLength(20);

                entity.Property(e => e.UserID).HasMaxLength(100);
            });

            modelBuilder.Entity<SupUserOrderLogisticView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SupUserOrderLogisticView");

                entity.Property(e => e.ActivityPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.Area).HasMaxLength(50);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.DetailAddress).HasMaxLength(100);

                entity.Property(e => e.DiscountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ExpressCompany).HasMaxLength(100);

                entity.Property(e => e.ExpressDesc).HasMaxLength(500);

                entity.Property(e => e.ExpressID).HasMaxLength(200);

                entity.Property(e => e.Mobile).HasMaxLength(11);

                entity.Property(e => e.OrderAmountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderDate).HasColumnType("datetime");

                entity.Property(e => e.OrderDiscountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderName).HasMaxLength(50);

                entity.Property(e => e.OrderNo).HasMaxLength(100);

                entity.Property(e => e.OrderSumPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Other).HasMaxLength(200);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ProductIntroduce).HasMaxLength(500);

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.Property(e => e.ProductPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.Province).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.Town).HasMaxLength(50);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.Property(e => e.UserName).HasMaxLength(50);

                entity.Property(e => e.discount).HasColumnType("decimal(5, 2)");
            });

            modelBuilder.Entity<SupUserOrderdetailView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SupUserOrderdetailView");

                entity.Property(e => e.ActivityPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.Area).HasMaxLength(50);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.DetailAddress).HasMaxLength(100);

                entity.Property(e => e.DiscountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ImgPath1).HasMaxLength(1000);

                entity.Property(e => e.ImgPath2).HasMaxLength(1000);

                entity.Property(e => e.Mobile).HasMaxLength(11);

                entity.Property(e => e.OrderAmountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderDate).HasColumnType("datetime");

                entity.Property(e => e.OrderDiscountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderName).HasMaxLength(50);

                entity.Property(e => e.OrderNo).HasMaxLength(100);

                entity.Property(e => e.OrderSumPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Other).HasMaxLength(200);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductDesc).HasMaxLength(50);

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ProductIntroduce).HasMaxLength(500);

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.Property(e => e.ProductPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ProductTypeName).HasMaxLength(50);

                entity.Property(e => e.Province).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.Town).HasMaxLength(50);

                entity.Property(e => e.TypeName).HasMaxLength(20);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.Property(e => e.UserName).HasMaxLength(50);

                entity.Property(e => e.discount).HasColumnType("decimal(5, 2)");
            });

            modelBuilder.Entity<SupUserProductCartView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SupUserProductCartView");

                entity.Property(e => e.ActivityPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.ImgPath1).HasMaxLength(1000);

                entity.Property(e => e.ImgPath2).HasMaxLength(1000);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductID).HasMaxLength(50);

                entity.Property(e => e.ProductIntroduce).HasMaxLength(500);

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.Property(e => e.ProductPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.Property(e => e.discount).HasColumnType("decimal(5, 2)");
            });

            modelBuilder.Entity<SuperProductView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SuperProductView");

                entity.Property(e => e.ActivityPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.ImgPath1).HasMaxLength(1000);

                entity.Property(e => e.ImgPath2).HasMaxLength(1000);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductDesc).HasMaxLength(50);

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ProductIntroduce).HasMaxLength(500);

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.Property(e => e.ProductStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ProductTypeName).HasMaxLength(50);

                entity.Property(e => e.ShopAddress).HasMaxLength(500);

                entity.Property(e => e.ShopBoss).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.ShopIntroduce).HasMaxLength(500);

                entity.Property(e => e.ShopMobile).HasMaxLength(11);

                entity.Property(e => e.ShopName).HasMaxLength(200);

                entity.Property(e => e.ShopOpenTime).HasMaxLength(200);

                entity.Property(e => e.ShopStarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.Star1).HasMaxLength(200);

                entity.Property(e => e.Star2).HasMaxLength(200);

                entity.Property(e => e.Star3).HasMaxLength(200);

                entity.Property(e => e.Star4).HasMaxLength(200);

                entity.Property(e => e.Star5).HasMaxLength(200);

                entity.Property(e => e.StarDesc).HasMaxLength(50);

                entity.Property(e => e.StarNum).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.TypeName).HasMaxLength(20);

                entity.Property(e => e.discount).HasColumnType("decimal(5, 2)");
            });

            modelBuilder.Entity<TitleList>(entity =>
            {
                entity.HasKey(e => e.TitleID);

                entity.ToTable("TitleList");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Title).HasMaxLength(50);

                entity.Property(e => e.TitleClass).HasMaxLength(50);

                entity.Property(e => e.TitleClass1).HasMaxLength(50);

                entity.Property(e => e.TitleClass2).HasMaxLength(50);

                entity.Property(e => e.TitleClass3).HasMaxLength(50);

                entity.Property(e => e.TitleDesc).HasMaxLength(250);

                entity.Property(e => e.TitleUrl).HasMaxLength(500);

                entity.Property(e => e.Titleothername).HasMaxLength(50);

                entity.Property(e => e.about).HasMaxLength(50);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.Property(e => e.Account).HasMaxLength(50);

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Address).HasMaxLength(50);

                entity.Property(e => e.Introduce).HasMaxLength(200);

                entity.Property(e => e.Password).HasMaxLength(1000);

                entity.Property(e => e.Sex)
                    .HasMaxLength(4)
                    .IsFixedLength();

                entity.Property(e => e.UserEmail).HasMaxLength(50);

                entity.Property(e => e.UserName).HasMaxLength(50);

                entity.Property(e => e.UserState).HasDefaultValueSql("((1))");

                entity.Property(e => e.UserType).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<UserAddress>(entity =>
            {
                entity.HasKey(e => e.AddressID)
                    .HasName("PK_Address");

                entity.ToTable("UserAddress");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Area).HasMaxLength(50);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.DetailAddress).HasMaxLength(100);

                entity.Property(e => e.Mobile).HasMaxLength(11);

                entity.Property(e => e.Other).HasMaxLength(200);

                entity.Property(e => e.Province).HasMaxLength(50);

                entity.Property(e => e.State).HasDefaultValueSql("((1))");

                entity.Property(e => e.Town).HasMaxLength(50);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.Property(e => e.UserName).HasMaxLength(50);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserAddresses)
                    .HasForeignKey(d => d.UserID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAddress_UserAddress");
            });

            modelBuilder.Entity<UserImageList>(entity =>
            {
                entity.HasKey(e => e.ImgID)
                    .HasName("PK_UserImage");

                entity.ToTable("UserImageList");

                entity.Property(e => e.ImgID).HasMaxLength(100);

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ImgSize).HasMaxLength(200);

                entity.Property(e => e.ImgState).HasDefaultValueSql("((1))");

                entity.Property(e => e.ImgType).HasDefaultValueSql("((1))");

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.Property(e => e.UserImagePath).HasMaxLength(1000);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserImageLists)
                    .HasForeignKey(d => d.UserID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserImageList_Users");
            });

            modelBuilder.Entity<UserLike>(entity =>
            {
                entity.HasKey(e => e.LikeID);

                entity.ToTable("UserLike");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LikeType).HasDefaultValueSql("((1))");

                entity.Property(e => e.ProductID).HasMaxLength(100);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.UserLikes)
                    .HasForeignKey(d => d.ProductID)
                    .HasConstraintName("FK_UserLike_Product");

                entity.HasOne(d => d.Shop)
                    .WithMany(p => p.UserLikes)
                    .HasForeignKey(d => d.ShopID)
                    .HasConstraintName("FK_UserLike_Shop");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserLikes)
                    .HasForeignKey(d => d.UserID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserLike_Users");
            });

            modelBuilder.Entity<UserLoginLog>(entity =>
            {
                entity.HasKey(e => e.LogID);

                entity.ToTable("UserLoginLog");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LoginIP).HasMaxLength(250);

                entity.Property(e => e.LoginVpnIP1).HasMaxLength(250);

                entity.Property(e => e.LoginVpnIP2).HasMaxLength(250);

                entity.Property(e => e.LoginVpnIP3).HasMaxLength(250);

                entity.Property(e => e.UserID).HasMaxLength(100);
            });

            modelBuilder.Entity<UserLookProduct>(entity =>
            {
                entity.HasKey(e => e.LookID);

                entity.ToTable("UserLookProduct");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.PoductID).HasMaxLength(100);

                entity.Property(e => e.ShopID).HasMaxLength(100);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.HasOne(d => d.Poduct)
                    .WithMany(p => p.UserLookProducts)
                    .HasForeignKey(d => d.PoductID)
                    .HasConstraintName("FK_UserLookProduct_Product");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserLookProducts)
                    .HasForeignKey(d => d.UserID)
                    .HasConstraintName("FK_UserLookProduct_Users");
            });

            modelBuilder.Entity<UserSearch>(entity =>
            {
                entity.HasKey(e => e.searchID);

                entity.ToTable("UserSearch");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.SearchName).HasMaxLength(250);

                entity.Property(e => e.UserID).HasMaxLength(100);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserSearches)
                    .HasForeignKey(d => d.UserID)
                    .HasConstraintName("FK_UserSearch_Users");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
