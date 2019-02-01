<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/Profile.aspx.cs" Inherits="WebPortal.Referee.Profile" %>

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
            <h1></h1>
            <ul class="breadcrumb">
                <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                <li><a href="#">Profile</a></li>
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
                <h3 class="panel-title"><i class="fa fa-pencil"></i>Edit Profile</h3>
            </div>
            <div class="panel-body">
                <form id="form-user" class="form-horizontal">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-username">Username</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" name="username" value="" placeholder="First Name" ID="UName"  class="form-control" />
                            <%--                            
                                <input type="text" name="username" value="admin" placeholder="Username" id="input-username" class="form-control" />
                            --%>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-firstname">First Name</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" name="firstname" value="" placeholder="First Name" ID="FName"  class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-lastname">Last Name</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" name="username" value="" placeholder="First Name" ID="LName"  class="form-control" />
<%--                            <input type="text" name="lastname" value="Doe" placeholder="Last Name" id="input-lastname" class="form-control" />--%>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email">E-Mail</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" value="" placeholder="First Name" ID="Email"  class="form-control" />
                            <%--<input type="text" name="email" value="doopisoft@outlook.com" placeholder="E-Mail" id="input-email" class="form-control" />--%>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email">Phone Number</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" value="" placeholder="First Name" ID="Phone"  class="form-control" />
                            <%--<input type="text" name="email" value="doopisoft@outlook.com" placeholder="E-Mail" id="input-email" class="form-control" />--%>
                        </div>
                    </div>

                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-password">Gender</label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" ID="Gender">
                                <asp:ListItem Text="MALE" Value="MALE" />
                                <asp:ListItem Text="FEMALE" Value="FEMALE" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group required">
                        <label class="col-sm-2 control-label">District</label>
                        <div class="col-sm-10">
                            <%--                            
                                <input type="password" name="confirm" value="" 
                                placeholder="Confirm" id="input-confirm" class="form-control" />
                            --%>
                            <asp:DropDownList runat="server" ID="District">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label">Division</label>
                        <div class="col-sm-10">
                            <%--                            
                                <input type="password" name="confirm" value="" 
                                placeholder="Confirm" id="input-confirm" class="form-control" />
                            --%>
                            <asp:DropDownList runat="server" ID="Division">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label">Address [street, Plot No.]</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" type="text" value="" 
                                placeholder="First Name" ID="Address" class="form-control" />
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</asp:Content>
