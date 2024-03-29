<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="${baseUrl}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${baseUrl}/js/jquery.js"></script>
    <script language="javascript">
        $(function () {
            //导航切换
            $(".imglist li").click(function () {
                $(".imglist li.selected").removeClass("selected")
                $(this).addClass("selected");
            })
        })
    </script>
</head>
<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">模块设计</a></li>
        <li><a href="#">图片</a></li>
    </ul>
</div>

<div class="right_info">

    <div class="tools">

        <ul class="toolbar">
            <li class="click"><span><img src="${baseUrl}/images/t01.png"/></span>添加</li>
            <li class="click"><span><img src="${baseUrl}/images/t02.png"/></span>修改</li>
            <li><span><img src="${baseUrl}/images/t03.png"/></span>删除</li>
            <li><span><img src="${baseUrl}/images/t04.png"/></span>统计</li>
        </ul>
        <ul class="toolbar1">
            <li><span><img src="${baseUrl}/images/t05.png"/></span>设置</li>
        </ul>
    </div>
    <ul class="class_list">
        <li>
            <span><img src="${baseUrl}/images/001.jpg"/></span>

            <div class="l_right">
                <h2>模拟电子技术</h2>

                <p>课程数：共35章<br/>已完成：7章<br/>学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="${baseUrl}/images/001.jpg"/></span>

            <div class="l_right">
                <h2>模拟电子技术</h2>

                <p>课程数：共35章<br/>已完成：7章<br/>学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="${baseUrl}/images/001.jpg"/></span>

            <div class="l_right">
                <h2>模拟电子技术</h2>

                <p>课程数：共35章<br/>已完成：7章<br/>学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="${baseUrl}/images/001.jpg"/></span>

            <div class="l_right">
                <h2>模拟电子技术</h2>

                <p>课程数：共35章<br/>已完成：7章<br/>学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="${baseUrl}/images/001.jpg"/></span>

            <div class="l_right">
                <h2>模拟电子技术</h2>

                <p>课程数：共35章<br/>已完成：7章<br/>学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="${baseUrl}/images/001.jpg"/></span>

            <div class="l_right">
                <h2>模拟电子技术</h2>

                <p>课程数：共35章<br/>已完成：7章<br/>学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="${baseUrl}/images/001.jpg"/></span>

            <div class="l_right">
                <h2>模拟电子技术</h2>

                <p>课程数：共35章<br/>已完成：7章<br/>学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="${baseUrl}/images/001.jpg"/></span>

            <div class="l_right">
                <h2>模拟电子技术</h2>

                <p>课程数：共35章<br/>已完成：7章<br/>学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>
    </ul>

    <div class="clear"></div>

    <div class="pag_in">
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="pag_in_list">
            <li class="pag_in_item"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="pag_in_item"><a href="javascript:;">1</a></li>
            <li class="pag_in_item current"><a href="javascript:;">2</a></li>
            <li class="pag_in_item"><a href="javascript:;">3</a></li>
            <li class="pag_in_item"><a href="javascript:;">4</a></li>
            <li class="pag_in_item"><a href="javascript:;">5</a></li>
            <li class="pag_in_item more"><a href="javascript:;">...</a></li>
            <li class="pag_in_item"><a href="javascript:;">10</a></li>
            <li class="pag_in_item"><a href="javascript:;"><span class="page_nxt"></span></a></li>
        </ul>
    </div>

    <div class="tip">
        <div class="tip_top"><span>提示信息</span><a></a></div>

        <div class="tip_info">
            <span><img src="${baseUrl}/images/ticon.png"/></span>

            <div class="tip_right">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>

        <div class="tip_btn">
            <input name="" type="button" class="sure" value="确定"/>&nbsp;
            <input name="" type="button" class="cancel" value="取消"/>
        </div>
    </div>
</div>
</body>
</html>
