using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class Shop
    {
        public Shop()
        {
            Products = new HashSet<Product>();
        }

        public int ID { get; set; }
        public string ShopID { get; set; } = null!;
        public string? ShopName { get; set; }
        public string? ShopIntroduce { get; set; }
        public string? ShopAddress { get; set; }
        public string? ShopMobile { get; set; }
        public string? ShopBoss { get; set; }
        public string? ShopStars { get; set; }
        public int ShopType { get; set; }
        public DateTime AddDate { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
