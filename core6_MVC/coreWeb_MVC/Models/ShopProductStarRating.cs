using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ShopProductStarRating
    {
        public ShopProductStarRating()
        {
            ProductComments = new HashSet<ProductComment>();
            Products = new HashSet<Product>();
            Shops = new HashSet<Shop>();
        }

        public decimal StarNum { get; set; }
        public string? StarDesc { get; set; }
        public string? Star1 { get; set; }
        public string? Star2 { get; set; }
        public string? Star3 { get; set; }
        public string? Star4 { get; set; }
        public string? Star5 { get; set; }
        public int? StarType { get; set; }
        public int? StarOrder { get; set; }

        public virtual ICollection<ProductComment> ProductComments { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<Shop> Shops { get; set; }
    }
}
