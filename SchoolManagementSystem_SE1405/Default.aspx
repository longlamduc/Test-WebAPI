<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SchoolManagementSystem_SE1405._Default" %>

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
            <h2>View Current Class</h2>
            <p></p>
            <p>
                <a class="btn btn-default">Explore &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <img class="img" src="Img/registercourse.png" />
            <h2>Register Course</h2>
            <p></p>
            <p>
                <a class="btn btn-default">Explore &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <img class="img" src="Img/viewgrade.png" />
            <h2>View Grade</h2>
            <p> </p>
            <p>
                <a class="btn btn-default">Explore &raquo;</a>
            </p>
        </div>
    </div>
    <div class="row">
        </div>

</asp:Content>
