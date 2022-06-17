using System;
using System.Collections.Generic;

namespace coreWeb_MVC.Models
{
    public partial class UserLoginLog
    {
        public int LogID { get; set; }
        public string UserID { get; set; } = null!;
        public string? LoginIP { get; set; }
        public string? LoginVpnIP1 { get; set; }
        public string? LoginVpnIP2 { get; set; }
        public string? LoginVpnIP3 { get; set; }
        public int? LoginState { get; set; }
        public DateTime? CreateDate { get; set; }
    }
}
