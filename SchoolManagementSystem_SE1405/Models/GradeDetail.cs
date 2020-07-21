using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class GradeDetail
    {
        public int Id { get; set; }
        public string GradeId { get; set; }
        public Grade Grade { get; set; }
        public string AccountId { get; set; }
        public Account Account { get; set; }
        public float GradeValue { get; set; }
    }
}