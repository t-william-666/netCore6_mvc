using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductCommentImage
    {
        public int ComImgID { get; set; }
        public int CommentID { get; set; }
        public string UserID { get; set; } = null!;
        public string ComImgPath { get; set; } = null!;
        public string ComImgSize { get; set; } = null!;
        public int ComOrderby { get; set; }
        public int ComState { get; set; }
        public DateTime AddDate { get; set; }

        public virtual ProductComment ComImg { get; set; } = null!;
    }
}
