<%@ Page Title="Assessments" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/Orders.aspx.cs" Inherits="WebPortal.Admin.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="button" data-toggle="tooltip" title="" 
                        class="btn btn-default hidden-md hidden-lg" 
                        data-original-title="Filter"><i class="fa fa-filter"></i></button>
                    <a href="Admin/AddOrder.aspx" data-toggle="tooltip" title="" 
                        class="btn btn-primary" data-original-title="Add New">
                        <i class="fa fa-plus"></i></a>
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
                <div id="filter-customer" class="col-md-3 col-md-push-9 col-sm-12 hidden-sm hidden-xs">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-filter"></i>Filters</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="control-label" for="input-order-id">Order ID</label>
                                <input type="text" name="filter_order_id" value="" placeholder="Order ID" id="input-order-id" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-customer">Customer</label>
                                <input type="text" name="filter_customer" value="" placeholder="Customer" id="input-customer" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-order-status">Order Status</label>
                                <select name="filter_order_status_id" id="input-order-status" class="form-control">
                                    <option value=""></option>
                                    <option value="0">Missing Orders</option>
                                    <option value="7">Canceled</option>
                                    <option value="9">Canceled Reversal</option>
                                    <option value="13">Chargeback</option>
                                    <option value="5">Complete</option>
                                    <option value="8">Denied</option>
                                    <option value="14">Expired</option>
                                    <option value="10">Failed</option>
                                    <option value="1">Pending</option>
                                    <option value="15">Processed</option>
                                    <option value="2">Processing</option>
                                    <option value="11">Refunded</option>
                                    <option value="12">Reversed</option>
                                    <option value="3">Shipped</option>
                                    <option value="16">Voided</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-total">Total</label>
                                <input type="text" name="filter_total" value="" placeholder="Total" id="input-total" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-date-added">Date Added</label>
                                <div class="input-group date">
                                    <input type="text" name="filter_date_added" value="" placeholder="Date Added" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control">
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-date-modified">Date Modified</label>
                                <div class="input-group date">
                                    <input type="text" name="filter_date_modified" value="" placeholder="Date Modified" data-date-format="YYYY-MM-DD" id="input-date-modified" class="form-control">
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group text-right">
                                <button type="button" id="button-filter" class="btn btn-default"><i class="fa fa-filter"></i>Filter</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-md-pull-3 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-list"></i>Order List</h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <asp:GridView ClientIDMode="Static" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" CssClass="table table-bordered table-hover">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="ITEM">
                                            <ItemTemplate>
                                                <%#Eval("ProductName")%>&nbsp; <%#Eval("BusinessName")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                                        <asp:BoundField DataField="StatusDescription" HeaderText="Status" />
                                        <asp:BoundField DataField="RecordDate" HeaderText="Date Created" />
                                        <asp:BoundField DataField="ModifiedDate" HeaderText="Date Modified" />
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <a class="btn btn-danger btn-sm" href="Orders.aspx?Delete=<%#Eval("OrderID")%>">Delete</a>
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
            </div>
        </div>
        <script type="text/javascript"><!--
            $('.date').datetimepicker({
                language: 'en-gb',
                pickTime: false
            });
            //-->
        </script>
    </div>

</asp:Content>
