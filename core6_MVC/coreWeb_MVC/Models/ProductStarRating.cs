using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductStarRating
    {
        public ProductStarRating()
        {
            Products = new HashSet<Product>();
        }

        public string StarNum { get; set; } = null!;
        public string? StarDesc { get; set; }
        public string? Star1 { get; set; }
        public string? Star2 { get; set; }
        public string? Star3 { get; set; }
        public string? Star4 { get; set; }
        public string? Star5 { get; set; }
        public int? StarType { get; set; }
        public int? StarOrder { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
