using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class AccountInfo
    {
        public string Id { get; set; }
        public string Email { get; set; }
        public DateTime Birthday { get; set; }
        public string Gender { get; set; }
        public int Phone { get; set; }

    }
}