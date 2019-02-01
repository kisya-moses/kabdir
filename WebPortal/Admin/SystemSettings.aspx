<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/SystemSettings.aspx.cs" Inherits="WebPortal.Admin.SystemSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="button" data-toggle="tooltip" title="" onclick="$('#filter-customer').toggleClass('hidden-sm hidden-xs');" class="btn btn-default hidden-md hidden-lg" data-original-title="Filter"><i class="fa fa-filter"></i></button>
                    <a href="AddOrder" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add New"><i class="fa fa-plus"></i></a>
                    <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" onclick="confirm('Are you sure?') ? $('#form-customer').submit() : false;" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>
                </div>
                <h1>Sales</h1>
                <ul class="breadcrumb">
                    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                    <li><a href="#">Orders</a></li>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-9 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-list"></i>Order List</h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <asp:GridView ID="TaskGridView" runat="server"
                                    AllowPaging="True"
                                    OnRowEditing="TaskGridView_RowEditing"
                                    OnRowCancelingEdit="TaskGridView_RowCancelingEdit"
                                    OnRowUpdating="TaskGridView_RowUpdating"
                                    OnPageIndexChanging="TaskGridView_PageIndexChanging" 
                                    CellPadding="4" CssClass="table table-hover" 
                                    ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField CausesValidation="False" InsertVisible="False" ShowCancelButton="False"  ShowEditButton="True" />
                                    </Columns>
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <EditRowStyle BackColor="SlateBlue" ForeColor="Red" BorderColor="Blue" Font-Italic="true" CssClass="text-right" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
