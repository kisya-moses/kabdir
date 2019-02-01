<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/AddUser.aspx.cs" Inherits="WebPortal.Admin.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
    <div id="content">
        <b>
            <asp:Literal ID="msg" runat="server" />
        </b>
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <%--                    <button type="button" data-toggle="tooltip" title="" onclick="$('#filter-customer').toggleClass('hidden-sm hidden-xs');" class="btn btn-default hidden-md hidden-lg" data-original-title="Filter"><i class="fa fa-filter"></i></button>
                    <a href="AddOrder" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add New"><i class="fa fa-plus"></i></a>--%>
                    <asp:Button runat="server" Text="Save"
                        CssClass="btn btn-primary"
                        ID="AddUserBtn" OnClick="AddUserBtn_Click" />
                    <%--                    <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" onclick="confirm('Are you sure?') ? $('#form-customer').submit() : false;" data-original-title="Cancel"><i class="fa fa-trash-o"></i></button>--%>
                </div>
                <h1>Sales</h1>
                <ul class="breadcrumb">
                    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                    <li><a href="#">Add User</a></li>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-9 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-list"></i>Add User</h3>
                        </div>
                        <div class="panel-body">
                            
                               
                                    <asp:HiddenField runat="server" ID="UserID" />
                                    
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="FName" MaxLength="15"
                                            placeholder="First Name" CssClass="form-control">
                                        </asp:TextBox>
                                        <label for="FName">First Name</label>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="LName" MaxLength="15" CssClass="form-control"  />
                                        <label for="LName">Other Name(s)</label>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="Email"
                                            placeholder="Email Address" CssClass="form-control" type="Email">
                                        </asp:TextBox>
                                        <label for="Email">Email Address</label>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="PhoneNo"
                                            placeholder="Phone"
                                            CssClass="form-control" type="tel">
                                        </asp:TextBox>
                                        <label for="Phone">Phone</label>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="Gender">
                                            <asp:ListItem Text="MALE" Value="MALE" />
                                            <asp:ListItem Text="FEMALE" Value="FEMALE" />
                                        </asp:DropDownList>
                                        <label style="top: -52%" for="Gender">Gender</label>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList runat="server" OnTextChanged="Country_SelectedIndexChanged"
                                            ID="Country" OnSelectedIndexChanged="Country_SelectedIndexChanged" AutoPostBack="true"
                                            CssClass="form-control">
                                        </asp:DropDownList>
                                        <label style="top: -52%" for="Country">District</label>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList runat="server" OnSelectedIndexChanged="Region_SelectedIndexChanged"
                                            ID="Region" AutoPostBack="true"
                                            Style="top: -52%"
                                            CssClass="form-control">
                                        </asp:DropDownList>
                                        <label for="Region" style="top: -52%">Division</label>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList runat="server"
                                            ID="District"
                                            CssClass="form-control"
                                            Style="top: -52%">
                                        </asp:DropDownList>
                                        <label for="District" style="top: -52%">District</label>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList ID="UserRoles" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <label for="UserRoles" style="top: -52%">Roles</label>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList ID="IsActivated" runat="server" CssClass="form-control" Style="top: -52%">
                                            <asp:ListItem Value="1">YES</asp:ListItem>
                                            <asp:ListItem Value="0" Selected="True">NO</asp:ListItem>
                                        </asp:DropDownList>
                                        <label for="UserActive" style="top: -52%">Is Active</label>
                                    </div>
                             
                        </div>
                        <!-- Form -->
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
