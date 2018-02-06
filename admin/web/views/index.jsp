<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>框架</title>
    <link rel="stylesheet" href="${baseUrl}/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/core.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/menu.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/index.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/admin.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/page/typography.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/page/form.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/component.css"/>

</head>
<body>
<header class="am-topbar am-topbar-fixed-top">
    <div class="am-topbar-left am-hide-sm-only" style="background-color: #EBEFF2;">
        <a href="${baseUrl}/admin/index.do" class="logo"><span>框架<span></span></span><i class="zmdi zmdi-layers"></i></a>
    </div>

    <div class="contain">
        <ul class="am-nav am-navbar-nav am-navbar-left">
            <li><h4 class="page-title">站点统计</h4></li>
        </ul>

        <ul class="am-nav am-navbar-nav am-navbar-right">
            <li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
            <li class="hidden-xs am-hide-sm-only">
                <form role="search" class="app-search">
                    <input type="text" placeholder="Search..." class="form-control">
                    <a href=""><img src="${baseUrl}/assets/img/search.png"></a>
                </form>
            </li>
        </ul>
    </div>
</header>

<div class="admin">

    <jsp:include page="nav.jsp"/>

    <div class="content-page">
        <div class="content">
            <div class="am-g">
                <div class="am-u-md-3">
                    <div class="card-box">
                        <h4 class="header-title m-t-0 m-b-30">注册人数</h4>

                        <div class="widget-chart-1 am-cf">
                            <div class="widget-detail-1" style="float: left;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">今日注册</p>
                            </div>

                            <div class="widget-detail-1" style="float: right;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">累计注册</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="am-u-md-3">
                    <div class="card-box">
                        <h4 class="header-title m-t-0 m-b-30">主播认证</h4>

                        <div class="widget-chart-1 am-cf">
                            <div class="widget-detail-1" style="float: left;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">今日认证</p>
                            </div>

                            <div class="widget-detail-1" style="float: right;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">累计认证</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="am-u-md-3">
                    <div class="card-box">
                        <h4 class="header-title m-t-0 m-b-30">充值笔数</h4>

                        <div class="widget-chart-1 am-cf">
                            <div class="widget-detail-1" style="float: left;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">今日充值</p>
                            </div>

                            <div class="widget-detail-1" style="float: right;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">累计充值</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="am-u-md-3">
                    <div class="card-box">
                        <h4 class="header-title m-t-0 m-b-30">充值金额</h4>

                        <div class="widget-chart-1 am-cf">
                            <div class="widget-detail-1" style="float: left;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">今日充值</p>
                            </div>

                            <div class="widget-detail-1" style="float: right;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">累计充值</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="am-u-md-3">
                    <div class="card-box">
                        <h4 class="header-title m-t-0 m-b-30">提现笔数</h4>

                        <div class="widget-chart-1 am-cf">
                            <div class="widget-detail-1" style="float: left;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">今日提现</p>
                            </div>

                            <div class="widget-detail-1" style="float: right;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">累计提现</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="am-u-md-3">
                    <div class="card-box">
                        <h4 class="header-title m-t-0 m-b-30">提现金额</h4>

                        <div class="widget-chart-1 am-cf">
                            <div class="widget-detail-1" style="float: left;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">今日提现</p>
                            </div>

                            <div class="widget-detail-1" style="float: right;">
                                <h2 class="p-t-10 m-b-0"></h2>

                                <p class="text-muted">累计提现</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="am-g">
                <div class="am-u-md-3">
                    <div class="card-box widget-user">
                        <div>
                            <img src="${baseUrl}/assets/img/avatar-3.jpg" class="img-responsive img-circle" alt="user">

                            <div class="wid-u-info">
                                <h4 class="m-t-0 m-b-5 font-600">Mr Lee</h4>

                                <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                <small class="text-warning"><b>管理员</b></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="am-u-md-3">
                    <div class="card-box widget-user">
                        <div>
                            <img src="${baseUrl}/assets/img/avatar-2.jpg" class="img-responsive img-circle" alt="user">

                            <div class="wid-u-info">
                                <h4 class="m-t-0 m-b-5 font-600">Mr Lee</h4>

                                <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                <small class="text-custom"><b>网络组主管</b></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="am-u-md-3">
                    <div class="card-box widget-user">
                        <div>
                            <img src="${baseUrl}/assets/img/avatar-4.jpg" class="img-responsive img-circle" alt="user"/>

                            <div class="wid-u-info">
                                <h4 class="m-t-0 m-b-5 font-600">Mr Xia</h4>

                                <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                <small class="text-success"><b>设计师</b></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="am-u-md-3">
                    <div class="card-box widget-user">
                        <div>
                            <img src="${baseUrl}/assets/img/avatar-10.jpg" class="img-responsive img-circle" alt="user"/>

                            <div class="wid-u-info">
                                <h4 class="m-t-0 m-b-5 font-600">Mr Wang</h4>

                                <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                <small class="text-info"><b>开发者</b></small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="footer.jsp"/>
        </div>
    </div>
</div>
</div>

<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>

<script type="text/javascript" src="${baseUrl}/assets/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/app.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/blockUI.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/charts/echarts.min.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/charts/indexChart.js"></script>
</body>
</html>
