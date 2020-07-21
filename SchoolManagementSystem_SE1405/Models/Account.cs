using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class Account
    {   
        public string Id { get; set; }
        public string FullName { get; set; }
        public string Password { get; set; }
        public int StatusId { get; set; }
        public Status Status { get; set; }
        public int RoleId { get; set; }
        public Role Role { get; set; }
        public string AccountInfoId { get; set; }
        public AccountInfo AccountInfo { get; set; }
    }
}