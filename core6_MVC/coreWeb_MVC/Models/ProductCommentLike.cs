using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductCommentLike
    {
        public int LikeID { get; set; }
        public int? CommentID { get; set; }
        public int? CommreplyID { get; set; }
        public string? UserID { get; set; }
        public DateTime? AddDate { get; set; }
    }
}
