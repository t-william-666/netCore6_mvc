using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class UserImage
    {
        public int ImgID { get; set; }
        public string UserID { get; set; } = null!;
        public string UserImagePath { get; set; } = null!;
        public string? ImgSize { get; set; }
        public int? ImgWidth { get; set; }
        public int? ImgHeight { get; set; }
        public int ImgType { get; set; }
        public DateTime AddDate { get; set; }

        public virtual User User { get; set; } = null!;
    }
}
