using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class Student
    {
        [Key]
        public string AccountId { get; set; }

        public Account Account { get; set; }
        public int Semester { get; set; }
        public float AverageMark { get; set; }

    }
}