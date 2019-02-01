<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/AuditLogs.aspx.cs" Inherits="WebPortal.Admin.Performance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
    <div class="page-header">
        <div class="container-fluid">
            <h1>Audit Trail</h1>
            <ul class="breadcrumb">
                <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                <li><a href="#">Audit Trail</a></li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="alert alert-success alert-dismissible">
            <i class="fa fa-check-circle"></i>Success: MSG
             <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i>Audit Trail</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <hr />
                    <asp:GridView ClientIDMode="Static" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" CssClass="table table-hover">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ActionType" HeaderText="ACTION" />
                            <asp:BoundField DataField="ActionDescription" HeaderText="DETAILS" />
                            <asp:BoundField DataField="ActionDate" HeaderText="DATE" />
<%--                            <asp:TemplateField HeaderText="ACTIONS">
                                <ItemTemplate>
                                    <a class="btn btn-danger btn-sm" href="Businesses.aspx?Delete=<%#Eval("ID")%>">Delete</a>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
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
