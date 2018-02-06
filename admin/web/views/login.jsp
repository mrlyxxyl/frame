<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="${baseUrl}/assets/css/core.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/menu.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/component.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/page/form.css"/>
</head>
<body>
<div class="account-pages">
    <div class="wrapper-page">
        <div class="text-center">
            <a href="#" class="logo"><span>Million Dreams<span></span></span></a>
        </div>

        <div class="m-t-40 card-box">
            <div class="text-center">
                <h4 class="text-uppercase font-bold m-b-0">Sign In</h4>
            </div>
            <div class="panel-body">
                <form action="login.do" method="post" class="am-form">
                    <div class="am-g">
                        <div class="am-form-group">
                            <input type="text" name="username" class="am-radius" placeholder="username">
                        </div>

                        <div class="am-form-group form-horizontal m-t-20">
                            <input type="password" name="password" class="am-radius" placeholder="password">
                        </div>

                        <div class="am-form-group">
                            <label style="font-weight: normal;color: #999;">
                                <input type="checkbox" class="remember"> Remember me
                            </label>
                        </div>

                        <div class="am-form-group ">
                            <button type="submit" class="am-btn am-btn-primary am-radius" style="width: 100%;height: 100%;">LOGIN IN</button>
                        </div>

                        <div class="am-form-group ">
                            <a href="#" class="text-muted"><i class="fa fa-lock m-r-5"></i> Forgot password?</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
