<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndTpl.Master" AutoEventWireup="true" CodeBehind="~/Account/Login.aspx.cs" Inherits="WebPortal.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>default"><i class="fa fa-home"></i></a></li>
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/account">Account</a></li>
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/login">Login</a></li>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contentP">
    <div class="row">
        <div class="col-sm-6">
            <div class="well">
                <h2>New Customer</h2>
                <p><strong>Register</strong></p>
                <p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
                <a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/register" class="btn btn-primary">Continue</a>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="well">
                <h2>Returning Customer</h2>
                <p><strong>I am a returning customer</strong></p>
                <div class="alert alert-sm alert-success alert-dismissible">
                    <i class="fa fa-check-circle"></i>
                    <asp:Literal runat="server" ID="msg" />
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <form runat="server" id="Form001" >
                    <div class="form-group">
                        <label class="control-label" for="input-email">E-Mail Address</label>
                        <asp:TextBox runat="server" ID="email" value="" placeholder="E-Mail Address" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="input-password">Password</label>
                        <asp:TextBox TextMode="password" runat="server" placeholder="Password" ID="password" class="form-control" />
                        <a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/forgotten">Forgotten Password</a>
                    </div>
                    <input type="submit" value="Login" class="btn btn-primary">
                    <input type="hidden" name="redirect" value="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/account">
                </form>
            </div>
        </div>
    </div>
</asp:Content>
