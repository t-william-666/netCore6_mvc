using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class Product
    {
        public Product()
        {
            ProductCarts = new HashSet<ProductCart>();
            ProductComments = new HashSet<ProductComment>();
            ProductImages = new HashSet<ProductImage>();
            ProductOrderDetails = new HashSet<ProductOrderDetail>();
            ShopImages = new HashSet<ShopImage>();
            UserLookProducts = new HashSet<UserLookProduct>();
        }

        public int ID { get; set; }
        public string ProductID { get; set; } = null!;
        public string ShopID { get; set; } = null!;
        public string ProductName { get; set; } = null!;
        public int ProductType { get; set; }
        public decimal Price { get; set; }
        public decimal? ActivityPrice { get; set; }
        public decimal? discount { get; set; }
        public int? discountType { get; set; }
        public int? ProductNum { get; set; }
        public string? ProductIntroduce { get; set; }
        public decimal? ProductStarNum { get; set; }
        public int? ProductState { get; set; }
        public int? ProductStock { get; set; }
        public DateTime AddDate { get; set; }

        public virtual ShopProductStarRating? ProductStarNumNavigation { get; set; }
        public virtual ShopProductType ProductTypeNavigation { get; set; } = null!;
        public virtual Shop Shop { get; set; } = null!;
        public virtual ICollection<ProductCart> ProductCarts { get; set; }
        public virtual ICollection<ProductComment> ProductComments { get; set; }
        public virtual ICollection<ProductImage> ProductImages { get; set; }
        public virtual ICollection<ProductOrderDetail> ProductOrderDetails { get; set; }
        public virtual ICollection<ShopImage> ShopImages { get; set; }
        public virtual ICollection<UserLookProduct> UserLookProducts { get; set; }
    }
}
