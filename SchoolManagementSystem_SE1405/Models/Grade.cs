using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Models
{
    public class Grade
    {
        public string Id { get; set; }
        public string Type { get; set; }
        public string ClassId { get; set; }
        public Class Class { get; set; }
        public int Percent { get; set; }


    }
}