using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class Shop
    {
        public int Id { get; set; }
        public string ShopId { get; set; } = null!;
        public string ShopName { get; set; } = null!;
        public int? ShopType { get; set; }
        public decimal Price { get; set; }
        public decimal? ActivityPrice { get; set; }
        public decimal? Discount { get; set; }
        public int ShopNum { get; set; }
        public string? ShopIntroduce { get; set; }
        public string? ShopState { get; set; }
        public int? ShopStock { get; set; }

        public virtual ShopType? ShopTypeNavigation { get; set; }
    }
}
