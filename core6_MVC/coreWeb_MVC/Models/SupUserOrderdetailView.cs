using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class SupUserOrderdetailView
    {
        public string UserID { get; set; } = null!;
        public int OrderID { get; set; }
        public string OrderNo { get; set; } = null!;
        public string Expr1 { get; set; } = null!;
        public string? OrderName { get; set; }
        public decimal? OrderAmountPrice { get; set; }
        public decimal? OrderDiscountPrice { get; set; }
        public decimal? OrderSumPrice { get; set; }
        public int? OrderNum { get; set; }
        public int OrderType { get; set; }
        public int OrderState { get; set; }
        public DateTime? OrderDate { get; set; }
        public int DetailID { get; set; }
        public decimal ProductPrice { get; set; }
        public decimal? DiscountPrice { get; set; }
        public int? OrderProductNum { get; set; }
        public int OrderDetailState { get; set; }
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
        public DateTime? AddDate { get; set; }
        public string? ProductTypeName { get; set; }
        public string? ProductDesc { get; set; }
        public string? TypeName { get; set; }
        public string? ImgPath1 { get; set; }
        public string? ImgPath2 { get; set; }
    }
}
