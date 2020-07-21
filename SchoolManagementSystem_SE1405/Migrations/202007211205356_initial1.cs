namespace SchoolManagementSystem_SE1405.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial1 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Classes", "ClassDetail_Id", "dbo.ClassDetails");
            DropIndex("dbo.Classes", new[] { "ClassDetail_Id" });
            AddColumn("dbo.ClassDetails", "ClassId", c => c.String(maxLength: 128));
            CreateIndex("dbo.ClassDetails", "ClassId");
            AddForeignKey("dbo.ClassDetails", "ClassId", "dbo.Classes", "Id");
            DropColumn("dbo.Classes", "ClassDetailId");
            DropColumn("dbo.Classes", "ClassDetail_Id");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Classes", "ClassDetail_Id", c => c.Int());
            AddColumn("dbo.Classes", "ClassDetailId", c => c.String());
            DropForeignKey("dbo.ClassDetails", "ClassId", "dbo.Classes");
            DropIndex("dbo.ClassDetails", new[] { "ClassId" });
            DropColumn("dbo.ClassDetails", "ClassId");
            CreateIndex("dbo.Classes", "ClassDetail_Id");
            AddForeignKey("dbo.Classes", "ClassDetail_Id", "dbo.ClassDetails", "Id");
        }
    }
}
