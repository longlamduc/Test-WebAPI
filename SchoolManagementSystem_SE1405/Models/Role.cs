using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class Role
    {
        public int Id { get; set; }
        [Required]
        public string RoleName { get; set; }
    }
}