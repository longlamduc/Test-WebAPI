using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class Course
    {
        public string Id { get; set; }
        public string CourseName {get; set; }
        public string Description { get; set; }
        public int Semester { get; set; }
        public int TotalLesson { get; set; }
        public int TotalCredit { get; set; }
        public int StatusId { get; set; }
        public Status Status { get; set; }
    }
}