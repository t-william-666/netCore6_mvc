using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class User
    {
        public int ID { get; set; }
        public string UserID { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string UserName { get; set; } = null!;
        public string? UserImage { get; set; }
        public string Sex { get; set; } = null!;
        public int? Age { get; set; }
        public DateTime? Birthday { get; set; }
        public DateTime? CreatedAt { get; set; }
        public string? Introduce { get; set; }
        public string? Address { get; set; }
    }
}
