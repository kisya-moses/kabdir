<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/UserManagement.aspx.cs" Inherits="WebPortal.Admin.UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <%-- 
                    <button type="submit" form="form-user"  
                    class="btn btn-primary"><i class="fa fa-save"></i></button>
                --%>
                <%if (HttpContext.Current.User.IsInRole("SUPERADMIN")||HttpContext.Current.User.IsInRole("ADMIN"))
                    {%>
                <a href="admin/AddUser.aspx" class="btn btn-sm btn-primary"><i class="fa fa-plus"></i>Add New User
                </a>
                <%} %>

<%--                <a href="AddUser.aspx"
                    data-toggle="tooltip" title="Add User"
                    class="btn btn-primary"
                    ><i class="fa fa-plus"></i> Add User</a>
                <a href="#" data-toggle="tooltip" title="Cancel" class="btn btn-default">
                    <i class="fa fa-reply"></i>
                </a>--%>
            </div>
            <h1>
                User Management
            </h1>
            <ul class="breadcrumb">
                <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                <li><a href="#">User Management</a></li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
<%--        <div class="alert alert-success alert-dismissible">
            <i class="fa fa-check-circle"></i>
             <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>--%>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> All System Users, AgriBusinesses, Delivery Agents, Administrators</h3>
            </div>
            <div class="panel-body">
<%--                <h5 class="text-center">Manage User Accounts [ ADD, ACTIVATE, DEACTIVATE, DELETE ]</h5>--%>
                <hr />
                <b class="text-success">
                    <asp:Literal runat="server" ID="Message" />
                </b>
                <asp:GridView ClientIDMode="Static" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-hover">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="FullName" HeaderText="FULL NAME" />
                        <%--<asp:BoundField DataField="Username" />--%>
                        <asp:BoundField DataField="District" HeaderText="DISTRICT" />
                        <asp:BoundField DataField="Gender" HeaderText="GENDER" />
                        <asp:BoundField DataField="UserType" HeaderText="TYPE" />
                        <asp:BoundField DataField="Email" HeaderText="EMAIL" />
                        <asp:BoundField DataField="DateCreated" HeaderText="DATE CREATED" />
                        <%--<asp:BoundField DataField="LastLoginDate" />--%>
                        <asp:TemplateField HeaderText="ACTIONS">
                            <ItemTemplate>
                                <a href="AddUser.aspx?EDIT=<%# Eval("id_") %>" class="btn btn-sm btn-default my-4 waves-effect"><i class="fa fa-edit"></i>EDIT </a>
                                <a href="?SWITCH=<%# Eval("id_") %>&RL=<%# Eval("RoleID") %>" class="btn btn-sm my-4 waves-effect btn-<%#Eval("Activated").ToString() == "1" ? "warning" : "success" %>">
                                    <%#Eval("Activated").ToString() == "1" ? "DEACTIVATE" : "ACTIVATE" %>
                                </a>
                                <a href="?DEL=<%# Eval("id_") %>" class="btn btn-sm btn-danger my-4 waves-effect">
                                    <i class="fa fa-trash-o"></i>DELETE
                                </a>
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
</asp:Content>
