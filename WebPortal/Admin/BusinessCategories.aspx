﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/BusinessCategories.aspx.cs" Inherits="WebPortal.Admin.BusinessCategories" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <%-- 
                    <button type="submit" form="form-user"  
                    class="btn btn-primary"><i class="fa fa-save"></i></button>
                --%>
                <asp:Button runat="server" ID="EditProfile"
                    data-toggle="tooltip" title="Save"
                    CssClass="btn btn-primary"
                    Text="Update Profile" OnClick="EditProfile_Click" />
                <a href="#" data-toggle="tooltip" title="Cancel" class="btn btn-default">
                    <i class="fa fa-reply"></i>
                </a>
            </div>
            <h1>All Agri Businesses Categories</h1>
            <ul class="breadcrumb">
                <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                <li><a href="#">Businesses Categories</a></li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="alert alert-success alert-dismissible">
            <i class="fa fa-check-circle"></i>Success: You have modified your profile!
             <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i>Business Categories</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <hr />
                    <a class="btn btn-success btn-sm" href="AddBusinessCategory.aspx">
                        <i class="fa fa-plus"></i> Add
                    </a>
                    <hr />
                    <asp:GridView ClientIDMode="Static" ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" CssClass="table table-hover">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="ACTIONS">
                                <ItemTemplate>
                                    <img src="<%#Eval("BusinessLogo") %>" alt="Logo" class="logo" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="BUSINESS CATEGORY" />
                            <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" />
                            <asp:BoundField DataField="RecordDate" HeaderText="DATE CREATED" />
                            <asp:TemplateField HeaderText="ACTIONS">
                                <ItemTemplate>
                                    <a class="btn btn-danger btn-sm" href="BusinessesCategories.aspx?Delete=<%#Eval("ID")%>">Delete</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" Font-Size="Small" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
