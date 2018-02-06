<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户列表</title>
    <link rel="stylesheet" href="${baseUrl}/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${baseUrl}/assets/css/core.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/menu.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/index.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/admin.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/page/typography.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/page/form.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/colorbox.css"/>
    <script type="text/javascript">
        window.onload = function () {
            $(".img_class_a").colorbox({rel: 'img_class_a', photo: true});
        }

        function searchUser() {
            var userId = document.getElementById("userId").value;
            if (isNaN(userId)) {
                alert("输入不合法！");
                return;
            }
            window.location = "${baseUrl}/user/search.do?userId=" + userId;
        }
    </script>
</head>
<body>
<!-- Begin page -->
<header class="am-topbar am-topbar-fixed-top">
    <div class="am-topbar-left am-hide-sm-only" style="background-color: #EBEFF2;">
        <a href="${baseUrl}/admin/index.do" class="logo"><span>框架<span></span></span><i class="zmdi zmdi-layers"></i></a>
    </div>

    <div class="contain">
        <ul class="am-nav am-navbar-nav am-navbar-left">
            <li><h4 class="page-title">用户列表</h4></li>
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
                            </div>
                        </div>
                    </div>

                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input id="userId" type="text" class="am-form-field" value="0" placeholder="此处输入user_id"/>
                            <span class="am-input-group-btn"><button class="am-btn am-btn-default" type="button" onclick="searchUser();">搜索</button></span>
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
                                    <th class="table-title">手机号</th>
                                    <th class="table-title">昵称</th>
                                    <%--<th class="table-type">性别</th>--%>
                                    <%--<th class="table-author am-hide-sm-only">邀请码</th>--%>
                                    <th class="table-title am-hide-sm-only">主播认证</th>
                                    <th class="table-title am-hide-sm-only">经验等级</th>
                                    <th class="table-title am-hide-sm-only">钻石</th>
                                    <th class="table-title am-hide-sm-only">金币</th>
                                    <th class="table-title am-hide-sm-only">棠球</th>
                                    <%--<th class="table-title am-hide-sm-only">注册时间</th>--%>
                                    <th class="table-title am-hide-sm-only">头像</th>
                                    <th class="table-title am-hide-sm-only">状态</th>
                                    <th class="table-title am-hide-sm-only">封房</th>
                                    <th class="table-title am-hide-sm-only">冻结</th>
                                    <th class="table-set">操作</th>
                                </tr>
                                <c:forEach items="${users}" var="user" varStatus="vs">
                                    <tr>
                                        <td><input type="checkbox"/></td>
                                        <td>${user.userId}</td>
                                        <td>${user.phoneNumber}</td>
                                        <td>${user.nickName}</td>
                                            <%--  <td>
                                                  <c:if test="${user.sex == 0}">男</c:if>
                                                  <c:if test="${user.sex == 1}">女</c:if>
                                              </td>--%>
                                            <%--<td>${user.invitationCode}</td>--%>
                                        <td>
                                            <c:if test="${user.certification == 0}">未认证</c:if>
                                            <c:if test="${user.certification == 1}">审核中</c:if>
                                            <c:if test="${user.certification == 2}">已认证</c:if>
                                        </td>
                                        <td>${user.empiricalLevel}</td>
                                        <td>${user.diamonds}</td>
                                        <td>${user.coinTotal}</td>
                                        <td>${user.tangCoin}</td>
                                            <%--<td>${user.createTime}</td>--%>
                                        <td>
                                            <a href="${user.headImg}" class="img_class_a">
                                                <img src="${user.headImg}" style="width: 30px;"/>
                                            </a>
                                        </td>
                                        <td>
                                            <c:if test="${user.status == 0}">已删除</c:if>
                                            <c:if test="${user.status == 1}">正常</c:if>
                                            <c:if test="${user.status == 4}">封号</c:if>
                                        </td>
                                        <td>
                                            <c:if test="${user.houseClose == 0}">否</c:if>
                                            <c:if test="${user.houseClose == 1}">是</c:if>
                                        </td>
                                        <td>
                                            <c:if test="${user.frozenAccount == 0}">否</c:if>
                                            <c:if test="${user.frozenAccount == 1}">是</c:if>
                                        </td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="${baseUrl}/user/view.do?userId=${user.userId}"><span class="am-icon-pencil-square-o"></span>查看</a>
                                                        <%--<button class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 复制</button>--%>
                                                        <%--<button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</button>--%>
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
                                            <li><a href="${baseUrl}/user/list.do?page=${currPage - 1}">上一页</a></li>
                                        </c:if>
                                        <li id="currPage">${currPage}</li>
                                        <c:if test="${currPage >= totalPage}">
                                            <li><a href="#">下一页</a></li>
                                        </c:if>
                                        <c:if test="${currPage < totalPage}">
                                            <li><a href="${baseUrl}/user/list.do?page=${currPage + 1}">下一页</a></li>
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
<script type="text/javascript" src="${baseUrl}/assets/js/jquery.colorbox.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/app.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/blockUI.js"></script>
</body>
</html>
