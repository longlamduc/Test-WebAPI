using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementSystem_SE1405
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Enabled = false;
            txtBirthday.Enabled = false;
            txtFullName.Enabled = false;
            txtGender.Enabled = false;
            txtPhone.Enabled = false;
            txtRole.Enabled = false;
            txtStatus.Enabled = false;
            txtUserName.Enabled = false;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtEmail.Enabled = true;
            txtBirthday.Enabled = true;
            txtFullName.Enabled = true;
            txtGender.Enabled = true;
            txtPhone.Enabled = true;
            txtRole.Enabled = true;
            txtStatus.Enabled = true;
            txtUserName.Enabled = false;
        }
    }
}