using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class User
    {
        public int Id { get; set; }
        public string UserId { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string UserName { get; set; } = null!;
        public string Sex { get; set; } = null!;
        public int? Age { get; set; }
        public string? Introduce { get; set; }
    }
}
