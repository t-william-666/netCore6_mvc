using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ShopOrderDetail
    {
        public int DetailID { get; set; }
        public string OrderNo { get; set; } = null!;
        public string UserID { get; set; } = null!;
        public string ShopID { get; set; } = null!;
        public decimal ShopPrice { get; set; }
        public decimal? DiscountPrice { get; set; }
        public int? ShopNum { get; set; }

        public virtual ShopOrder OrderNoNavigation { get; set; } = null!;
    }
}
