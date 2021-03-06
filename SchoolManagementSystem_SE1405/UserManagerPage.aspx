﻿<%@ Page Title="Management Page" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="UserManagerPage.aspx.cs" Inherits="SchoolManagementSystem_SE1405.CourseManagePage" Async="true"%>

<asp:Content ID="PageHeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        function getAllAccounts() {
            $.getJSON("api/accounts", function (data) {
                $('#listAccount').empty();
                $.each(data, function (key, value) {
                    var item = $('#accountItem').clone();
                    item.show();
                    console.log(value);
                    item.find("#accountInfo").text(value.Id + " - " + value.FullName);
                    item.find("#detailLink").on('click', function () {
                        showAccountDetail(value);
                    });

                    item.find('#editLink').on('click', function () {
                        showAccountDetail(value);
                        console.log(value);
                        $('#lblAction').text('Edit account');
                        $('#txtAccountID').attr('disabled', 'disabled');
                        $('#txtAccountID').val(value.Id);
                        $('#txtFullName').val(value.FullName);
                        $('#txtPassword').val(value.Password);
                        $('#lstStatus').val(value.StatusId);
                        $('#lstRole').val(value.RoleId);
                        $('#txtEmail').val(value.AccountInfo.Email);
                        $('#txtBirthday').val(new Date(value.AccountInfo.Birthday).toISOString().substring(0, 10));
                        $('#txtPhone').val(value.AccountInfo.Phone);
                        $('#lstGender').val(value.AccountInfo.Gender);
                    });

                    $('#listAccount').append(item);
                });
            })
        }

        function getAllStatus() {
            $.getJSON("api/status", function (data) {
                $.each(data, function (key, value) {
                    var item = $('#optionItem').clone();
                    item.val(value.Id);
                    item.text(value.StatusName);
                    $('#lstStatus').append(item);
                });
            });
        }

        function getAllRole() {
            $.getJSON("api/roles", function (data) {
                $.each(data, function (key, value) {
                    var item = $('#optionItem').clone();
                    item.val(value.Id);
                    item.text(value.RoleName);
                    $('#lstRole').append(item);
                });
            });
        }
        

        function showAccountDetail(item) {
            $('#accountID').text(item.Id);
            $('#fullName').text(item.FullName);
            $('#password').text(item.Password);
            $('#status').text(item.Status.StatusName);
            $('#role').text(item.Role.RoleName);
            $('#email').text(item.AccountInfo.Email);
            $('#birthday').text(item.AccountInfo.Birthday);
            $('#phone').text(item.AccountInfo.Phone);
            $('#gender').text(item.AccountInfo.Gender);
        }

        /*function validateForm() {
            let validateResult = true;
            if ($('#txtCourseID').val().length === 0) {
                $('#txtCourseID').parent().addClass('has-warning');
                validateResult = false;
            }
            else if ($('#txtCourseID').val().length !== 6) {
                $('#txtCourseID').parent().addClass('has-warning');
                validateResult = false;
            }
            else {
                $('#txtCourseID').parent().removeClass('has-warning');
            }

            if ($('#txtCourseName').val().length === 0) {
                $('#txtCourseName').parent().addClass('has-warning');
                validateResult = false;
            }
            else {
                $('#txtCourseName').parent().removeClass('has-warning');
            }

            if ($('#txtDescription').val().length === 0) {
                $('#txtDescription').parent().addClass('has-warning');
                validateResult = false;
            }
            else {
                $('#txtDescription').parent().removeClass('has-warning');
            }
            *//*if (validateResult == true) {
                alert('submit');
                $('form').submit();
                
            }*//*
        }*/

        $(document).ready(function () {
            getAllAccounts();
            getAllStatus();
            getAllRole();
            $('form').attr('method', 'POST');
            $('form').attr('action', 'api/courses');

            $('#btnAdd').on('click', function () {
                $('#lblAction').text('Add course');
                $('form :input').val('');
                $('form').attr('method', 'POST');
                $('form').attr('action', 'api/courses');
                $('#txtCourseID').removeAttr('disabled');
            });


            $("form").on("submit", function (ev) {
                ev.preventDefault();

                if ($('#lblAction').text().indexOf('Add') >= 0) {
                    var data = {
                        "Id": $('#txtAccountID').val(),
                        "FullName": $('#txtFullName').val(),
                        "Password": $('#txtPassword').val(),
                        "StatusId": $('#lstStatus').val(),
                        "RoleId": $('#lstRole').val(),
                        "AccountInfoId": $('#txtAccountID').val(),
                        "AccountInfo": {
                            "Id": $('#txtAccountID').val(),
                            "Email": $('#txtEmail').val(),
                                "Birthday": $('#txtBirthday').val(),
                            "Gender": $('#lstGender').val(),
                            "Phone": $('#txtPhone').val()
        }
                
                    };
                    console.log(data);
                    $.post("api/accounts/", data, function (data, status) {
                        alert("Data: " + data + "\nStatus: " + status);
                        getAllAccounts();
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
                }
                else {
                    $.ajax({
                        url: 'https://localhost:44335/api/accounts/' + $('#txtAccountID').val(),
                        type: 'PUT',
                        dataType: 'json',
                        contentType: "application/json; charset=utf-8",
                        async: false,
                        data: JSON.stringify({
                            "Id": $('#txtAccountID').val(),
                            "FullName": $('#txtFullName').val(),
                            "Password": $('#txtPassword').val(),
                            "StatusId": $('#lstStatus').val(),
                            "RoleId": $('#lstRole').val(),
                            "AccountInfoId": $('#txtAccountID').val(),
                            "AccountInfo": {
                                "Id": $('#txtAccountID').val(),
                                "Email": $('#txtEmail').val(),
                                "Birthday": $('#txtBirthday').val(),
                                "Gender": $('#lstGender').val(),
                                "Phone": $('#txtPhone').val()
                            }

                        }),
                        success: function (data, status) {
                            alert("Data: " + data + "\nStatus: " + status);
                            console.log(status == 'success');
                            getAllAccounts();
                        },
                        error: function (jqXhr, textStatus, errorMessage) { // error callback 
                            alert('Error PUT: ' + errorMessage);
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
    <h1>User Manager</h1>
</div>
<li id="accountItem" style="display: none;">
<strong id="accountInfo"></strong>
<small><a href="#" id="detailLink">Details</a></small>
<small><a href="#" id="editLink">Edit</a></small>
<small><a href="#" id="deactivateLink">Deactivate</a></small>
</li>
<option id="optionItem"></option>
<div class="row">

    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title"></h2>
            </div>
            <div class="panel-body">
                <ul class="list-unstyled" id="listAccount">

                </ul>
                <a style="float:right;" id="btnAdd">Add</a>
            </div>
        </div>
    </div>
    <!-- ko if:detail() -->
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">Detail</h2>
            </div>
            <table class="table">
                <tr><td>Account ID</td><td id="accountID"></td></tr>
                <tr><td>Full Name</td><td id="fullName"></td></tr>
                <tr><td>Password</td><td id="password"></td></tr>
                <tr><td>Status</td><td id="status"></td></tr>
                <tr><td>Role</td><td id="role"></td></tr>
                <tr><td>Email</td><td id="email"></td></tr>
                <tr><td>Birthday</td><td id="birthday"></td></tr>
                <tr><td>Phone</td><td id="phone"></td></tr>
                <tr><td>Gender</td><td id="gender"></td></tr>
            </table>
        </div>
    </div>
    <!-- /ko -->
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <label style="text-align:start;" for="inputTitle" id="lblAction">Add User</label>
            </div>

            <div class="panel-body">
                <aside class="form-horizontal">
                    

                    <div class="form-group">
                        <label style="text-align:start;" class="col-sm-4 control-label">Account ID</label>
                        <div class="col-sm-8">
                            <input  type="text" class="form-control warning" id="txtAccountID" required name="Id"/>
                        </div>

                        <label style="text-align:start;"  class="col-sm-4 control-label">Full Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="txtFullName" required name="FullName"/>
                        </div>

                        <label style="text-align:start;"  class="col-sm-4 control-label">Password</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="txtPassword" required name="Password"/>
                        </div>
                        <label style="text-align:start;"  class="col-sm-4 control-label">Status</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="lstStatus" required name="StatusId"></select>
                        </div>
                        <label style="text-align:start;" class="col-sm-4 control-label">Role</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="lstRole" required name="RoleId"></select>
                        </div>
                         <label style="text-align:start;"  class="col-sm-4 control-label">Email</label>
                        <div class="col-sm-8">
                            <input type="email"  class="form-control" id="txtEmail" required name="Email"/>
                        </div>
                         <label style="text-align:start;" class="col-sm-4 control-label">Birthday</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="txtBirthday"  required name="Birthday"/>
                        </div>
                        <label style="text-align:start;"  class="col-sm-4 control-label">Phone</label>
                        <div class="col-sm-8">
                            <input type="tel" class="form-control" id="txtPhone" required name="Phone"/>
                        </div>
                        <label style="text-align:start;"  class="col-sm-4 control-label">Gender</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="lstGender" required name="Gender">
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        
                    </div>
                    <button type="submit" id="button" style="float: right">Save</button>
                </aside>
            </div>
        </div>
    </div>
    <asp:GridView ID="gvCourses" runat="server">
    </asp:GridView>
</div>
    
</asp:Content>

