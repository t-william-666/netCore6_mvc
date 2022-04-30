using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class BannerImage
    {
        public int BannerID { get; set; }
        public string? Type { get; set; }
        public string? Path { get; set; }
        public string? Paths { get; set; }
        public string? Title { get; set; }
        public string? TitleDesc { get; set; }
        public string? TitleDescs { get; set; }
        public string? Text_1 { get; set; }
        public string? Text_2 { get; set; }
        public string? Text_3 { get; set; }
        public int? State { get; set; }
        public DateTime AddDate { get; set; }
    }
}
