<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>系统配置</title>
    <link rel="stylesheet" href="${baseUrl}/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${baseUrl}/assets/css/core.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/menu.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/index.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/admin.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/page/typography.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/page/form.css"/>
</head>
<body>
<!-- Begin page -->
<header class="am-topbar am-topbar-fixed-top">
    <div class="am-topbar-left am-hide-sm-only" style="background-color: #EBEFF2;">
        <a href="${baseUrl}/admin/index.do" class="logo"><span>框架<span></span></span><i class="zmdi zmdi-layers"></i></a>
    </div>

    <div class="contain">
        <ul class="am-nav am-navbar-nav am-navbar-left">
            <li><h4 class="page-title">系统配置</h4></li>
        </ul>

        <ul class="am-nav am-navbar-nav am-navbar-right">
            <li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
            <li class="hidden-xs am-hide-sm-only">
                <form role="search" class="app-search">
                    <input type="text" placeholder="Search..." class="form-control"/>
                    <a href=""><img src="${baseUrl}/assets/img/search.png"></a>
                </form>
            </li>
        </ul>
    </div>
</header>
<!-- end page -->

<div class="admin">
    <jsp:include page="../nav.jsp"/>
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="card-box">
                <!-- Row start -->
                <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a type="button" class="am-btn am-btn-default" href="${baseUrl}/sys/sysEnum/edit.do?code=0"><span class="am-icon-plus"></span> 新增</a>
                            </div>
                        </div>
                    </div>

                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input type="text" class="am-form-field"/>
                            <span class="am-input-group-btn"><button class="am-btn am-btn-default" type="button">搜索</button></span>
                        </div>
                    </div>
                </div>
                <!-- Row end -->

                <!-- Row start -->
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table class="am-table am-table-striped am-table-hover table-main">
                                <tr>
                                    <th class="table-check"><input type="checkbox"/></th>
                                    <th class="table-id">ID</th>
                                    <th class="table-title">名称</th>
                                    <th class="table-type">代码</th>
                                    <th class="table-author am-hide-sm-only">整形枚举值</th>
                                    <th class="table-date am-hide-sm-only self_th_td">字符串枚举值</th>
                                    <th class="table-date am-hide-sm-only">记录状态</th>
                                    <th class="table-set">操作</th>
                                </tr>
                                <c:forEach items="${sysEnums}" var="sysEnum" varStatus="vs">
                                    <tr>
                                        <td><input type="checkbox"/></td>
                                        <td>${sysEnum.id}</td>
                                        <td>${sysEnum.name}</td>
                                        <td>${sysEnum.code}</td>
                                        <td>${sysEnum.vi}</td>
                                        <td class="self_th_td">${sysEnum.vs}</td>
                                        <td><c:if test="${sysEnum.status == 0}">无效</c:if><c:if test="${sysEnum.status == 1}">有效</c:if></td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="${baseUrl}/sys/sysEnum/edit.do?code=${sysEnum.code}"><span class="am-icon-pencil-square-o"></span> 编辑</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <div class="am-cf">
                                <div class="am-fr">
                                    <ul class="am-pagination">
                                        <li>共 ${count} 条记录</li>
                                        <c:if test="${currPage == 1}">
                                            <li><a href="#">上一页</a></li>
                                        </c:if>
                                        <c:if test="${currPage > 1}">
                                            <li><a href="${baseUrl}/sys/sysEnum/list.do?page=${currPage - 1}">上一页</a></li>
                                        </c:if>
                                        <li id="currPage">${currPage}</li>
                                        <c:if test="${currPage >= totalPage}">
                                            <li><a href="#">下一页</a></li>
                                        </c:if>
                                        <c:if test="${currPage < totalPage}">
                                            <li><a href="${baseUrl}/sys/sysEnum/list.do?page=${currPage + 1}">下一页</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                            <hr/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end right Content here -->
<!--</div>-->
</div>
</div>

<!-- navbar -->
<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>

<script type="text/javascript" src="${baseUrl}/assets/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/app.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/blockUI.js"></script>
</body>
</html>
