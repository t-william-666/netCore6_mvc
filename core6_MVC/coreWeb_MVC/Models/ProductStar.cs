using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductStar
    {
        public int StarID { get; set; }
        public int? StarType { get; set; }
        public string? StarTxt { get; set; }
        public string? StarDesc { get; set; }
        public string? StarNum { get; set; }
        public int? StarOrderby { get; set; }
        public int? State { get; set; }
        public DateTime? AddDate { get; set; }
    }
}
