using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductOrderDetail
    {
        public ProductOrderDetail()
        {
            ProductOrderLogistics = new HashSet<ProductOrderLogistic>();
        }

        public int DetailID { get; set; }
        public string OrderNo { get; set; } = null!;
        public string UserID { get; set; } = null!;
        public string ShopID { get; set; } = null!;
        public string ProductID { get; set; } = null!;
        public int? OrderdetailAddressID { get; set; }
        public decimal ProductPrice { get; set; }
        public decimal? DiscountPrice { get; set; }
        public int? OrderProductNum { get; set; }
        public int? OrderDetailState { get; set; }

        public virtual ProductOrder OrderNoNavigation { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
        public virtual ICollection<ProductOrderLogistic> ProductOrderLogistics { get; set; }
    }
}
