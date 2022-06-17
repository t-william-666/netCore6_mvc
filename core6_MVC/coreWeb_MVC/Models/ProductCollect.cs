using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductCollect
    {
        public int CollectID { get; set; }
        public string UserID { get; set; } = null!;
        public string ShopID { get; set; } = null!;
        public string ProductID { get; set; } = null!;
        public DateTime AddDate { get; set; }
    }
}
