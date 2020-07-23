namespace SchoolManagementSystem_SE1405.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Classes", "EndDate", c => c.DateTime(nullable: false));
            DropColumn("dbo.Classes", "EndTime");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Classes", "EndTime", c => c.DateTime(nullable: false));
            DropColumn("dbo.Classes", "EndDate");
        }
    }
}
