namespace BookService.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial5 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        userName = c.String(nullable: false, maxLength: 128),
                        Email = c.String(),
                    })
                .PrimaryKey(t => t.userName);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Users");
        }
    }
}
