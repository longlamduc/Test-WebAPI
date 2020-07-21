namespace SchoolManagementSystem_SE1405.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AccountInfoes",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Email = c.String(),
                        Birthday = c.DateTime(nullable: false),
                        Gender = c.String(),
                        Phone = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Accounts",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        FullName = c.String(),
                        Password = c.String(),
                        StatusId = c.Int(nullable: false),
                        RoleId = c.Int(nullable: false),
                        AccountInfoId = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AccountInfoes", t => t.AccountInfoId)
                .ForeignKey("dbo.Roles", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("dbo.Status", t => t.StatusId, cascadeDelete: true)
                .Index(t => t.StatusId)
                .Index(t => t.RoleId)
                .Index(t => t.AccountInfoId);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RoleName = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Status",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        StatusName = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Accounts", "StatusId", "dbo.Status");
            DropForeignKey("dbo.Accounts", "RoleId", "dbo.Roles");
            DropForeignKey("dbo.Accounts", "AccountInfoId", "dbo.AccountInfoes");
            DropIndex("dbo.Accounts", new[] { "AccountInfoId" });
            DropIndex("dbo.Accounts", new[] { "RoleId" });
            DropIndex("dbo.Accounts", new[] { "StatusId" });
            DropTable("dbo.Status");
            DropTable("dbo.Roles");
            DropTable("dbo.Accounts");
            DropTable("dbo.AccountInfoes");
        }
    }
}
