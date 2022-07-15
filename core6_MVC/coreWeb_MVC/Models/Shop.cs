using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class Shop
    {
        public Shop()
        {
            ProductImages = new HashSet<ProductImage>();
            Products = new HashSet<Product>();
            ShopImages = new HashSet<ShopImage>();
            UserLikes = new HashSet<UserLike>();
        }

        public int ID { get; set; }
        public string ShopID { get; set; } = null!;
        public string UserID { get; set; } = null!;
        public string ShopName { get; set; } = null!;
        public string ShopIntroduce { get; set; } = null!;
        public string ShopAddress { get; set; } = null!;
        public string ShopMobile { get; set; } = null!;
        public string ShopBoss { get; set; } = null!;
        public string? ShopOpenTime { get; set; }
        public decimal ShopStarNum { get; set; }
        public int? ShopType { get; set; }
        public int? ShopState { get; set; }
        public DateTime AddDate { get; set; }

        public virtual ShopProductStarRating ShopStarNumNavigation { get; set; } = null!;
        public virtual ShopProductType? ShopTypeNavigation { get; set; }
        public virtual ICollection<ProductImage> ProductImages { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<ShopImage> ShopImages { get; set; }
        public virtual ICollection<UserLike> UserLikes { get; set; }
    }
}
