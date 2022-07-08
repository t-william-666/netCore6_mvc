using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductOrder
    {
        public ProductOrder()
        {
            ProductOrderDetails = new HashSet<ProductOrderDetail>();
        }

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

        public virtual UserAddress? OrderAddress { get; set; }
        public virtual User User { get; set; } = null!;
        public virtual ICollection<ProductOrderDetail> ProductOrderDetails { get; set; }
    }
}
