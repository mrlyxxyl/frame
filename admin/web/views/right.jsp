<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>www.yongsn.com</title>
    <link href="${baseUrl}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${baseUrl}/js/jquery.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".click").click(function () {
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
            });
        });
    </script>
</head>
<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">数据表</a></li>
        <li><a href="#">基本内容</a></li>
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
    <table class="table_list">
        <thead>
        <tr>
            <th><input name="" type="checkbox" value="" checked="checked"/></th>
            <th>编号<i class="sort"><img src="${baseUrl}/images/px.gif"/></i></th>
            <th>标题</th>
            <th>用户</th>
            <th>籍贯</th>
            <th>发布时间</th>
            <th>是否审核</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input name="" type="checkbox" value=""/></td>
            <td>20130908</td>
            <td>王金平幕僚：马英九声明字字见血 人活着没意思</td>
            <td>admin</td>
            <td>江苏南京</td>
            <td>2013-09-09 15:05</td>
            <td>已审核</td>
            <td><a href="#" class="table_link">查看</a> <a href="#" class="table_link"> 删除</a></td>
        </tr>

        <tr>
            <td><input name="" type="checkbox" value=""/></td>
            <td>20130907</td>
            <td>温州19名小学生中毒流鼻血续：周边部分企业关停</td>
            <td></td>
            <td>山东济南</td>
            <td>2013-09-08 14:02</td>
            <td>未审核</td>
            <td><a href="#" class="table_link">查看</a> <a href="#" class="table_link">删除</a></td>
        </tr>

        <tr>
            <td><input name="" type="checkbox" value=""/></td>
            <td>20130906</td>
            <td>社科院:电子商务促进了农村经济结构和社会转型</td>
            <td>user</td>
            <td>江苏无锡</td>
            <td>2013-09-07 13:16</td>
            <td>未审核</td>
            <td><a href="#" class="table_link">查看</a> <a href="#" class="table_link">删除</a></td>
        </tr>

        <tr>
            <td><input name="" type="checkbox" value=""/></td>
            <td>20130905</td>
            <td>江西&quot;局长违规建豪宅&quot;：局长检讨</td>
            <td>admin</td>
            <td>北京市</td>
            <td>2013-09-06 10:36</td>
            <td>已审核</td>
            <td><a href="#" class="table_link">查看</a> <a href="#" class="table_link">删除</a></td>
        </tr>

        <tr>
            <td><input name="" type="checkbox" value=""/></td>
            <td>20130904</td>
            <td>中国2020年或迈入高收入国家行列</td>
            <td></td>
            <td>江苏南京</td>
            <td>2013-09-05 13:25</td>
            <td>已审核</td>
            <td><a href="#" class="table_link">查看</a> <a href="#" class="table_link">删除</a></td>
        </tr>

        <tr>
            <td><input name="" type="checkbox" value=""/></td>
            <td>20130903</td>
            <td>深圳地铁车门因乘客拉闸打开 3人被挤入隧道</td>
            <td>user</td>
            <td>广东深圳</td>
            <td>2013-09-04 12:00</td>
            <td>已审核</td>
            <td><a href="#" class="table_link">查看</a> <a href="#" class="table_link">删除</a></td>
        </tr>

        <tr>
            <td><input name="" type="checkbox" value=""/></td>
            <td>20130902</td>
            <td>33次地表塌陷 村民不敢下地劳作(图)</td>
            <td>admin</td>
            <td>湖南长沙</td>
            <td>2013-09-03 00:05</td>
            <td>未审核</td>
            <td><a href="#" class="table_link">查看</a> <a href="#" class="table_link">删除</a></td>
        </tr>

        <tr>
            <td><input name="" type="checkbox" value=""/></td>
            <td>20130901</td>
            <td>医患关系：医生在替改革不彻底背黑锅</td>
            <td>admin</td>
            <td>江苏南京</td>
            <td>2013-09-02 15:05</td>
            <td>未审核</td>
            <td><a href="#" class="table_link">查看</a> <a href="#" class="table_link">删除</a></td>
        </tr>

        <tr>
            <td><input name="" type="checkbox" value=""/></td>
            <td>20130900</td>
            <td>山东章丘公车进饭店景点将自动向监控系统报警</td>
            <td></td>
            <td>山东滨州</td>
            <td>2013-09-01 10:26</td>
            <td>已审核</td>
            <td><a href="#" class="table_link">查看</a> <a href="#" class="table_link">删除</a></td>
        </tr>
        </tbody>
    </table>

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
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
</body>
</html>
