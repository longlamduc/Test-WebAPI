using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class TimeTable
    {
        public int Id { get; set; }
        public string ClassId { get; set; }
        public Class Class { get; set; }
        public DateTime Time { get; set; }

    }
}