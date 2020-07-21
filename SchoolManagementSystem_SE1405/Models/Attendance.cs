using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class Attendance
    {
        public int Id { get; set; }
        public string AccountId { get; set; }
        public Account Account { get; set; }
        public string ClassId { get; set; }
        public Class Class { get; set; }
        public bool Status { get; set; }
        public int Lesson { get; set; }
    }
}