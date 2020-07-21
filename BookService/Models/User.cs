using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BookService.Models
{
    public class User
    {
        [Key]
        public string userName { get; set; }
        public string Email { get; set; }
    }
}