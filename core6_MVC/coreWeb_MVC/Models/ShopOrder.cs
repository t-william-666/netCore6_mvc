using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ShopOrder
    {
        public ShopOrder()
        {
            ShopOrderDetails = new HashSet<ShopOrderDetail>();
        }

        public int OrderID { get; set; }
        public string OrderNo { get; set; } = null!;
        public string UserID { get; set; } = null!;
        public string? OrderName { get; set; }
        public decimal? AmountPrice { get; set; }
        public decimal? DiscountPrice { get; set; }
        public decimal? SumPrice { get; set; }
        public int? OrderNum { get; set; }
        public int OrderType { get; set; }
        public DateTime? OrderDate { get; set; }

        public virtual ICollection<ShopOrderDetail> ShopOrderDetails { get; set; }
    }
}
