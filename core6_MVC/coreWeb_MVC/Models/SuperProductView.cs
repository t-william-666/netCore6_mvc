using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class SuperProductView
    {
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
        public string? ProductTypeName { get; set; }
        public string? ProductDesc { get; set; }
        public string? TypeName { get; set; }
        public string? ImgPath1 { get; set; }
        public string? ImgPath2 { get; set; }
        public string? Star1 { get; set; }
        public string? Star2 { get; set; }
        public string? Star3 { get; set; }
        public string? Star4 { get; set; }
        public string? Star5 { get; set; }
        public string? ShopName { get; set; }
        public string? ShopIntroduce { get; set; }
        public string? ShopAddress { get; set; }
        public string? ShopMobile { get; set; }
        public string? ShopBoss { get; set; }
        public string? ShopStars { get; set; }
        public int ShopType { get; set; }
        public DateTime Expr1 { get; set; }
    }
}
