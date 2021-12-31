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

        public virtual DbSet<Shop> Shops { get; set; } = null!;
        public virtual DbSet<ShopType> ShopTypes { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                //注释掉 多余代码
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.

                //连接数据库的连接字符串
                optionsBuilder.UseSqlServer("Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Shop>(entity =>
            {
                entity.ToTable("Shop");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.ActivityPrice).HasColumnType("money");

                entity.Property(e => e.Discount)
                    .HasColumnType("decimal(5, 2)")
                    .HasColumnName("discount");

                entity.Property(e => e.Price).HasColumnType("money");

                entity.Property(e => e.ShopId)
                    .HasMaxLength(50)
                    .HasColumnName("ShopID");

                entity.Property(e => e.ShopIntroduce).HasMaxLength(300);

                entity.Property(e => e.ShopName).HasMaxLength(50);

                entity.Property(e => e.ShopState).HasMaxLength(10);

                entity.HasOne(d => d.ShopTypeNavigation)
                    .WithMany(p => p.Shops)
                    .HasForeignKey(d => d.ShopType)
                    .HasConstraintName("FK_Shop_ShopTypes");
            });

            modelBuilder.Entity<ShopType>(entity =>
            {
                entity.HasKey(e => e.ShopType1);

                entity.Property(e => e.ShopType1).HasColumnName("ShopType");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.ShopTypeName).HasMaxLength(50);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Introduce).HasMaxLength(200);

                entity.Property(e => e.Password)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Sex)
                    .HasMaxLength(4)
                    .IsFixedLength();

                entity.Property(e => e.UserId)
                    .HasMaxLength(13)
                    .IsUnicode(false)
                    .HasColumnName("UserID");

                entity.Property(e => e.UserName)
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
