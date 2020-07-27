<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseWelcomePage.aspx.cs" Inherits="SchoolManagementSystem_SE1405.CourseWelcomePage" Async="true"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .col-md-4{
             margin-bottom: 1.5rem;
             text-align: center;
        }
        .col-md-4 p {
    margin-right: .75rem;
    margin-left: .75rem;
    }

        .img{
            width:100px;
            height:100px;
            border-radius:100%;
        }
    </style>
    <div style="margin-left:20px;"><h1><label id="txtWelcome">Welcome, <% %></label></h1></div>
    <div class="row">
        <div class="col-md-4">
            <img class="img" src="Img/currentclass.png" />
            <h2>User Manager</h2>
            <p></p>
            <p>
               <asp:Button ID="btnUser" runat="server" Text="Explore &raquo;" OnClick="btnUser_Click"   />
            </p>
        </div>
        <div class="col-md-4">
            <img class="img" src="Img/currentclass.png" />
            <h2>Class Manager</h2>
            <p></p>
            <p>
               <asp:Button ID="btnClass" runat="server" Text="Explore &raquo;" OnClick="btnClass_Click"  />
            </p>
        </div>
        <div class="col-md-4">
            <img class="img" src="Img/registercourse.png" />
            <h2>Course Manager</h2>
            <p></p>
            <p>
                <asp:Button ID="btnCourse" runat="server" Text="Explore &raquo;" OnClick="btnCourse_Click" />
            </p>
        </div>
    </div>
    <div class="row">
        </div>

</asp:Content>
