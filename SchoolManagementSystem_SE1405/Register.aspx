<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementSystem_SE1405.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#btnLogin').on('click', function () {
                window.location.replace("https://localhost:44335/LoginPage");
			})

			$("form").on("submit", function (ev) {
				alert("submit");
                ev.preventDefault();
				var data = {
					"Id": $('#txtUsername').val(),
					"FullName": $('#txtFullname').val(),
					"Password": $('#txtPassword').val(),
					"StatusId": 1,
					"RoleId": 2,
					"AccountInfoId": $('#txtUsername').val(),
					"AccountInfo": {
						"Id": $('#txtUsername').val(),
						"Email": $('#txtEmail').val(),
						"Birthday": $('#txtBirthday').val(),
						"Gender": $('#lstGender').val(),
						"Phone": $('#txtPhone').val()
                }
				};
				console.log(data);
                $.post("api/accounts", data, function (data, status) {
                    alert("Data: " + data + "\nStatus: " + status);
                    getAllCourses();
                }).fail(function () {
                    alert("post fail");
                });
                /*$.ajax('api/courses/', {
                    type: 'POST',  // http method
                    data: $(this).serialize(),  // data to submit
                    success: function (data, status) {
                        alert("Data: " + data + "\nStatus: " + status);
                        console.log(status == 'success');
                        getAllCourses();
                    },
                    error: function (jqXhr, textStatus, errorMessage) { // error callback 
                        alert('Error POST: ' + textStatus);
                    }
                 });*/
                
            });
		});
    </script>
</head>
<body style=" background: linear-gradient(to bottom,  rgb(27, 163, 104,0), rgb(27, 163, 104,1));">
	<form id="formRegister" runat="server" style="border:groove; margin:100px 500px 100px 500px; background: linear-gradient(to top, rgb(27, 163, 104,0), rgb(27, 163, 104,1));">
        
   
	<h1 style="text-align:center; border:ridge;  background: linear-gradient(to bottom,  rgb(13, 43, 17,0), rgb(13, 43, 17,1)); color:white; margin-left:180px;margin-right:180px;"><b>Test</b></h1>
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
    	
					<p></p><input style="margin:5px;" type="text" name="Fullname" placeholder="Full Name" required="required" id="txtFullname"/>
					<p></p><input  style="margin:5px;" type="text" name="Username" placeholder="Username" required="required" id="txtUsername"/>
					<p></p><input style="margin:5px;" type="password" name="password" placeholder="Password" required="required" id="txtPassword"/>
					<p></p><input  style="margin:5px;"type="password" name="password" placeholder="Confirm Password" required="required" id="txtRePassword"/>
					<p></p><input  style="margin:5px;"type="email" name="email" placeholder="Email" required="required" id="txtEmail"/>
					<p></p><input  style="margin:5px;"type="date" name="birthday"  required="required" id="txtBirthday"/>	
					<p></p><input style="margin:5px;" type="tel" name="phone" placeholder="Phone" required="required" id="txtPhone"/>
					<p style="margin:5px;">
		            
					<select name="choice" required="required" id="lstGender"> 
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Other">Other</option>
					</select>
				    </p>
  
					
					
				
		</div>
		</div>
	<p style="margin-left:95px;">
    <button type="submit" id="btnRegister" value="Login" style="height: 35px; width: 330px; font-weight: bold; font-size: larger; border-style: ridge">Register</button>
		</p>
		<p style="margin-left:95px;">
    
			<button type="button" id="btnLogin" value="Login" style="height: 35px; width: 330px; font-weight: bold; font-size: larger; border-style: ridge">Login</button>
		</p>
		 </form>
</body>
</html>
