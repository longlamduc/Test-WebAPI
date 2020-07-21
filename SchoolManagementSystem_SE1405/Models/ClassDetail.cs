using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class ClassDetail
    {
        [Key]
        [Column(Order = 1)]
        public string AccountId { get; set; }
        [ForeignKey("AccountId")]
        public Account Account { get; set; }
        [Key]
        [Column(Order = 2)]

        public string ClassId { get; set; }
        [ForeignKey("ClassId")]
        public Class Class { get; set; }
    }
}