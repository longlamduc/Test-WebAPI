<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SchoolManagementSystem_SE1405._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .fill{
            margin:20px 20px;
            padding: inherit;
            background-color:lightblue;

        }
        .form{
            margin:20px;
        }
    </style>
    <div class="row fill" >
        <div class="col-md-4">
            <img class="form" width="250" height="250" src="Img/fc047347b17f7df7ff288d78c8c281cf.png" />
        </div>
        <div class="col-md-4 form">
            <p>
                <asp:Label ID="Label1" runat="server" Text="User Name:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
            </p>
            
            <p>
                <asp:Label ID="Label2" runat="server" Text="User Name:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="User Name:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </p>
        </div>
    </div>

</asp:Content>