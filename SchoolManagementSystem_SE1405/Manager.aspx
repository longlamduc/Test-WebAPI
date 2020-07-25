<%@ Page Title="Management Page" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="SchoolManagementSystem_SE1405.Manager" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
    <h1>Course Manager</h1>
</div>

<div class="row">

    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title"></h2>
            </div>
            <div class="panel-body">
                <ul class="list-unstyled" data-bind="foreach: books">
                    <li>
                        <strong><span data-bind="text: AuthorName"></span></strong>: <span data-bind="text: Title"></span>
                        <small><a href="#" data-bind="click: $parent.getBookDetail">Details</a></small>
                        <small><a href="#" data-bind="click: $parent.getBookDetail">Edit</a></small>
                        <small><a href="#" data-bind="click: $parent.getBookDetail">Delete</a></small>
                    </li>
                </ul>
                <a style="float:right;" href="#" data-bind="click: $parent.getBookDetail">Add</a>
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
                <tr><td>Course ID</td><td data-bind="text: detail().AuthorName"></td></tr>
                <tr><td>Course Name</td><td data-bind="text: detail().Title"></td></tr>
                <tr><td>Description</td><td data-bind="text: detail().Year"></td></tr>
                <tr><td>Semester</td><td data-bind="text: detail().Genre"></td></tr>
                <tr><td>Total Lesson</td><td data-bind="text: detail().Price"></td></tr>
                <tr><td>Total Credit</td><td data-bind="text: detail().Price"></td></tr>
                <tr><td>Status</td><td data-bind="text: detail().Price"></td></tr>
            </table>
        </div>
    </div>
    <!-- /ko -->
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <asp:Label ID="lblTitleName" runat="server" Text="Label" Font-Size="Large"></asp:Label>
            </div>

            <div class="panel-body">
                <aside class="form-horizontal" data-bind="submit: addBook">
                    

                    <div class="form-group" data-bind="with: newBook">
                        <label style="text-align:start;" for="inputTitle" class="col-sm-4 control-label">Course Id</label>
                        <div class="col-sm-8">
                            <input  type="text" class="form-control" id="txtCourseID" data-bind="value:Title" />
                        </div>

                        <label style="text-align:start;" for="inputYear" class="col-sm-4 control-label">Course Name</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="txtCourseName" data-bind="value:Year" />
                        </div>

                        <label style="text-align:start;" for="inputGenre" class="col-sm-4 control-label">Description</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="txtDescription" data-bind="value:Genre" />
                        </div>

                        <label style="text-align:start;" for="inputPrice" class="col-sm-4 control-label">Semester</label>
                        <div class="col-sm-8">
                            <input type="number" step="any" class="form-control" id="txtSemester" data-bind="value:Price" />
                        </div>
                         <label style="text-align:start;" for="inputPrice" class="col-sm-4 control-label">Total Lesson</label>
                        <div class="col-sm-8">
                            <input type="number" step="any" class="form-control" id="txtTotalLesson" data-bind="value:Price" />
                        </div>
                         <label style="text-align:start;" for="inputPrice" class="col-sm-4 control-label">Total Credit</label>
                        <div class="col-sm-8">
                            <input type="number" step="any" class="form-control" id="txtTotalCredit" data-bind="value:Price" />
                        </div>
                        <label style="text-align:start;" for="inputPrice" class="col-sm-4 control-label">Status ID</label>
                        <div class="col-sm-8">
                            <input type="number" step="any" class="form-control" id="txtStatusID" data-bind="value:Price" />
                        </div>
                    </div>
                    <asp:Button style="float:right;" ID="btnSubmit  " runat="server" Text="Save" />
                </aside>
            </div>
        </div>
    </div>
</div>
    
</asp:Content>

