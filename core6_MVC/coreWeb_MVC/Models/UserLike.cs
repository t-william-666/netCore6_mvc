using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class UserLike
    {
        public int LikeID { get; set; }
        public string UserID { get; set; } = null!;
        public string? ProductID { get; set; }
        public string? ShopID { get; set; }
        public int LikeType { get; set; }
        public DateTime AddDate { get; set; }

        public virtual Product? Product { get; set; }
        public virtual Shop? Shop { get; set; }
        public virtual User User { get; set; } = null!;
    }
}
