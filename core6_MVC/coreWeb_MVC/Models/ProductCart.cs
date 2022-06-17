using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductCart
    {
        public int CartID { get; set; }
        public string UserID { get; set; } = null!;
        public string ProductID { get; set; } = null!;
        public int ProductCartNum { get; set; }
        public decimal? ProductPrice { get; set; }
        public int CartType { get; set; }
        public DateTime AddDate { get; set; }
    }
}
