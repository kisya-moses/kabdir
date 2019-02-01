<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainTpl.Master" CodeBehind="uLogin.aspx.cs" Inherits="WebPortal.uLogin" %>

<asp:Content ContentPlaceHolderID="TemplateData" runat="server">
    <div id="content">
        <div class="container-fluid">
            <br>
            <br>
            <div class="row">
                <div class="col-sm-offset-4 col-sm-4">
                    <div class="alert alert-success alert-dismissible">
                        <i class="fa fa-check-circle"></i><asp:Literal runat="server" ID="msg" />
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title"><i class="fa fa-lock"></i> Please enter your login details.</h1>
                        </div>
                        <div class="panel-body">
                            <asp:PlaceHolder ID="Login" runat="server">
                                <div class="form-group">
                                    <label for="input-username">Username</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <asp:TextBox runat="server" ID="uname"
                                            placeholder="Username or E-mail" CssClass="form-control">
                                        </asp:TextBox>
                                        <%--                                        
                                            <input type="text" name="username" value="" placeholder="Username" id="input-username" class="form-control">
                                        --%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="input-password">Password</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <asp:TextBox runat="server"
                                            TextMode="Password"
                                            placeholder="Password"
                                            ID="pwd" CssClass="form-control">
                                        </asp:TextBox>
                                    </div>
                                    <span class="help-block"><a href="ResetAccount.aspx">Forgotten Password</a></span>
                                </div>
                                <div class="text-right">
                                    <asp:Button runat="server" CssClass="btn btn-primary btn-block" Text="Login" OnClick="Loginbtn_Click" />
                                </div>
                            </asp:PlaceHolder>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#column-left').hide(); $("#content").css({ "margin-left": "0" });
        $(".nav.navbar-nav.navbar-right").css({ "visibility": "hidden" });
    </script>
</asp:Content>
