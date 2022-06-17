using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class ProductPorderLogistic
    {
        public int LogisticsID { get; set; }
        public int? DetailID { get; set; }
        public string? ExpressID { get; set; }
        public string? ExpressCompany { get; set; }
        public int? ExpressType { get; set; }
        public string? ExpressDesc { get; set; }
        public DateTime AddDate { get; set; }

        public virtual ProductOrderDetail? Detail { get; set; }
    }
}
