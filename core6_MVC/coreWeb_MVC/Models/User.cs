using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class User
    {
        public User()
        {
            ProductCarts = new HashSet<ProductCart>();
            ProductComments = new HashSet<ProductComment>();
            ProductOrders = new HashSet<ProductOrder>();
            UserAddresses = new HashSet<UserAddress>();
            UserImageLists = new HashSet<UserImageList>();
            UserLookProducts = new HashSet<UserLookProduct>();
            UserSearches = new HashSet<UserSearch>();
        }

        public string UserID { get; set; } = null!;
        public string? Account { get; set; }
        public string Password { get; set; } = null!;
        public string UserName { get; set; } = null!;
        public string? UserEmail { get; set; }
        public string Sex { get; set; } = null!;
        public int? Age { get; set; }
        public string? Introduce { get; set; }
        public string? Address { get; set; }
        public DateTime? Birthday { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int UserType { get; set; }
        public int UserState { get; set; }
        public DateTime? AddDate { get; set; }

        public virtual ICollection<ProductCart> ProductCarts { get; set; }
        public virtual ICollection<ProductComment> ProductComments { get; set; }
        public virtual ICollection<ProductOrder> ProductOrders { get; set; }
        public virtual ICollection<UserAddress> UserAddresses { get; set; }
        public virtual ICollection<UserImageList> UserImageLists { get; set; }
        public virtual ICollection<UserLookProduct> UserLookProducts { get; set; }
        public virtual ICollection<UserSearch> UserSearches { get; set; }
    }
}
