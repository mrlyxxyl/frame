<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>top</title>
    <link href="${baseUrl}/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="${baseUrl}/js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            //顶部导航切换
            $(".nav li a").click(function () {
                $(".nav li a.selected").removeClass("selected")
                $(this).addClass("selected");
            })
        })
    </script>
</head>

<body style="background:url(${baseUrl}/images/topbg.gif) repeat-x;">

<div class="top_left">
    <a href="${baseUrl}/web/main/main.do" target="_parent"><img src="${baseUrl}/images/logo.png" title="系统首页"/></a>
</div>

<ul class="nav">
    <li><a href="${baseUrl}/web/main/default.do" target="rightFrame" class="selected"><img src="${baseUrl}/images/icon01.png" title="工作台"/>

        <h2>工作台</h2></a></li>
    <li><a href="${baseUrl}/web/main/imgTable.do" target="rightFrame"><img src="${baseUrl}/images/icon02.png" title="模型管理"/>

        <h2>模型管理</h2></a></li>
    <li><a href="${baseUrl}/web/main/imgList.do" target="rightFrame"><img src="${baseUrl}/images/icon03.png" title="模块设计"/>

        <h2>模块设计</h2></a></li>
    <li><a href="${baseUrl}/web/main/tools.do" target="rightFrame"><img src="${baseUrl}/images/icon04.png" title="常用工具"/>

        <h2>常用工具</h2></a></li>
    <li><a href="${baseUrl}/web/main/computer.do" target="rightFrame"><img src="${baseUrl}/images/icon05.png" title="文件管理"/>

        <h2>文件管理</h2></a></li>
    <li><a href="${baseUrl}/web/main/tab.do" target="rightFrame"><img src="${baseUrl}/images/icon06.png" title="系统设置"/>

        <h2>系统设置</h2></a></li>
</ul>

<div class="top_right">
    <ul>
        <li><span><img src="${baseUrl}/images/help.png" title="帮助" class="helpimg"/></span><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
        <li><a href="${baseUrl}/web/admin/loginOut.do" target="_parent">退出</a></li>
    </ul>
    <div class="user">
        <span>admin</span>
        <i>消息</i>
        <b>5</b>
    </div>
</div>
</body>
</html>
