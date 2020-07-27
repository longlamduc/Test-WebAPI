<%@ Page Title="Management Page" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="ClassManagerPage.aspx.cs" Inherits="SchoolManagementSystem_SE1405.CourseManagePage" Async="true"%>

<asp:Content ID="PageHeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        function getAllClasses() {
            $.getJSON("api/classes", function (data) {
                $('#listClass').empty();
                $.each(data, function (key, value) {
                    var item = $('#classItem').clone();
                    item.show();
                    /*console.log(value);*/
                    item.find("#classInfo").text(value.Id + " - " + value.CourseId);
                    item.find("#detailLink").on('click', function () {
                        showClassDetail(value);
                    });

                    item.find('#editLink').on('click', function () {
                        showClassDetail(value);
                        $('#lblAction').text('Edit class');
                        $('#txtClassID').attr('disabled', 'disabled');
                        $('#txtClassID').val(value.Id);
                        $('#txtDuration').val(value.Duration);
                        $('#txtStartDate').val(value.StartDate);
                        $('#txtEndDate').val(value.EndDate);
                        $('#lstCourse').val(value.CourseId);
                        $('#txtFullName').val(value.Account.FullName);
                        $('#lstStatus').val(value.StatusId);
                    });

                    $('#listClass').append(item);
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
        function getAllAccount() {
            $.getJSON("api/accounts", function (data) {
                $.each(data, function (key, value) {
                    var item = $('#optionItem').clone();
                    item.val(value.Id);
                    item.text(value.FullName);
                    $('#lstAccount').append(item);
                });
            });
        }
        function getAllCourses() {
            $.getJSON("api/courses", function (data) {
                $.each(data, function (key, value) {
                    console.log(value);
                    var item = $('#optionItem').clone();
                    item.val(value.Id);
                    item.text(value.CourseName);
                    $('#lstCourse').append(item);
                });
            });
        }

        function showClassDetail(item) {
            $('#classID').text(item.Id);
            $('#duration').text(item.Duration);
            $('#startDate').text(item.StartDate);
            $('#endDate').text(item.EndDate);
            $('#courseName').text(item.CourseId);
            $('#fullName').text(item.Account.FullName);
            $('#status').text(item.Status.StatusName);
        }

        function validateForm() {
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
            /*if (validateResult == true) {
                alert('submit');
                $('form').submit();
                
            }*/
        }

        $(document).ready(function () {
            getAllClasses();
            getAllStatus();
            getAllCourses();
            getAllAccount();
            $('form').attr('method', 'POST');
            $('form').attr('action', 'api/classes');

            $('#btnAdd').on('click', function () {
                $('#lblAction').text('Add class');
                $('form :input').val('');
                $('form').attr('method', 'POST');
                $('form').attr('action', 'api/classes');
                $('#txtClassID').removeAttr('disabled');
            });

            $("form").on("submit", function (ev) {
                ev.preventDefault();

                if ($('#lblAction').text().indexOf('Add') >= 0) {
                    $.post("api/classes/", $(this).serialize(), function (data, status) {
                        alert("Data: " + data + "\nStatus: " + status);
                            getAllClasses();
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
                    console.log('https://localhost:44335/api/classes/' + $('#txtClassID').val());
                    console.log(JSON.stringify({ "Id": $('#txtClassID').val(), "Duration": $('#txtDuration').val(), "StartDate": $('#txtStartDate').val(), "EndDate": $('#txtEndDate').val(), "CourseId": $('#lstCourse').val(), "AccountId": $('#lstAccount').val(), "StatusId": $('#lstStatus').val(), }));
                    $.ajax({
                        url: 'https://localhost:44335/api/classes/' + $('#txtClassID').val(),
                        type: 'PUT',
                        dataType: 'json',
                        contentType: "application/json; charset=utf-8",
                        async: false,
                        data: JSON.stringify({ "Id": $('#txtClassID').val(), "Duration": $('#txtDuration').val(), "StartDate": $('#txtStartDate').val(), "EndDate": $('#txtEndDate').val(), "CourseId": $('#lstCourse').val(), "AccountId": $('#lstAccount').val(), "StatusId": $('#lstStatus').val(), }),
                        success: function (data, status) {                           
                            alert("Data: " + data + "\nStatus: " + status);
                            console.log(status == 'success');
                            getAllClasses();
                        },
                        error: function (jqXhr, textStatus, errorMessage) { // error callback 
                            alert('Error PUT: ' + errorMessage);
                            console.log($(this).serialize());
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
    <h1>Class Manager</h1>
</div>
<li id="classItem" style="display: none;">
<strong id="classInfo"></strong>
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
                <ul class="list-unstyled" id="listClass">

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
                <tr><td>Class ID</td><td id="classID"></td></tr>
                <tr><td>Duration</td><td id="duration"></td></tr>
                <tr><td>Start Date</td><td id="startDate"></td></tr>
                <tr><td>End Date</td><td id="endDate"></td></tr>
                <tr><td>Course Name</td><td id="courseName"></td></tr>
                <tr><td>Teacher</td><td id="fullName"></td></tr>
                <tr><td>Status</td><td id="status"></td></tr>
            </table>
        </div>
    </div>
    <!-- /ko -->
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <label style="text-align:start;" id="lblAction">Add Class</label>
            </div>

            <div class="panel-body">
                <aside class="form-horizontal">
                    

                    <div class="form-group">
                        <label style="text-align:start;" class="col-sm-4 control-label">Class Id</label>
                        <div class="col-sm-8">
                            <input  type="text" class="form-control warning" id="txtClassID" required maxlength="6" name="Id"/>
                        </div>

                        <label style="text-align:start;"  class="col-sm-4 control-label">Duration</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="txtDuration" required name="Duration"/>
                        </div>

                        <label style="text-align:start;"  class="col-sm-4 control-label">Start Date</label>
                        <div class="col-sm-8">
                            <input type="datetime-local" class="form-control" id="txtStartDate" required name="StartDate"/>
                        </div>

                        <label style="text-align:start;" class="col-sm-4 control-label">End Date</label>
                        <div class="col-sm-8">
                            <input type="datetime-local"  class="form-control" id="txtEndDate"  required name="EndDate"/>
                        </div>
                         <label style="text-align:start;"  class="col-sm-4 control-label">Course Name</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="lstCourse"  required name="CourseId"></select>
                        </div>
                         <label style="text-align:start;"  class="col-sm-4 control-label">Teacher</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="lstAccount" required name="FullName"></select>
                        </div>
                        <label style="text-align:start;"  class="col-sm-4 control-label">Status</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="lstStatus" required name="StatusId"></select>
                        </div>
                    </div>
                    <button type="submit" id="button" onclick="validateForm()" style="float: right">Save</button>
                </aside>
            </div>
        </div>
    </div>
</div>
    
</asp:Content>

