using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ShopCar
    {
        public int CarID { get; set; }
        public string UserID { get; set; } = null!;
        public string ProductID { get; set; } = null!;
        public int ProductNum { get; set; }
        public decimal ProductPrice { get; set; }
        public int CarType { get; set; }
    }
}
