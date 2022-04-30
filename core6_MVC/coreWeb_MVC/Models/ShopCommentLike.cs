using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ShopCommentLike
    {
        public int LikeID { get; set; }
        public string? CommentID { get; set; }
        public string? UserID { get; set; }
        public DateTime? AddDate { get; set; }
    }
}
