﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <link href="${baseUrl}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${baseUrl}/js/jquery.js"></script>
    <script src="${baseUrl}/js/cloud.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $('.login_box').css({'position': 'absolute', 'left': ($(window).width() - 692) / 2});
            $(window).resize(function () {
                $('.login_box').css({'position': 'absolute', 'left': ($(window).width() - 692) / 2});
            })
        });
    </script>

    <style type="text/css">
        body {
            background: #1c77ac url('${baseUrl}/images/light.png') no-repeat center top;
            overflow: hidden;
        }
    </style>
</head>

<body>
<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>

<div class="login_top">
    <span>欢迎登录后台管理界面平台</span>
    <ul>
        <li><a href="#">回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>

<div class="login_body">

    <span class="system_logo"></span>

    <div class="login_box">
        <form action="${baseUrl}/web/admin/login.do" method="post">
            <ul>
                <li><input name="username" type="text" class="login_user" value="admin"/></li>
                <li><input name="password" type="password" class="login_pwd" value="password"/></li>
                <li><input type="submit" class="login_btn" value="登录"/><label><input name="" type="checkbox" value="" checked="checked"/>记住密码</label><label><a href="#">忘记密码？</a></label></li>
            </ul>
        </form>
    </div>
</div>
<div class="login_bm">版权所有 net.ys</div>
</body>
</html>
