using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ShopProductType
    {
        public ShopProductType()
        {
            Products = new HashSet<Product>();
            Shops = new HashSet<Shop>();
        }

        public int ProductType { get; set; }
        public string? ProductTypeName { get; set; }
        public string? ProductDesc { get; set; }
        public string? TypeName { get; set; }

        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<Shop> Shops { get; set; }
    }
}
