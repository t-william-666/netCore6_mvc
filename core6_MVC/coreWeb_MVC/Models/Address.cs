using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class Address
    {
        public int AddressID { get; set; }
        public string UserID { get; set; } = null!;
        public string? UserName { get; set; }
        public string? Mobile { get; set; }
        public string? Province { get; set; }
        public string? City { get; set; }
        public string? Area { get; set; }
        public string? Town { get; set; }
        public string? DetailAddress { get; set; }
        public string? Other { get; set; }
    }
}
