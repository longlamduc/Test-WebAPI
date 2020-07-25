<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Profile.aspx.cs" Inherits="SchoolManagementSystem_SE1405.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
            <img style="margin-left:200px" class="form" width="150" height="150" src="Img/fc047347b17f7df7ff288d78c8c281cf.png" />
        </div>
        <div class="col-md-4 form">
            <p><asp:Label ID="lblFullName" runat="server" Text="Huynh Trong Tri" Font-Bold="True" Font-Size="XX-Large"></asp:Label></p>
            <p> <asp:Label ID="lblRoleName" runat="server" Text="Student" Font-Italic="True"></asp:Label></p>
            <br />
            <p> <i class="glyphicon glyphicon-envelope"></i> <asp:Label ID="lblEmail" runat="server" Text="trihuynh@gmail"></asp:Label>
                
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <i class="glyphicon glyphicon-phone"></i> <asp:Label ID="lblPhone" runat="server" Text="123456789"></asp:Label></p>
        </div>
    </div>
    <div class="row" style="margin-left:150px;">
          <div class="col-md-5 form">
            <p>
                <asp:Label ID="Label1" runat="server" Text="User Name:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <asp:TextBox ID="txtUserName" runat="server" Enabled="False"></asp:TextBox>
            </p>
            <br />
            <p>
                <asp:Label ID="Label2" runat="server" Text="Full Name:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                &nbsp
                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
            </p>
              <br />
            <p>
                <asp:Label ID="Label3" runat="server" Text="Role:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:TextBox ID="txtRole" runat="server"></asp:TextBox>
            </p>
              <br />
              <p>
                <asp:Label ID="Label4" runat="server" Text="Status:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
            </p>
              
        </div>
        <div class="col-md-5 form">
            <p>
                <asp:Label ID="Label5" runat="server" Text="Gender:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                &nbsp&nbsp<asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
            </p>
            <br />
              <p>
                <asp:Label ID="Label6" runat="server" Text="Birthday:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                <asp:TextBox ID="txtBirthday" runat="server"></asp:TextBox>
            </p>
            <br />
              <p>
                <asp:Label ID="Label7" runat="server" Text="Phone:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                &nbsp&nbsp&nbsp&nbsp<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </p>
            <br />
              <p>
                <asp:Label ID="Label8" runat="server" Text="Email:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </p>
        </div>       
    </div>
    <div style="text-align:end; margin-right:50px;">
    <asp:Button ID="btnEdit" runat="server" Text="Edit" Font-Bold="True"  Font-Underline="True" BorderStyle="notset" OnClick="btnEdit_Click" />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" Font-Bold="True"  Font-Underline="True"/>
    </div>

</asp:Content>
