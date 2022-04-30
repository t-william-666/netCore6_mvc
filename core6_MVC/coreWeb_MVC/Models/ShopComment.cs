using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ShopComment
    {
        public int CommentID { get; set; }
        public string UserID { get; set; } = null!;
        public string? ShopID { get; set; }
        public string ProductID { get; set; } = null!;
        public string CommentTxt { get; set; } = null!;
        public string CommentStars { get; set; } = null!;
        public int CommentType { get; set; }
        public DateTime AddDate { get; set; }
    }
}
