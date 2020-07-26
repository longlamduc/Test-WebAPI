using SchoolManagementSystem_SE1405.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementSystem_SE1405
{
    public partial class LoginPage : System.Web.UI.Page
    {
        async void GetAccountDetail()
        {
            HttpClient client = Util.client;
            //client.BaseAddress = new Uri(Util.baseAddress + "login");
            //HttpResponseMessage response = await client.GetAsync(Util.baseAddress + "login", "{'Id' : 'student1', 'Password': '1'}"); ;
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri(Util.baseAddress + "accounts/login?Id=" + txtUsername.Text +" &Password="+txtPassword.Text+""),

            };

            HttpResponseMessage response = await Util.client.SendAsync(request);
            //response.EnsureSuccessStatusCode();

            var responseBody = await response.Content.ReadAsAsync<Account>().ConfigureAwait(false);

            /*Console.WriteLine(responseBody);*/
            if (responseBody != null) { 
            Response.Redirect("~/Profile.aspx");
            }



        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

      /*  protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
            Response.Write("<script>alert('Your text');</script>");
            GetAccountDetail();
        }*/

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            GetAccountDetail();

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }
    }
}