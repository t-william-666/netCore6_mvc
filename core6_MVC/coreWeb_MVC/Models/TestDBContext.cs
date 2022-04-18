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
        public virtual DbSet<Shop> Shops { get; set; } = null!;
        public virtual DbSet<ShopType> ShopTypes { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
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

            modelBuilder.Entity<Shop>(entity =>
            {
                entity.ToTable("Shop");

                entity.HasIndex(e => e.ShopType, "IX_Shop_ShopType");

                entity.Property(e => e.ActivityPrice).HasColumnType("money");

                entity.Property(e => e.Price).HasColumnType("money");

                entity.Property(e => e.ShopID).HasMaxLength(50);

                entity.Property(e => e.ShopIntroduce).HasMaxLength(300);

                entity.Property(e => e.ShopName).HasMaxLength(50);

                entity.Property(e => e.ShopState).HasMaxLength(10);

                entity.Property(e => e.discount).HasColumnType("decimal(5, 2)");

                entity.HasOne(d => d.ShopTypeNavigation)
                    .WithMany(p => p.Shops)
                    .HasForeignKey(d => d.ShopType)
                    .HasConstraintName("FK_Shop_ShopTypes");
            });

            modelBuilder.Entity<ShopType>(entity =>
            {
                entity.HasKey(e => e.ShopType1);

                entity.Property(e => e.ShopType1).HasColumnName("ShopType");

                entity.Property(e => e.Desc).HasMaxLength(50);

                entity.Property(e => e.ShopTypeName).HasMaxLength(50);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Address).HasMaxLength(50);

                entity.Property(e => e.Introduce).HasMaxLength(200);

                entity.Property(e => e.Sex)
                    .HasMaxLength(4)
                    .IsFixedLength();

                entity.Property(e => e.UserID).HasMaxLength(50);

                entity.Property(e => e.UserName).HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
