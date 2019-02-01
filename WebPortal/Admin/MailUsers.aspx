<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/MailUsers.aspx.cs" Inherits="WebPortal.Admin.NewQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <asp:Button runat="server" ID="EditProfile"
                    data-toggle="tooltip" title="Send Mail To A selected Group Of Users"
                    CssClass="btn btn-primary"
                    Text="Send Mail" OnClick="EditProfile_Click" />
<%--                <a href="#" data-toggle="tooltip" title="" class="btn btn-default" 
                    data-original-title="Cancel"><i class="fa fa-reply"></i></a>            --%>
            </div>
            <h1>Mail</h1>
            <ul class="breadcrumb">
                <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                <li><a href="#">Mail</a></li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="alert alert-success alert-dismissible">
            <i class="fa fa-check-circle"></i><asp:Literal runat="server" ID="Msg" />
             <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-envelope"></i>Mail</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-to">To</label>
                        <div class="col-sm-10">
                            <asp:DropDownList runat="server" CssClass="form-control" ID="ToGroup">
                                <asp:ListItem Text="All Newsletter Subscribers" Value="newsletter" />
                                <asp:ListItem Text="All Customers" Value="customers" />
                                <asp:ListItem Text="All Delivery Agents" Value="delivery" />
                                <asp:ListItem Text="All Registered Business" Value="businesses" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-subject">Subject</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="Subject" CssClass="form-control" placeholder="Subject" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-message">Message</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="Message" TextMode="MultiLine" name="message" placeholder="Message" data-toggle="summernote" data-lang="" CssClass="form-control" />
                        </div>
                    </div>                        
                </div>
            </div>
        </div>
    </div>
    <link href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>js/codemirror/lib/codemirror.css" rel="stylesheet">
    <link href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>js/codemirror/theme/monokai.css" rel="stylesheet">
    <script type="text/javascript" src="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>js/codemirror/lib/codemirror.js"></script>
    <script type="text/javascript" src="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>js/codemirror/lib/xml.js"></script>
    <script type="text/javascript" src="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>js/codemirror/lib/formatting.js"></script>
    <script type="text/javascript" src="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>js/summernote/summernote.js"></script>
    <link href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>js/summernote/summernote.css" rel="stylesheet">
    <script type="text/javascript" src="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>js/summernote/summernote-image-attributes.js"></script>
    <script type="text/javascript" src="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>js/summernote/opencart.js"></script>
    
</asp:Content>
