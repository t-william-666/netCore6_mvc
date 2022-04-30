using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class TitleList
    {
        public int TitleID { get; set; }
        public string? about { get; set; }
        public string TitleDesc { get; set; } = null!;
        public string Title { get; set; } = null!;
        public string? TitleUrl { get; set; }
        public int TitleOrderby { get; set; }
        public int State { get; set; }
        public DateTime AddDate { get; set; }
    }
}
