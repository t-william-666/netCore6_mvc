using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class Product
    {
        public Product()
        {
            ShopImages = new HashSet<ShopImage>();
        }

        public int ID { get; set; }
        public string ProductID { get; set; } = null!;
        public string? ShopID { get; set; }
        public string? ProductName { get; set; }
        public int? ProductType { get; set; }
        public decimal? Price { get; set; }
        public decimal? ActivityPrice { get; set; }
        public decimal? discount { get; set; }
        public int? discountType { get; set; }
        public int? ProductNum { get; set; }
        public string? ProductIntroduce { get; set; }
        public string? ProductStarNum { get; set; }
        public int? ProductState { get; set; }
        public int? ShopStock { get; set; }
        public DateTime? AddDate { get; set; }

        public virtual ProductStarRating? ProductStarNumNavigation { get; set; }
        public virtual Shop? Shop { get; set; }
        public virtual ICollection<ShopImage> ShopImages { get; set; }
    }
}
