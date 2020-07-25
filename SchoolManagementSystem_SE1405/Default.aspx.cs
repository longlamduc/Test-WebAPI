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
    public partial class Default : Page
    {
        async void GetAccountDetail()
        {
            HttpClient client = Util.client;
            //client.BaseAddress = new Uri(Util.baseAddress + "login");
            //HttpResponseMessage response = await client.GetAsync(Util.baseAddress + "login", "{'Id' : 'student1', 'Password': '1'}"); ;
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri(Util.baseAddress + "accounts/login?Id=student1&Password=1"),
                
            };

            HttpResponseMessage response = await Util.client.SendAsync(request);
            //response.EnsureSuccessStatusCode();

            var responseBody = await response.Content.ReadAsAsync<Account>().ConfigureAwait(false);

            /*Console.WriteLine(responseBody);*/
            Response.Write("<script>alert('" + responseBody.FullName + "');</script>");



        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Your text');</script>");
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
            Response.Write("<script>alert('Your text');</script>");
            GetAccountDetail();
            Response.Write("<script>alert('Your text');</script>");
        }
    }
}