using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ShopType
    {
        public ShopType()
        {
            Shops = new HashSet<Shop>();
        }

        public int ID { get; set; }
        public int ShopType1 { get; set; }
        public string? ShopTypeName { get; set; }
        public string? Desc { get; set; }

        public virtual ICollection<Shop> Shops { get; set; }
    }
}
