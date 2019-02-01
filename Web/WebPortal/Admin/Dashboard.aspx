<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/Dashboard.aspx.cs" Inherits="WebPortal.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
            </div>
            <h1>Dashboard</h1>
            <ul class="breadcrumb">
                <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                <li><a href="Dashboard">Dashboard</a></li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="tile tile-primary">
                    <div class="tile-heading">
                        Total Orders <span class="pull-right">0%</span>
                    </div>
                    <div class="tile-body">
                        <i class="fa fa-shopping-cart"></i>
                        <h2 class="pull-right"><%=GetCount("Orders","") %></h2>
                    </div>
                    <div class="tile-footer"><a href="Orders">View more...</a></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="tile tile-primary">
                    <div class="tile-heading">
                        Total Sales <span class="pull-right">0%</span>
                    </div>
                    <div class="tile-body">
                        <i class="fa fa-credit-card"></i>
                        <h2 class="pull-right"><%=GetCount("Order_Products"," where IsDelivered=1") %></h2>
                    </div>
                    <div class="tile-footer"><a href="Sales">View more...</a></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="tile tile-primary">
                    <div class="tile-heading">
                        Total Customers <span class="pull-right">0%</span>
                    </div>
                    <div class="tile-body">
                        <i class="fa fa-user"></i>
                        <h2 class="pull-right"><%=GetCount("Customers","") %></h2>
                    </div>
                    <div class="tile-footer"><a href="Customers">View more...</a></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="tile tile-primary">
                    <div class="tile-heading">People Online</div>
                    <div class="tile-body">
                        <i class="fa fa-users"></i>
                        <h2 class="pull-right"><%=GetCount("Users"," where IsOnline=1") %></h2>
                    </div>
                    <div class="tile-footer"><a href="OnlineUsers">View more...</a></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-shopping-cart"></i>Latest Orders</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <td class="text-right">Order ID</td>
                                    <td>Customer</td>
                                    <td>Status</td>
                                    <td>Date Added</td>
                                    <td class="text-right">Total</td>
                                    <td class="text-right">Action</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center" colspan="6">No results!</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="pull-right">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-calendar"></i><i class="caret"></i></a>
                            <ul id="range" class="dropdown-menu dropdown-menu-right">
                                <li><a href="day">Today</a></li>
                                <li><a href="week">Week</a></li>
                                <li class="active"><a href="month">Month</a></li>
                                <li><a href="year">Year</a></li>
                            </ul>
                        </div>
                        <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Sales Analytics</h3>
                    </div>
                    <div class="panel-body">
                        <div id="chart-sale" style="width: 100%; height: 260px; padding: 0px; position: relative; cursor: auto;">
                        </div>
                    </div>
                    <script type="text/javascript" src="js/flot/jquery.flot.js"></script>
                    <script type="text/javascript" src="js/flot/jquery.flot.resize.min.js"></script>
                    <script type="text/javascript">
                        $('#range a').on('click', function (e) {
                            e.preventDefault();
                            $(this).parent().parent().find('li').removeClass('active');
                            $(this).parent().addClass('active');
                            $.ajax({
                                type: 'get',
                                url: 'AJAX.aspx?range=' + $(this).attr('href'),
                                dataType: 'json',
                                success: function (json) {
                                    if (typeof json['order'] == 'undefined') { return false; }
                                    var option = {
                                        shadowSize: 0,
                                        colors: ['#9FD5F1', '#1065D2'],
                                        bars: {
                                            show: true,
                                            fill: true,
                                            lineWidth: 1
                                        },
                                        grid: {
                                            backgroundColor: '#FFFFFF',
                                            hoverable: true
                                        },
                                        points: {
                                            show: false
                                        },
                                        xaxis: {
                                            show: true,
                                            ticks: json['xaxis']
                                        }
                                    }
                                    $.plot('#chart-sale', [json['order'], json['customer']], option);
                                    $('#chart-sale').bind('plothover', function (event, pos, item) {
                                        $('.tooltip').remove();
                                        if (item) {
                                            $('<div id="tooltip" class="tooltip top in"><div class="tooltip-arrow"></div><div class="tooltip-inner">' + item.datapoint[1].toFixed(2) + '</div></div>').prependTo('body');
                                            $('#tooltip').css({
                                                position: 'absolute',
                                                left: item.pageX - ($('#tooltip').outerWidth() / 2),
                                                top: item.pageY - $('#tooltip').outerHeight(),
                                                pointer: 'cusror'
                                            }).fadeIn('slow');
                                            $('#chart-sale').css('cursor', 'pointer');
                                        }
                                        else {
                                            $('#chart-sale').css('cursor', 'auto');
                                        }
                                    });
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            });
                        });

                        $('#range .active a').trigger('click');
                    </script>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-calendar"></i>Recent Activity</h3>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item text-center">No results!</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
