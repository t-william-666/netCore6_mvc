using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class SupUserOrderLogisticView
    {
        public int DetailID { get; set; }
        public string OrderNo { get; set; } = null!;
        public string UserID { get; set; } = null!;
        public string ShopID { get; set; } = null!;
        public string ProductID { get; set; } = null!;
        public decimal ProductPrice { get; set; }
        public decimal? DiscountPrice { get; set; }
        public int? OrderProductNum { get; set; }
        public int OrderDetailState { get; set; }
        public int LogisticsID { get; set; }
        public string? ExpressID { get; set; }
        public string? ExpressCompany { get; set; }
        public int? ExpressType { get; set; }
        public string? ExpressDesc { get; set; }
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
        public string? ImgPath1 { get; set; }
        public string? ImgPath2 { get; set; }
    }
}
