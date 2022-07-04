using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class UserLookProduct
    {
        public int LookID { get; set; }
        public string? UserID { get; set; }
        public string? PoductID { get; set; }
        public string? ShopID { get; set; }
        public DateTime AddDate { get; set; }

        public virtual Product? Poduct { get; set; }
        public virtual User? User { get; set; }
    }
}
