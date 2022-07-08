using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class UserAddress
    {
        public UserAddress()
        {
            ProductOrders = new HashSet<ProductOrder>();
        }

        public int AddressID { get; set; }
        public string UserID { get; set; } = null!;
        public string? UserName { get; set; }
        public string? Mobile { get; set; }
        public string? Province { get; set; }
        public string? City { get; set; }
        public string? Area { get; set; }
        public string? Town { get; set; }
        public string? DetailAddress { get; set; }
        public int? State { get; set; }
        public string? Other { get; set; }
        public DateTime AddDate { get; set; }

        public virtual User User { get; set; } = null!;
        public virtual ICollection<ProductOrder> ProductOrders { get; set; }
    }
}
