using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class SupUserProductCartView
    {
        public string UserID { get; set; } = null!;
        public int CartID { get; set; }
        public int ProductCartNum { get; set; }
        public string ProductID { get; set; } = null!;
        public decimal? ProductPrice { get; set; }
        public int CartType { get; set; }
        public string? ShopID { get; set; }
        public string? ProductName { get; set; }
        public int? ProductType { get; set; }
        public decimal? Price { get; set; }
        public decimal? ActivityPrice { get; set; }
        public decimal? discount { get; set; }
        public int? discountType { get; set; }
        public int? ProductNum { get; set; }
        public string? ProductIntroduce { get; set; }
        public decimal? ProductStarNum { get; set; }
        public int? ProductState { get; set; }
        public int? ProductStock { get; set; }
        public DateTime AddDate { get; set; }
        public string? ImgPath1 { get; set; }
        public string? ImgPath2 { get; set; }
    }
}
