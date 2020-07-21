using SchoolManagementSystem_SE1405.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem_SE1405.Data
{
    public class SchoolManagementSystem_SE1405Context : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<ClassDetail>().HasKey(l => new { l.AccountId, l.ClassId });
        }

        public SchoolManagementSystem_SE1405Context() : base("name=SchoolManagementSystem_SE1405Context")
        {
        }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.Role> Roles { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.Status> Status { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.Account> Accounts { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.AccountInfo> AccountInfoes { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.Attendance> Attendances { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.Class> Classes { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.Course> Courses { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.ClassDetail> ClassDetails { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.Grade> Grades { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.GradeDetail> GradeDetails { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.Student> Students { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.Teaching> Teachings { get; set; }

        public System.Data.Entity.DbSet<SchoolManagementSystem_SE1405.Models.TimeTable> TimeTables { get; set; }
    }
}
