<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndTpl.master" AutoEventWireup="true" CodeBehind="~/Account/Register.aspx.cs" Inherits="WebPortal.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>default"><i class="fa fa-home"></i></a></li>
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/register">Register</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentP" runat="server">
    <div id="content" class="col-sm-9">
        <h1>Account</h1>
        <p>If you already have an account with us, please login at the <a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/login">login page</a>.</p>
        <div class="alert alert-sm alert-success alert-dismissible">
            <i class="fa fa-check-circle"></i>
            <asp:Literal runat="server" ID="Msg" />
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <form runat="server" id="form002" class="form-horizontal">
            <fieldset id="account">
                <legend>Your Personal Details</legend>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-firstname">First Name</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="Fname" type="tel" value="" placeholder="first name" class="form-control"/>
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-lastname">Last Name</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="Lname" type="tel" value="" placeholder="last name" class="form-control"/>
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-email">E-Mail</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="Email" type="email" value="" placeholder="E-mail" class="form-control"/>
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-telephone">Telephone</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="Phone" type="tel" value="" placeholder="Telephone" class="form-control"/>
                    </div>
                </div>
            </fieldset>
            <fieldset>
                <legend>Your Password</legend>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-password">Password</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" TextMode="Password" ID="Pwd1" placeholder="Password Confirm" class="form-control" aria-autocomplete="list"/>
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-confirm">Password Confirm</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" TextMode="Password" ID="Pwd2" placeholder="Password Confirm" class="form-control"/>
                    </div>
                </div>
            </fieldset>
            <fieldset>
                <legend>Newsletter</legend>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Subscribe</label>
                    <div class="col-sm-10">
                    <asp:CheckBox runat="server" ID="NewsLetter" CssClass="checkbox-inline" />
<%--                        <label class="radio-inline">
                            <input type="radio" name="newsletter" value="1">
                            Yes</label>
                        <label class="radio-inline">
                            <input type="radio" name="newsletter" value="0" checked="checked">
                            No</label>--%>
                    </div>
                </div>
            </fieldset>
            <div class="buttons">
                <div class="pull-right">
                    I have read and agree to the <a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>privacypolicy" class="agree"><b>Privacy Policy</b></a>
<%--                    <input type="checkbox" name="agree" value="1">--%>
                    <asp:CheckBox runat="server" ID="Agree" />
                    &nbsp;
                    <asp:Button runat="server" ID="RegisterBtn" OnClick="RegisterBtn_Click" CssClass="btn btn-primary" />
<%--            <input type="submit" value="Continue" class="btn btn-primary">--%>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
