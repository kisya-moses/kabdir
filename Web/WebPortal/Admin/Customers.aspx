<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/Admin/Customers.aspx.cs" MasterPageFile="~/MainTpl.Master" Inherits="WebPortal.Admin.Customers" %>

<asp:Content ContentPlaceHolderID="TemplateData" runat="server">
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="button" data-toggle="tooltip" title="" onclick="$('#filter-customer').toggleClass('hidden-sm hidden-xs');" class="btn btn-default hidden-md hidden-lg" data-original-title="Filter"><i class="fa fa-filter"></i></button>
                    <a href="AddCustomer" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add New"><i class="fa fa-plus"></i></a>
                    <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" onclick="confirm('Are you sure?') ? $('#form-customer').submit() : false;" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>
                </div>
                <h1>Customers</h1>
                <ul class="breadcrumb">
                    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                    <li><a href="#">Customers</a></li>
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
                                <label class="control-label" for="input-name">Customer Name</label>                                
                                    <input type="text" name="filter_name" value="" placeholder="Customer Name" id="input-name" class="form-control" autocomplete="off">                                
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-email">E-Mail</label>
                                <input type="text" name="filter_email" value="" placeholder="E-Mail" id="input-email" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-ip">IP</label>
                                <input type="text" name="filter_ip" value="" placeholder="IP" id="input-ip" class="form-control">
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
                            <div class="form-group text-right">
                                <button type="button" id="button-filter" class="btn btn-default"><i class="fa fa-filter"></i>Filter</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-md-pull-3 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-list"></i>Customer List</h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <asp:GridView ClientIDMode="Static" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" CssClass="table table-bordered table-hover">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="NAME">
                                            <ItemTemplate>
                                                <%#Eval("FName")%>&nbsp; <%#Eval("LName")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Phone" HeaderText="PHONE NUMBER" />
                                        <asp:BoundField DataField="Email" HeaderText="EMAIL" />
                                        <asp:BoundField DataField="RecordDate" HeaderText="CREATED ON" />
                                        <asp:TemplateField HeaderText="ADDRESS">
                                            <ItemTemplate>
                                                <%#Eval("District")%>&nbsp;, <%#Eval("Division")%><br />
                                                <%#Eval("Address1")%>&nbsp;, <%#Eval("Address2")%><br />
                                                <%#Eval("Postcode")%><br />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ACTION">
                                            <ItemTemplate>
                                                <a class="btn btn-danger btn-sm" href="Customers.aspx?Delete=<%#Eval("CID")%>">Delete</a>
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
