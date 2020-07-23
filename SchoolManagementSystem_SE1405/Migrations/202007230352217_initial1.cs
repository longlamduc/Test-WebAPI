namespace SchoolManagementSystem_SE1405.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial1 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Attendances", "AccountId", "dbo.Accounts");
            DropForeignKey("dbo.Attendances", "ClassId", "dbo.Classes");
            DropForeignKey("dbo.TimeTables", "ClassId", "dbo.Classes");
            DropIndex("dbo.Attendances", new[] { "AccountId" });
            DropIndex("dbo.Attendances", new[] { "ClassId" });
            DropIndex("dbo.TimeTables", new[] { "ClassId" });
            AddColumn("dbo.Classes", "EndTime", c => c.DateTime(nullable: false));
            DropTable("dbo.Attendances");
            DropTable("dbo.TimeTables");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.TimeTables",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ClassId = c.String(maxLength: 128),
                        Time = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
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
                .PrimaryKey(t => t.Id);
            
            DropColumn("dbo.Classes", "EndTime");
            CreateIndex("dbo.TimeTables", "ClassId");
            CreateIndex("dbo.Attendances", "ClassId");
            CreateIndex("dbo.Attendances", "AccountId");
            AddForeignKey("dbo.TimeTables", "ClassId", "dbo.Classes", "Id");
            AddForeignKey("dbo.Attendances", "ClassId", "dbo.Classes", "Id");
            AddForeignKey("dbo.Attendances", "AccountId", "dbo.Accounts", "Id");
        }
    }
}
