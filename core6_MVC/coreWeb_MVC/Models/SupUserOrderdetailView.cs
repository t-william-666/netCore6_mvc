using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class SupUserOrderdetailView
    {
        public int OrderID { get; set; }
        public string OrderNo { get; set; } = null!;
        public string UserID { get; set; } = null!;
        public string? OrderName { get; set; }
        public decimal? OrderAmountPrice { get; set; }
        public decimal? OrderDiscountPrice { get; set; }
        public decimal? OrderSumPrice { get; set; }
        public int? OrderNum { get; set; }
        public int? OrderAddressId { get; set; }
        public int OrderType { get; set; }
        public int OrderState { get; set; }
        public DateTime OrderDate { get; set; }
        public int DetailID { get; set; }
        public decimal ProductPrice { get; set; }
        public decimal? DiscountPrice { get; set; }
        public int? OrderdetailAddressID { get; set; }
        public int? OrderProductNum { get; set; }
        public int OrderDetailState { get; set; }
        public string ProductID { get; set; } = null!;
        public string ShopID { get; set; } = null!;
        public string ProductName { get; set; } = null!;
        public int ProductType { get; set; }
        public decimal Price { get; set; }
        public decimal? ActivityPrice { get; set; }
        public decimal? discount { get; set; }
        public int? discountType { get; set; }
        public int? ProductNum { get; set; }
        public string? ProductIntroduce { get; set; }
        public decimal? ProductStarNum { get; set; }
        public int? ProductState { get; set; }
        public int? ProductStock { get; set; }
        public DateTime AddDate { get; set; }
        public string? ProductTypeName { get; set; }
        public string? ProductDesc { get; set; }
        public string? TypeName { get; set; }
        public string? ImgPath1 { get; set; }
        public string? ImgPath2 { get; set; }
        public string? UserName { get; set; }
        public string? Mobile { get; set; }
        public string? Province { get; set; }
        public string? City { get; set; }
        public string? Area { get; set; }
        public string? Town { get; set; }
        public string? DetailAddress { get; set; }
        public int? State { get; set; }
        public string? Other { get; set; }
    }
}
