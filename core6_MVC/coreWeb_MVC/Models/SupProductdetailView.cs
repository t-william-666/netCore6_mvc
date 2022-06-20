using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class SupProductdetailView
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
        public decimal? ProductStarNum { get; set; }
        public int? ProductState { get; set; }
        public int? ProductStock { get; set; }
        public DateTime AddDate { get; set; }
        public int ImgID { get; set; }
        public string? ImgType { get; set; }
        public string? ImgName { get; set; }
        public string? ImgPath { get; set; }
        public string? ImgSize { get; set; }
        public int? ImgOrderby { get; set; }
        public int ImgState { get; set; }
        public DateTime ImgAddDate { get; set; }
        public string? ProductTypeName { get; set; }
        public string? ProductDesc { get; set; }
        public string? TypeName { get; set; }
        public decimal StarNum { get; set; }
        public string? StarDesc { get; set; }
        public string? Star1 { get; set; }
        public string? Star2 { get; set; }
        public string? Star3 { get; set; }
        public string? Star4 { get; set; }
        public string? Star5 { get; set; }
        public int? StarType { get; set; }
        public int? StarOrder { get; set; }
        public string? ShopName { get; set; }
        public string? ShopIntroduce { get; set; }
        public string? ShopAddress { get; set; }
        public string? ShopMobile { get; set; }
        public string? ShopBoss { get; set; }
        public string? ShopOpenTime { get; set; }
        public decimal? ShopStarNum { get; set; }
        public int? ShopType { get; set; }
        public int? ShopState { get; set; }
        public DateTime? ShopAddDate { get; set; }
    }
}
