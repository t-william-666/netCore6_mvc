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

        public virtual DbSet<Address> Addresses { get; set; } = null!;
        public virtual DbSet<BannerImage> BannerImages { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<ProductImage> ProductImages { get; set; } = null!;
        public virtual DbSet<ProductStar> ProductStars { get; set; } = null!;
        public virtual DbSet<ProductStarRating> ProductStarRatings { get; set; } = null!;
        public virtual DbSet<ProductType> ProductTypes { get; set; } = null!;
        public virtual DbSet<Shop> Shops { get; set; } = null!;
        public virtual DbSet<ShopCar> ShopCars { get; set; } = null!;
        public virtual DbSet<ShopCollect> ShopCollects { get; set; } = null!;
        public virtual DbSet<ShopComment> ShopComments { get; set; } = null!;
        public virtual DbSet<ShopCommentLike> ShopCommentLikes { get; set; } = null!;
        public virtual DbSet<ShopImage> ShopImages { get; set; } = null!;
        public virtual DbSet<ShopOrder> ShopOrders { get; set; } = null!;
        public virtual DbSet<ShopOrderDetail> ShopOrderDetails { get; set; } = null!;
        public virtual DbSet<SuperProductView> SuperProductViews { get; set; } = null!;
        public virtual DbSet<TitleList> TitleLists { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserLoginLog> UserLoginLogs { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Address>(entity =>
            {
                entity.ToTable("Address");

                entity.Property(e => e.Area).HasMaxLength(50);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.DetailAddress).HasMaxLength(100);

                entity.Property(e => e.Mobile).HasMaxLength(11);

                entity.Property(e => e.Other).HasMaxLength(200);

                entity.Property(e => e.Province).HasMaxLength(50);

                entity.Property(e => e.Town).HasMaxLength(50);

                entity.Property(e => e.UserID).HasMaxLength(13);

                entity.Property(e => e.UserName).HasMaxLength(50);
            });

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

                entity.Property(e => e.ProductID).HasMaxLength(50);

                entity.Property(e => e.ActivityPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ID).ValueGeneratedOnAdd();

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductIntroduce).HasMaxLength(500);

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.Property(e => e.ProductNum).HasDefaultValueSql("((0))");

                entity.Property(e => e.ProductStarNum).HasMaxLength(20);

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.discount).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.discountType).HasDefaultValueSql("((0))");

                entity.HasOne(d => d.ProductStarNumNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.ProductStarNum)
                    .HasConstraintName("FK_Product_ProductStarRating");

                entity.HasOne(d => d.Shop)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.ShopID)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_Shop_Product");
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

                entity.Property(e => e.ImgType).HasMaxLength(20);

                entity.Property(e => e.ProductID).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(50);
            });

            modelBuilder.Entity<ProductStar>(entity =>
            {
                entity.HasKey(e => e.StarID);

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.StarDesc).HasMaxLength(200);

                entity.Property(e => e.StarNum).HasMaxLength(50);

                entity.Property(e => e.StarTxt).HasMaxLength(20);
            });

            modelBuilder.Entity<ProductStarRating>(entity =>
            {
                entity.HasKey(e => e.StarNum);

                entity.ToTable("ProductStarRating");

                entity.Property(e => e.StarNum).HasMaxLength(20);

                entity.Property(e => e.Star1).HasMaxLength(200);

                entity.Property(e => e.Star2).HasMaxLength(200);

                entity.Property(e => e.Star3).HasMaxLength(200);

                entity.Property(e => e.Star4).HasMaxLength(200);

                entity.Property(e => e.Star5).HasMaxLength(200);

                entity.Property(e => e.StarDesc).HasMaxLength(50);
            });

            modelBuilder.Entity<ProductType>(entity =>
            {
                entity.HasKey(e => e.ProductType1)
                    .HasName("PK_ShopTypes");

                entity.Property(e => e.ProductType1)
                    .ValueGeneratedNever()
                    .HasColumnName("ProductType");

                entity.Property(e => e.ProductDesc).HasMaxLength(50);

                entity.Property(e => e.ProductTypeName).HasMaxLength(50);

                entity.Property(e => e.TypeName).HasMaxLength(20);
            });

            modelBuilder.Entity<Shop>(entity =>
            {
                entity.HasKey(e => e.ShopID)
                    .HasName("PK_Shop_1");

                entity.ToTable("Shop");

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.AddDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ID).ValueGeneratedOnAdd();

                entity.Property(e => e.ShopAddress).HasMaxLength(500);

                entity.Property(e => e.ShopBoss).HasMaxLength(50);

                entity.Property(e => e.ShopIntroduce).HasMaxLength(500);

                entity.Property(e => e.ShopMobile).HasMaxLength(11);

                entity.Property(e => e.ShopName).HasMaxLength(200);

                entity.Property(e => e.ShopStars).HasMaxLength(10);

                entity.Property(e => e.ShopType).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<ShopCar>(entity =>
            {
                entity.HasKey(e => e.CarID);

                entity.ToTable("ShopCar");

                entity.Property(e => e.CarType).HasDefaultValueSql("((1))");

                entity.Property(e => e.ProductID).HasMaxLength(50);

                entity.Property(e => e.ProductNum).HasDefaultValueSql("((1))");

                entity.Property(e => e.ProductPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UserID).HasMaxLength(50);
            });

            modelBuilder.Entity<ShopCollect>(entity =>
            {
                entity.HasKey(e => e.CollectID);

                entity.ToTable("ShopCollect");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.ProductID).HasMaxLength(50);

                entity.Property(e => e.UserID).HasMaxLength(50);
            });

            modelBuilder.Entity<ShopComment>(entity =>
            {
                entity.HasKey(e => e.CommentID);

                entity.ToTable("ShopComment");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.CommentStars).HasMaxLength(10);

                entity.Property(e => e.CommentTxt).HasColumnType("text");

                entity.Property(e => e.CommentType).HasDefaultValueSql("((1))");

                entity.Property(e => e.ProductID).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.UserID).HasMaxLength(50);
            });

            modelBuilder.Entity<ShopCommentLike>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("ShopCommentLike");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.CommentID).HasMaxLength(50);

                entity.Property(e => e.UserID).HasMaxLength(50);
            });

            modelBuilder.Entity<ShopImage>(entity =>
            {
                entity.HasKey(e => e.ImgID);

                entity.ToTable("ShopImage");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.ImgName).HasMaxLength(50);

                entity.Property(e => e.ImgPath).HasMaxLength(1000);

                entity.Property(e => e.ImgSize).HasMaxLength(50);

                entity.Property(e => e.ImgType).HasMaxLength(20);

                entity.Property(e => e.ProductID).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.UserID).HasMaxLength(50);

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ShopImages)
                    .HasForeignKey(d => d.ProductID)
                    .HasConstraintName("FK_ShopImage_Product");
            });

            modelBuilder.Entity<ShopOrder>(entity =>
            {
                entity.HasKey(e => e.OrderNo);

                entity.ToTable("ShopOrder");

                entity.Property(e => e.OrderNo).HasMaxLength(50);

                entity.Property(e => e.AmountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.DiscountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderDate).HasColumnType("datetime");

                entity.Property(e => e.OrderID).ValueGeneratedOnAdd();

                entity.Property(e => e.OrderName).HasMaxLength(50);

                entity.Property(e => e.OrderType).HasDefaultValueSql("((1))");

                entity.Property(e => e.SumPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UserID).HasMaxLength(50);
            });

            modelBuilder.Entity<ShopOrderDetail>(entity =>
            {
                entity.HasKey(e => e.DetailID);

                entity.ToTable("ShopOrderDetail");

                entity.Property(e => e.DiscountPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.OrderNo).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.ShopPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UserID).HasMaxLength(50);

                entity.HasOne(d => d.OrderNoNavigation)
                    .WithMany(p => p.ShopOrderDetails)
                    .HasForeignKey(d => d.OrderNo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ShopOrderDetail_ShopOrder");
            });

            modelBuilder.Entity<SuperProductView>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SuperProductView");

                entity.Property(e => e.ActivityPrice).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.Expr1).HasColumnType("datetime");

                entity.Property(e => e.ImgPath1).HasMaxLength(1000);

                entity.Property(e => e.ImgPath2).HasMaxLength(1000);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductDesc).HasMaxLength(50);

                entity.Property(e => e.ProductID).HasMaxLength(50);

                entity.Property(e => e.ProductIntroduce).HasMaxLength(500);

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.Property(e => e.ProductStarNum).HasMaxLength(20);

                entity.Property(e => e.ProductTypeName).HasMaxLength(50);

                entity.Property(e => e.ShopAddress).HasMaxLength(500);

                entity.Property(e => e.ShopBoss).HasMaxLength(50);

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.ShopIntroduce).HasMaxLength(500);

                entity.Property(e => e.ShopMobile).HasMaxLength(11);

                entity.Property(e => e.ShopName).HasMaxLength(200);

                entity.Property(e => e.ShopStars).HasMaxLength(10);

                entity.Property(e => e.Star1).HasMaxLength(200);

                entity.Property(e => e.Star2).HasMaxLength(200);

                entity.Property(e => e.Star3).HasMaxLength(200);

                entity.Property(e => e.Star4).HasMaxLength(200);

                entity.Property(e => e.Star5).HasMaxLength(200);

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

                entity.Property(e => e.TitleDesc).HasMaxLength(50);

                entity.Property(e => e.TitleUrl).HasMaxLength(500);

                entity.Property(e => e.about).HasMaxLength(50);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasIndex(e => e.ID, "ix_com_Users");

                entity.Property(e => e.AddDate).HasColumnType("datetime");

                entity.Property(e => e.Address).HasMaxLength(50);

                entity.Property(e => e.Introduce).HasMaxLength(200);

                entity.Property(e => e.Password).HasMaxLength(1000);

                entity.Property(e => e.Sex)
                    .HasMaxLength(4)
                    .IsFixedLength();

                entity.Property(e => e.UserID).HasMaxLength(50);

                entity.Property(e => e.UserName).HasMaxLength(50);

                entity.Property(e => e.UserType).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<UserLoginLog>(entity =>
            {
                entity.HasKey(e => e.LogID);

                entity.ToTable("UserLoginLog");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LoginIP).HasMaxLength(100);

                entity.Property(e => e.UserID).HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
