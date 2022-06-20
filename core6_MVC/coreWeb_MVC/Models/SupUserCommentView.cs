using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class SupUserCommentView
    {
        public string UserID { get; set; } = null!;
        public string? Account { get; set; }
        public string UserName { get; set; } = null!;
        public string Sex { get; set; } = null!;
        public int? Age { get; set; }
        public string? Introduce { get; set; }
        public string ImgID { get; set; } = null!;
        public string UserImagePath { get; set; } = null!;
        public string? ImgSize { get; set; }
        public int? ImgWidth { get; set; }
        public int? ImgHeight { get; set; }
        public int ImgState { get; set; }
        public int ImgType { get; set; }
        public int CommentID { get; set; }
        public string? ShopID { get; set; }
        public string ProductID { get; set; } = null!;
        public string CommentTxt { get; set; } = null!;
        public decimal CommentStarNum { get; set; }
        public int CommentType { get; set; }
        public int CommentState { get; set; }
        public DateTime AddDate { get; set; }
        public decimal StarNum { get; set; }
        public string? StarDesc { get; set; }
        public string? Star1 { get; set; }
        public string? Star2 { get; set; }
        public string? Star3 { get; set; }
        public string? Star4 { get; set; }
        public string? Star5 { get; set; }
        public int? StarType { get; set; }
        public int? StarOrder { get; set; }
        public int? CommentLike { get; set; }
        public int ComImgID { get; set; }
        public string ComImgPath { get; set; } = null!;
        public string ComImgSize { get; set; } = null!;
        public int ComOrderby { get; set; }
        public int ComState { get; set; }
    }
}
