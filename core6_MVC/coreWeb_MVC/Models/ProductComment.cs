using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductComment
    {
        public ProductComment()
        {
            ProductCommentReplies = new HashSet<ProductCommentReply>();
        }

        public int CommentID { get; set; }
        public string UserID { get; set; } = null!;
        public string? ShopID { get; set; }
        public string ProductID { get; set; } = null!;
        public string CommentTxt { get; set; } = null!;
        public decimal CommentStarNum { get; set; }
        public int CommentType { get; set; }
        public int CommentState { get; set; }
        public DateTime AddDate { get; set; }

        public virtual ShopProductStarRating CommentStarNumNavigation { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
        public virtual User User { get; set; } = null!;
        public virtual ProductCommentImage ProductCommentImage { get; set; } = null!;
        public virtual ICollection<ProductCommentReply> ProductCommentReplies { get; set; }
    }
}
