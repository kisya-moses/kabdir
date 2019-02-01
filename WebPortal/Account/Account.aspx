<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndTpl.master" AutoEventWireup="true" CodeBehind="~/Account/Account.aspx.cs" Inherits="WebPortal.Account.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>default"><i class="fa fa-home"></i></a></li>
    <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/account">My Account</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentP" runat="server">
    <div id="content" class="col-sm-9">
        <h2>My Account</h2>
        <ul class="list-unstyled">
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/edit">Edit Account</a></li>
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/password">Password</a></li>
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/address">Address Book</a></li>
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/wishlist">Wish List (%s)</a></li>
        </ul>
        <h2>My Orders</h2>
        <ul class="list-unstyled">
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/order">Order History</a></li>
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/download">Downloads</a></li>
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/reward">Reward Points</a></li>
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/return">Returns</a></li>
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/transaction">Transactions</a></li>
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/recurring">Payment Profile</a></li>
        </ul>
        <h2>Newsletter</h2>
        <ul class="list-unstyled">
            <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>account/newsletter">Newsletter</a></li>
        </ul>
    </div>
</asp:Content>
