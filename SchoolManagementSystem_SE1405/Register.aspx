<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementSystem_SE1405.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</head>
<body style=" background: linear-gradient(to bottom,  rgb(27, 163, 104,0), rgb(27, 163, 104,1));">
	<form id="form1" runat="server" style="border:groove; margin:100px 500px 100px 500px; background: linear-gradient(to top, rgb(27, 163, 104,0), rgb(27, 163, 104,1));">
        
   
	<h1 style="text-align:center; border:ridge;  background: linear-gradient(to bottom,  rgb(13, 43, 17,0), rgb(13, 43, 17,1)); color:white; margin-left:180px;margin-right:180px;"><b>Register</b></h1>
	<div class="row">
	<div class="col-md-2"></div>
	
	<div class="col-md-3">
        
					<p></p><label style="margin-top:5px;"><b>Full Name</b></label>
					<p></p><label style="margin-top:13px;"><b>User Name</b></label>
					<p></p><label style="margin-top:15px;"><b>Password</b></label>
					<p></p><label style="margin-top:10px;"><b>Re-Password</b></label>
					<p></p><label style="margin-top:8px;"><b>Email</b></label>
					<p></p><label style="margin-top:12px;"><b>BirthDay</b></label>
					<p></p><label style="margin-top:10px;"><b>Phone</b></label>
					<p>
		            <label style="margin-top:10px;"><b>Gender</b></label>
					
				    </p>
  
					
					
				
		</div>
	    <div class="col-md-1">
    	
					<p></p><input style="margin:5px;" type="text" name="Username" placeholder="Full Name" required="required" />
					<p></p><input  style="margin:5px;" type="text" name="Username" placeholder="Username" required="required" />
					<p></p><input style="margin:5px;" type="password" name="password" placeholder="Password" required=""/>
					<p></p><input  style="margin:5px;"type="password" name="password" placeholder="Confirm Password" required=""/>
					<p></p><input  style="margin:5px;"type="email" name="email" placeholder="Email" required=""/>
					<p></p><input  style="margin:5px;"type="date" name="birthday"  required=""/>	
					<p></p><input style="margin:5px;" type="tel" name="phone" placeholder="Phone" required=""/>
					<p style="margin:5px;">
		            
					<select name="choice" required=""> 
				    <option value="" disabled="disabled" selected="selected">Gender</option>
					<option value="1">Male</option>
					<option value="2">Female</option>
					<option value="3">Other</option>
					</select>
				    </p>
  
					
					
				
		</div>
		</div>
	<p style="margin-left:95px;">
    <asp:Button ID="btnSave" runat="server" Height="35px" Text="Register" Font-Bold="True" Font-Names="BIZ UDPGothic" BorderStyle="Ridge" Width="330px" Font-Size="Larger" />
		</p>
		<p style="margin-left:95px;">
    <asp:Button ID="btnLogin" runat="server" Height="35px" Text="Login" Font-Bold="True" Font-Names="BIZ UDPGothic" BorderStyle="Ridge" Width="330px" Font-Size="Larger"  />
		</p>
		 </form>
</body>
</html>
