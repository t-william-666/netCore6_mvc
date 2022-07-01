using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductCommentReply
    {
        public int CommreplyID { get; set; }
        public int CommentID { get; set; }
        public string UserID { get; set; } = null!;
        public string? toUserID { get; set; }
        public string? ComText { get; set; }
        public DateTime addDate { get; set; }

        public virtual ProductComment Comment { get; set; } = null!;
    }
}
