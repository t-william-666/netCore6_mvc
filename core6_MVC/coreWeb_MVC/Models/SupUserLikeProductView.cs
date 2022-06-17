using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class SupUserLikeProductView
    {
        public string UserID { get; set; } = null!;
        public int LikeID { get; set; }
        public string? ProductID { get; set; }
        public string? ShopID { get; set; }
        public int LikeType { get; set; }
        public DateTime AddDate { get; set; }
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
