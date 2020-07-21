using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class Class
    {
        public string Id { get; set; }
        public float Duration { get; set; }
        public DateTime StartDate { get; set; }
        public string CourseId { get; set; }
        public Course Course { get; set; }
        public string AccountId { get; set; }
        public Account Account { get; set; }
        public int StatusId { get; set; }
        public Status Status { get; set; }
    }
}