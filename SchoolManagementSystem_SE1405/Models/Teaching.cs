using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class Teaching
    {   [Key]
        [Column(Order = 1)]
        public string AccountId { get; set; }
        public Account Account { get; set; }
        [Key]
        [Column(Order = 2)]
        public string CourseId { get; set; }
        public Course Course { get; set; }
    }
}