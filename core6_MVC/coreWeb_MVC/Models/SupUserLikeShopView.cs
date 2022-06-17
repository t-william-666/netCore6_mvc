using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class SupUserLikeShopView
    {
        public string UserID { get; set; } = null!;
        public string? ShopID { get; set; }
        public DateTime AddDate { get; set; }
        public string ShopName { get; set; } = null!;
        public string ShopIntroduce { get; set; } = null!;
        public string ShopAddress { get; set; } = null!;
        public string ShopMobile { get; set; } = null!;
        public string ShopBoss { get; set; } = null!;
        public string? ShopOpenTime { get; set; }
        public decimal ShopStarNum { get; set; }
        public int? ShopType { get; set; }
        public int? ShopState { get; set; }
        public decimal StarNum { get; set; }
        public string? StarDesc { get; set; }
        public string? Star1 { get; set; }
        public string? Star2 { get; set; }
        public string? Star3 { get; set; }
        public string? Star4 { get; set; }
        public string? Star5 { get; set; }
        public int? StarType { get; set; }
        public int? StarOrder { get; set; }
        public string? ProductTypeName { get; set; }
        public string? ProductDesc { get; set; }
        public string? TypeName { get; set; }
        public string? ImgPath1 { get; set; }
        public string? ImgPath2 { get; set; }
    }
}
