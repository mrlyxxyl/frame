<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="${baseUrl}/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="${baseUrl}/js/jquery.js"></script>

    <script type="text/javascript">
        $(function () {
            //导航切换
            $(".menuson li").click(function () {
                $(".menuson li.active").removeClass("active")
                $(this).addClass("active");
            });

            $('.title').click(function () {
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if ($ul.is(':visible')) {
                    $(this).next('ul').slideUp();
                } else {
                    $(this).next('ul').slideDown();
                }
            });
        })
    </script>
</head>

<body style="background:#f0f9fd;">
<div class="left_top"><span></span>通讯录</div>

<dl class="left_menu">

    <dd>
        <div class="title">
            <span><img src="${baseUrl}/images/leftico01.png"/></span>管理信息
        </div>
        <ul class="menu_son">
            <li><cite></cite><a href="${baseUrl}/index.html" target="rightFrame">首页模版</a><i></i></li>
            <li class="active"><cite></cite><a href="right.html" target="rightFrame">数据列表</a><i></i></li>
            <li><cite></cite><a href="${baseUrl}/imgtable.html" target="rightFrame">图片数据表</a><i></i></li>
            <li><cite></cite><a href="${baseUrl}/form.html" target="rightFrame">添加编辑</a><i></i></li>
            <li><cite></cite><a href="${baseUrl}/imglist.html" target="rightFrame">图片列表</a><i></i></li>
            <li><cite></cite><a href="${baseUrl}/imglist1.html" target="rightFrame">自定义</a><i></i></li>
            <li><cite></cite><a href="${baseUrl}/tools.html" target="rightFrame">常用工具</a><i></i></li>
            <li><cite></cite><a href="${baseUrl}/filelist.html" target="rightFrame">信息管理</a><i></i></li>
            <li><cite></cite><a href="${baseUrl}/tab.html" target="rightFrame">Tab页</a><i></i></li>
            <li><cite></cite><a href="${baseUrl}/error.html" target="rightFrame">404页面</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title">
            <span><img src="${baseUrl}/images/leftico02.png"/></span>其他设置
        </div>
        <ul class="menu_son">
            <li><cite></cite><a href="#">编辑内容</a><i></i></li>
            <li><cite></cite><a href="#">发布信息</a><i></i></li>
            <li><cite></cite><a href="#">档案列表显示</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title"><span><img src="${baseUrl}/images/leftico03.png"/></span>编辑器</div>
        <ul class="menu_son">
            <li><cite></cite><a href="#">自定义</a><i></i></li>
            <li><cite></cite><a href="#">常用资料</a><i></i></li>
            <li><cite></cite><a href="#">信息列表</a><i></i></li>
            <li><cite></cite><a href="#">其他</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title"><span><img src="${baseUrl}/images/leftico04.png"/></span>日期管理</div>
        <ul class="menu_son">
            <li><cite></cite><a href="#">自定义</a><i></i></li>
            <li><cite></cite><a href="#">常用资料</a><i></i></li>
            <li><cite></cite><a href="#">信息列表</a><i></i></li>
            <li><cite></cite><a href="#">其他</a><i></i></li>
        </ul>
    </dd>
</dl>
</body>
</html>
