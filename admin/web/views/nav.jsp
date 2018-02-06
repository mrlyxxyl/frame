<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>

<div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <!-- User -->
        <div class="user-box am-hide-sm-only">
            <div class="user-img">
                <img src="${baseUrl}/assets/img/avatar-1.jpg" alt="user-img" title="Mr Lee" class="img-circle img-thumbnail img-responsive">

                <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
            </div>
            <h5><a href="#">Mr Lee</a></h5>
            <ul class="list-inline">
                <li>
                    <a href="#">
                        <i class="fa fa-cog" aria-hidden="true"></i>
                    </a>
                </li>

                <li>
                    <a href="#" class="text-custom">
                        <i class="fa fa-cog" aria-hidden="true"></i>
                    </a>
                </li>
            </ul>
        </div>
        <!-- End User -->

        <ul class="am-list admin-sidebar-list">
            <li><a href="${baseUrl}/admin/index.do"><span class="am-icon-home"></span> 首页</a></li>
            <li class="admin-parent">
                <a class="am-cf am-collapsed" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 系统管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav1">
                    <li><a href="${baseUrl}/sys/sysEnum/list.do" class="am-cf">系统配置</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>