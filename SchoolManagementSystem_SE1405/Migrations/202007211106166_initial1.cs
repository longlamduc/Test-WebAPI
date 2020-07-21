namespace SchoolManagementSystem_SE1405.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial1 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Attendances",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AccountId = c.String(maxLength: 128),
                        ClassId = c.String(maxLength: 128),
                        Status = c.Boolean(nullable: false),
                        Lesson = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Accounts", t => t.AccountId)
                .ForeignKey("dbo.Classes", t => t.ClassId)
                .Index(t => t.AccountId)
                .Index(t => t.ClassId);
            
            CreateTable(
                "dbo.Classes",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Duration = c.Single(nullable: false),
                        StartDate = c.DateTime(nullable: false),
                        CourseId = c.String(maxLength: 128),
                        AccountId = c.String(maxLength: 128),
                        StatusId = c.Int(nullable: false),
                        ClassDetailId = c.String(),
                        ClassDetail_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Accounts", t => t.AccountId)
                .ForeignKey("dbo.ClassDetails", t => t.ClassDetail_Id)
                .ForeignKey("dbo.Courses", t => t.CourseId)
                .ForeignKey("dbo.Status", t => t.StatusId, cascadeDelete: true)
                .Index(t => t.CourseId)
                .Index(t => t.AccountId)
                .Index(t => t.StatusId)
                .Index(t => t.ClassDetail_Id);
            
            CreateTable(
                "dbo.ClassDetails",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AccountId = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Accounts", t => t.AccountId)
                .Index(t => t.AccountId);
            
            CreateTable(
                "dbo.Courses",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        CourseName = c.String(),
                        Description = c.String(),
                        Semester = c.Int(nullable: false),
                        TotalLesson = c.Int(nullable: false),
                        TotalCredit = c.Int(nullable: false),
                        StatusId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Status", t => t.StatusId, cascadeDelete: true)
                .Index(t => t.StatusId);
            
            CreateTable(
                "dbo.GradeDetails",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        GradeId = c.String(maxLength: 128),
                        AccountId = c.String(maxLength: 128),
                        GradeValue = c.Single(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Accounts", t => t.AccountId)
                .ForeignKey("dbo.Grades", t => t.GradeId)
                .Index(t => t.GradeId)
                .Index(t => t.AccountId);
            
            CreateTable(
                "dbo.Grades",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Type = c.String(),
                        ClassId = c.String(maxLength: 128),
                        Percent = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Classes", t => t.ClassId)
                .Index(t => t.ClassId);
            
            CreateTable(
                "dbo.Students",
                c => new
                    {
                        AccountId = c.String(nullable: false, maxLength: 128),
                        Semester = c.Int(nullable: false),
                        AverageMark = c.Single(nullable: false),
                        Account_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.AccountId)
                .ForeignKey("dbo.Accounts", t => t.Account_Id)
                .Index(t => t.Account_Id);
            
            CreateTable(
                "dbo.Teachings",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AccountId = c.String(maxLength: 128),
                        CourseId = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Accounts", t => t.AccountId)
                .ForeignKey("dbo.Courses", t => t.CourseId)
                .Index(t => t.AccountId)
                .Index(t => t.CourseId);
            
            CreateTable(
                "dbo.TimeTables",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ClassId = c.String(maxLength: 128),
                        Time = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Classes", t => t.ClassId)
                .Index(t => t.ClassId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.TimeTables", "ClassId", "dbo.Classes");
            DropForeignKey("dbo.Teachings", "CourseId", "dbo.Courses");
            DropForeignKey("dbo.Teachings", "AccountId", "dbo.Accounts");
            DropForeignKey("dbo.Students", "Account_Id", "dbo.Accounts");
            DropForeignKey("dbo.GradeDetails", "GradeId", "dbo.Grades");
            DropForeignKey("dbo.Grades", "ClassId", "dbo.Classes");
            DropForeignKey("dbo.GradeDetails", "AccountId", "dbo.Accounts");
            DropForeignKey("dbo.Attendances", "ClassId", "dbo.Classes");
            DropForeignKey("dbo.Classes", "StatusId", "dbo.Status");
            DropForeignKey("dbo.Classes", "CourseId", "dbo.Courses");
            DropForeignKey("dbo.Courses", "StatusId", "dbo.Status");
            DropForeignKey("dbo.Classes", "ClassDetail_Id", "dbo.ClassDetails");
            DropForeignKey("dbo.ClassDetails", "AccountId", "dbo.Accounts");
            DropForeignKey("dbo.Classes", "AccountId", "dbo.Accounts");
            DropForeignKey("dbo.Attendances", "AccountId", "dbo.Accounts");
            DropIndex("dbo.TimeTables", new[] { "ClassId" });
            DropIndex("dbo.Teachings", new[] { "CourseId" });
            DropIndex("dbo.Teachings", new[] { "AccountId" });
            DropIndex("dbo.Students", new[] { "Account_Id" });
            DropIndex("dbo.Grades", new[] { "ClassId" });
            DropIndex("dbo.GradeDetails", new[] { "AccountId" });
            DropIndex("dbo.GradeDetails", new[] { "GradeId" });
            DropIndex("dbo.Courses", new[] { "StatusId" });
            DropIndex("dbo.ClassDetails", new[] { "AccountId" });
            DropIndex("dbo.Classes", new[] { "ClassDetail_Id" });
            DropIndex("dbo.Classes", new[] { "StatusId" });
            DropIndex("dbo.Classes", new[] { "AccountId" });
            DropIndex("dbo.Classes", new[] { "CourseId" });
            DropIndex("dbo.Attendances", new[] { "ClassId" });
            DropIndex("dbo.Attendances", new[] { "AccountId" });
            DropTable("dbo.TimeTables");
            DropTable("dbo.Teachings");
            DropTable("dbo.Students");
            DropTable("dbo.Grades");
            DropTable("dbo.GradeDetails");
            DropTable("dbo.Courses");
            DropTable("dbo.ClassDetails");
            DropTable("dbo.Classes");
            DropTable("dbo.Attendances");
        }
    }
}
