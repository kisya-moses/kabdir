﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/AddBusiness.aspx.cs" Inherits="WebPortal.Admin.AddBusiness" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <asp:Button runat="server" ID="EditProfile"
                    data-toggle="tooltip" title="Save"
                    CssClass="btn btn-primary"
                    Text="Update Profile" OnClick="EditProfile_Click" />
                <a href="#" data-toggle="tooltip" title="Cancel" class="btn btn-default">
                    <i class="fa fa-reply"></i>
                </a>
            </div>
            <h1>
                All System Users, AgriBusinesses, Delivery Agents, Administrators
            </h1>
            <ul class="breadcrumb">
                <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                <li><a href="#">User Management</a></li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="alert alert-success alert-dismissible">
            <i class="fa fa-check-circle"></i>
            <asp:Literal ID="msg" runat="server" />
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i>Add New Business</h3>
            </div>
            <div class="panel-body">
                <div id="form-user" class="form-horizontal">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-username">Business Name</label>
                        <div class="col-sm-10">
-                            <asp:TextBox runat="server" type="text"  value="" placeholder="Business Name" ID="BName"  class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label">Category</label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="BCategory" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-firstname">Email Address</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" value="" placeholder="Email Address" ID="BEmail"  class="form-control" />
                        </div>
                    </div>

                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email">Phone Number</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" value="" placeholder="Telephone Number" ID="BPhone"  class="form-control" />
                        </div>
                    </div>

                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-lastname">Web Site</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" value="" placeholder="Website" ID="BWebsite"  class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email">Description</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" TextMode="MultiLine" Rows="3" placeholder="Description" ID="BDescription"  class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-image">Logo</label>
                        <div class="col-sm-10">
                            <a href="#" id="thumb-image" data-toggle="image" class="img-thumbnail">
                                <img src="http://localhost:8001/opencart/image/cache/no_image-100x100.png" 
                                    alt="" title="" 
                                    data-placeholder="http://localhost:8001/opencart/image/cache/no_image-100x100.png" /></a>
                            <input type="hidden" name="image" value="" id="input-image" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label">District</label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="District" CssClass="form-control" OnSelectedIndexChanged="District_SelectedIndexChanged" >
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label">Division</label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="Division" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </div>    
</asp:Content>
