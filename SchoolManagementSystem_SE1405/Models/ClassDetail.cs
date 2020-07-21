using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using SchoolManagementSystem_SE1405.Models;

namespace SchoolManagementSystem_SE1405.Models
{
    public class ClassDetail
    {
        public int Id { get; set; }
        public string AccountId { get; set; }
        public Account Account { get; set; }
        public string ClassId { get; set; }
        public Class Class { get; set; }
    }
}