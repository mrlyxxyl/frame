<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>系统配置编辑</title>
    <link rel="stylesheet" href="${baseUrl}/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${baseUrl}/assets/css/core.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/menu.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/index.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/admin.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/page/typography.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/page/form.css"/>
    <script type="text/javascript">

        function save() {
            var form = $('#form');
            var baseObj = form.serializeObject();
            $.ajax({
                url: "${baseUrl}/sys/sysEnum/save.do",
                type: "POST",
                data: baseObj,
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        alert('保存成功');
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        function add() {
            var form = $('#form');
            var baseObj = form.serializeObject();
            $.ajax({
                url: "${baseUrl}/sys/sysEnum/add.do",
                type: "POST",
                data: baseObj,
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        $("#id").val(result.data.id);
                        alert('添加成功');
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }
    </script>
    <style type="text/css">
        .go_back {
            margin-left: 5px;
            font-size: 17px;
            color: #808080;
            cursor: pointer;
        }
    </style>
</head>
<body>

<header class="am-topbar am-topbar-fixed-top">
    <div class="am-topbar-left am-hide-sm-only" style="background-color: #EBEFF2;">
        <a href="${baseUrl}/admin/index.do" class="logo"><span>框架<span></span></span><i class="zmdi zmdi-layers"></i></a>
    </div>

    <div class="contain">
        <ul class="am-nav am-navbar-nav am-navbar-left">
            <li><h4 class="page-title">系统配置<span class="go_back" onclick="history.go(-1);">>>返回</span></h4></li>
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
    <jsp:include page="../nav.jsp"/>
    <div class="content-page">
        <div class="content">
            <div class="am-g">
                <div class="am-u-sm-12">
                    <div class="card-box">
                        <div class="am-g">
                            <div class="am-u-md-6">
                                <form id="form" class="am-form am-text-sm">
                                    <input type="hidden" id="id" name="id" value="${sysEnum.id}"/>
                                    <input type="hidden" name="status" value="${sysEnum.status}"/>

                                    <div class="am-form-group">
                                        <div class="am-g">
                                            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-name-1" style="width: 18%;">名称</label>
                                            <input id="doc-ipt-name-1" name="name" type="text" value="${sysEnum.name}" class="am-u-md-10 form-control" placeholder="输入名称信息" style="width: 80%;"/>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <div class="am-g">
                                            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-code-1" style="width: 18%;">代码</label>
                                            <input id="doc-ipt-code-1" name="code" type="text" value="${sysEnum.code}" class="am-u-md-10 form-control" placeholder="输入代码" style="width: 80%;" readonly/>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <div class="am-g">
                                            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-vi-1" style="width: 18%;">整形枚举值</label>
                                            <input id="doc-ipt-vi-1" name="vi" type="text" value="${sysEnum.vi}" class="am-u-md-10" placeholder="输入整形枚举值" style="width: 80%;"/>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <div class="am-g">
                                            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-vs-1" style="width: 18%;">字符串枚举值</label>
                                            <textarea id="doc-ipt-vs-1" name="vs" class="am-u-md-10 form-control" style="width: 80%;" cols="40" rows="8">${sysEnum.vs}</textarea>
                                        </div>
                                    </div>
                                </form>
                                <div class="am-form-group">
                                    <div class="am-g" style="text-align: center;">
                                        <c:if test="${sysEnum.id == 0}">
                                            <button class="am-btn am-btn-primary" onclick="add();">添加</button>
                                        </c:if>
                                        <c:if test="${sysEnum.id != 0}">
                                            <button class="am-btn am-btn-primary" onclick="save();">保存</button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
<script type="text/javascript" src="${baseUrl}/assets/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/app.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/ht_live.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/blockUI.js"></script>
</body>
</html>
