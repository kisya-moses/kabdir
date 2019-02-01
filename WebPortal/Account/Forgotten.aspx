<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndTpl.master" AutoEventWireup="true" CodeBehind="~/Account/Forgotten.aspx.cs" Inherits="WebPortal.Account.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>default">
        <i class="fa fa-home"></i></a>
    </li>
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/account">My Account</a></li>
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/forgotten">Forgot Password</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentP" runat="server">
    <div class="md-form text-danger text-uppercase">
        <asp:Literal ID="msg" runat="server" Text="Enter the Email You Use Here." />
    </div>
    <h1>Account</h1>
    <div id="content" class="col-sm-9">
        <asp:PlaceHolder ID="Reset1" runat="server">
            <p>Enter the e-mail address associated with your account. Click submit to have a password reset link e-mailed to you.</p>
            <div class="form-horizontal">
                <fieldset>
                    <legend>Your E-Mail Address Or Username</legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email">E-Mail Address/Username</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server"
                                ID="uname"
                                placeholder="Username or E-mail"
                                CssClass="form-control">
                            </asp:TextBox>
                        </div>
                    </div>
                </fieldset>
                <div class="buttons clearfix">
                    <div class="pull-right">
                        <asp:Button ID="btnContinue" runat="server" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </asp:PlaceHolder>
        <asp:PlaceHolder ID="Reset2" runat="server">
                <p>RESET PASSWORD</p>
                <form runat="server" id="form003" class="form-horizontal">
                    <fieldset>
                        <legend>Your Password</legend>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-email">Password</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server"
                                    ID="pwd1" TextMode="Password"
                                    placeholder="Password"
                                    CssClass="form-control">
                                </asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-email">Confirm Password</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server"
                                    ID="pwd2" TextMode="Password"
                                    placeholder="Confirm Password"
                                    CssClass="form-control">
                                </asp:TextBox>
                            </div>
                        </div>
                    </fieldset>
                    <div class="buttons clearfix">
                        <div class="pull-right">
                            <asp:Button ID="ResetPwd" OnClick="ResetPwd_Click" runat="server" Text="Reset" />
                        </div>
                    </div>
                </form>
        </asp:PlaceHolder>
    </div>
</asp:Content>
