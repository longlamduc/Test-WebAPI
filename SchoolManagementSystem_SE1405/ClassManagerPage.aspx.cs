﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using SchoolManagementSystem_SE1405.Models;

namespace SchoolManagementSystem_SE1405
{
    public partial class ClassManagerPage : System.Web.UI.Page
    {
        List<Class> listClass;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
        }

        protected async void LoadClassItem()
        {
            HttpRequestMessage request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri(Util.baseAddress + "classes")
            };

            HttpResponseMessage response = await Util.client.SendAsync(request);

            if (response.IsSuccessStatusCode)
            {
                listClass = await response.Content.ReadAsAsync<List<Class>>();
            }
        }


    }
}