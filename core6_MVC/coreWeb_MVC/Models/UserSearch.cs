using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class UserSearch
    {
        public int searchID { get; set; }
        public string? UserID { get; set; }
        public string? SearchName { get; set; }
        public DateTime AddDate { get; set; }

        public virtual User? User { get; set; }
    }
}
