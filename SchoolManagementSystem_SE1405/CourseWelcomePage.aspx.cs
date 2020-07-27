using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolManagementSystem_SE1405.Models;
using System.Threading.Tasks;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using SchoolManagementSystem_SE1405;
using System.Text;

namespace SchoolManagementSystem_SE1405
{
    public partial class CourseWelcomePage : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CourseManagePage.aspx");
        }

        protected void btnClass_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ClassManagerPage.aspx");
        }

        protected void btnUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserManagerPage.aspx");
        }
    }
}