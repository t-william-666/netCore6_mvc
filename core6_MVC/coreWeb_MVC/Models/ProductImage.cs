using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductImage
    {
        public int ImgID { get; set; }
        public string? ShopID { get; set; }
        public string? ProductID { get; set; }
        public string? ImgType { get; set; }
        public string? ImgName { get; set; }
        public string? ImgPath { get; set; }
        public string? ImgSize { get; set; }
        public int? ImgOrderby { get; set; }
        public int ImgState { get; set; }
        public DateTime AddDate { get; set; }

        public virtual Product? Product { get; set; }
        public virtual Shop? Shop { get; set; }
    }
}
