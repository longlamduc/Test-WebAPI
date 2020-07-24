<%@ Page Title="Management Page" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="SchoolManagementSystem_SE1405.Manager" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
    <h1>BookService</h1>
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
                <tr><td>Author</td><td data-bind="text: detail().AuthorName"></td></tr>
                <tr><td>Title</td><td data-bind="text: detail().Title"></td></tr>
                <tr><td>Year</td><td data-bind="text: detail().Year"></td></tr>
                <tr><td>Genre</td><td data-bind="text: detail().Genre"></td></tr>
                <tr><td>Price</td><td data-bind="text: detail().Price"></td></tr>
            </table>
        </div>
    </div>
    <!-- /ko -->

    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">Add Book</h2>
            </div>

            <div class="panel-body">
                <aside class="form-horizontal" data-bind="submit: addBook">
                    <div class="form-group">
                        <label for="inputAuthor" class="col-sm-2 control-label">Author</label>
                        <div class="col-sm-10">
                            <select data-bind="options:authors, optionsText: 'Name', value: newBook.Author"></select>
                        </div>
                    </div>

                    <div class="form-group" data-bind="with: newBook">
                        <label for="inputTitle" class="col-sm-2 control-label">Title</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputTitle" data-bind="value:Title" />
                        </div>

                        <label for="inputYear" class="col-sm-2 control-label">Year</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="inputYear" data-bind="value:Year" />
                        </div>

                        <label for="inputGenre" class="col-sm-2 control-label">Genre</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputGenre" data-bind="value:Genre" />
                        </div>

                        <label for="inputPrice" class="col-sm-2 control-label">Price</label>
                        <div class="col-sm-10">
                            <input type="number" step="any" class="form-control" id="inputPrice" data-bind="value:Price" />
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </aside>
            </div>
        </div>
    </div>
</div>
    
</asp:Content>

