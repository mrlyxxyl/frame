<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理</title>
    <link rel="stylesheet" href="../assets/css/amazeui.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/core.css"/>
    <link rel="stylesheet" href="../assets/css/menu.css"/>
    <link rel="stylesheet" href="../assets/css/index.css"/>
    <link rel="stylesheet" href="../assets/css/admin.css"/>
    <link rel="stylesheet" href="../assets/css/page/typography.css"/>
    <link rel="stylesheet" href="../assets/css/page/form.css"/>
    <link rel="stylesheet" href="${baseUrl}/assets/css/colorbox.css"/>

    <script type="text/javascript">

        window.onload = function () {
            $(".img_class_a").colorbox({rel: 'img_class_a', photo: true});
        }

        function authSuccess() {
            $.ajax({
                url: "${baseUrl}/user/authSuccess.do?userId=" + $("#userId").val(),
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        alert('操作成功');
                        location.reload();
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        function authFailed() {
            $.ajax({
                url: "${baseUrl}/user/authFailed.do",
                type: "POST",
                data: {"userId": $("#userId").val(), "reason": $("#doc-ipt-applyCheckResult-1").val()},
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        alert('操作成功');
                        location.reload();
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        function closeAccount() {
            $.ajax({
                url: "${baseUrl}/user/closeAccount.do?userId=" + $("#userId").val(),
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        alert('操作成功');
                        location.reload();
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        function unCloseAccount() {
            $.ajax({
                url: "${baseUrl}/user/unCloseAccount.do?userId=" + $("#userId").val(),
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        alert('操作成功');
                        location.reload();
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        function frozenAccount() {
            $.ajax({
                url: "${baseUrl}/user/frozenAccount.do?userId=" + $("#userId").val(),
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        alert('操作成功');
                        location.reload();
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        function unFrozenAccount() {
            $.ajax({
                url: "${baseUrl}/user/unFrozenAccount.do?userId=" + $("#userId").val(),
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        alert('操作成功');
                        location.reload();
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        function closeHouse() {
            $.ajax({
                url: "${baseUrl}/user/closeHouse.do?userId=" + $("#userId").val(),
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        alert('操作成功');
                        location.reload();
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        function unCloseHouse() {
            $.ajax({
                url: "${baseUrl}/user/unCloseHouse.do?userId=" + $("#userId").val(),
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        alert('操作成功');
                        location.reload();
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        /**
         *合作
         */
        function cooperation() {

            var userId = $("#userId").val();
            $.ajax({
                url: "${baseUrl}/user/getCoupon.do?userId=" + userId,
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if (result.code == 1000) {
                        var percent = result.data;

                        var content = window.prompt("当前比例", percent);

                        if (content == null || content == undefined || content == '' || isNaN(content) || content < 6 || content > 10) {
                            alert("输入不合法！");
                            return;
                        }
                        changeCoupon(userId, content);
                    } else {
                        alert(result.msg);
                    }
                }
            });
        }

        function changeCoupon(userId, percent) {
            $.ajax({
                url: "${baseUrl}/user/changeCoupon.do?userId=" + userId + "&percent=" + percent,
                type: "GET",
                dataType: "json",
                success: function (result) {
                    alert(result.msg);
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
    <div class="am-topbar-left am-hide-sm-only">
        <a href="${baseUrl}/admin/index.do" class="logo"><span>框架<span></span></span><i class="zmdi zmdi-layers"></i></a>
    </div>

    <div class="contain">
        <ul class="am-nav am-navbar-nav am-navbar-left">

            <li><h4 class="page-title">用户管理<span class="go_back" onclick="history.go(-1);">>>返回</span></h4></li>
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
<form class="am-form am-text-sm">
<div class="am-u-md-6">

    <input type="hidden" id="userId" name="userId" value="${user.userId}"/>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-nickName-1" style="width: 18%;">昵称</label>
            <input id="doc-ipt-nickName-1" name="nickName" type="text" class="am-u-md-10 form-control" value="${user.nickName}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-sex-1" style="width: 18%;">性别</label>
            <input id="doc-ipt-sex-1" name="sex" type="text" class="am-u-md-10 form-control" value="<c:if test='${user.sex == 0}'>男</c:if><c:if test='${user.sex == 1}'>女</c:if>" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-birthday-1" style="width: 18%;">生日</label>
            <input id="doc-ipt-birthday-1" name="birthday" type="text" class="am-u-md-10 form-control" value="${user.birthday}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-address-1" style="width: 18%;">所在地</label>
            <input id="doc-ipt-address-1" name="address" type="text" class="am-u-md-10 form-control" value="${user.address}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-phoneNumber-1" style="width: 18%;">手机号</label>
            <input id="doc-ipt-phoneNumber-1" name="phoneNumber" type="text" class="am-u-md-10 form-control" value="${user.phoneNumber}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-certification-1" style="width: 18%;">是否已认证</label>
            <input id="doc-ipt-certification-1" name="certification" type="text" class="am-u-md-10 form-control" value="  <c:if test='${user.certification == 0}'>未认证</c:if><c:if test='${user.certification == 1}'>审核中</c:if><c:if test='${user.certification == 2}'>已认证</c:if>" style="width: 80%;"
                   readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-antAuth-1" style="width: 18%;">蚂蚁认证</label>
            <input id="doc-ipt-antAuth-1" name="antAuth" type="text" class="am-u-md-10 form-control" value="<c:if test='${user.antAuth == 0}'>否</c:if><c:if test='${user.antAuth == 1}'>是</c:if>" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-empiricalValue-1" style="width: 18%;">经验值</label>
            <input id="doc-ipt-empiricalValue-1" name="empiricalValue" type="text" class="am-u-md-10 form-control" value="${user.empiricalValue}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-empiricalLevel-1" style="width: 18%;">经验等级</label>
            <input id="doc-ipt-empiricalLevel-1" name="empiricalLevel" type="text" class="am-u-md-10 form-control" value="${user.empiricalLevel}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-diamonds-1" style="width: 18%;">钻石</label>
            <input id="doc-ipt-diamonds-1" name="diamonds" type="text" class="am-u-md-10 form-control" value="${user.diamonds}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-coinTotal-1" style="width: 18%;">金币</label>
            <input id="doc-ipt-coinTotal-1" name="coinTotal" type="text" class="am-u-md-10 form-control" value="${user.coinTotal}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-tangCoin-1" style="width: 18%;">棠球</label>
            <input id="doc-ipt-tangCoin-1" name="tangCoin" type="text" class="am-u-md-10 form-control" value="${user.tangCoin}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-commissionScale-1" style="width: 18%;">提现比例</label>
            <input id="doc-ipt-commissionScale-1" name="commissionScale" type="text" class="am-u-md-10 form-control" value="${user.commissionScale}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-chgNickNameFreeTime-1" style="width: 18%;">免费次数</label>
            <input id="doc-ipt-chgNickNameFreeTime-1" name="chgNickNameFreeTime" type="text" class="am-u-md-10 form-control" value="${user.chgNickNameFreeTime}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-applyTime-1" style="width: 18%;">申请时间</label>
            <input id="doc-ipt-applyTime-1" name="applyTime" type="text" class="am-u-md-10 form-control" value="${user.applyTime}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-houseClose-1" style="width: 18%;">是否封房</label>
            <input id="doc-ipt-houseClose-1" name="houseClose" type="text" class="am-u-md-10 form-control" value="<c:if test='${user.houseClose == 0}'>否</c:if><c:if test='${user.houseClose == 1}'>是</c:if>" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-idCardNo-1" style="width: 18%;">身份证号码</label>
            <input id="doc-ipt-idCardNo-1" name="idCardNo" type="text" class="am-u-md-10 form-control" value="${user.idCardNo}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-headImg-1" style="width: 18%;">头像</label>
            <input id="doc-ipt-headImg-1" name="headImg" type="text" class="am-u-md-10 form-control" value="${user.headImg}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-headImg-2" style="width: 18%;">&nbsp;</label>
            <a href="${user.headImg}" class="img_class_a">
                <img id="doc-ipt-headImg-2" class="am-u-md-10 form-control" src="${user.headImg}" style="width: 100px; height: 100px;"/>
            </a>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-idCardImgBack-1" style="width: 18%;">身份证照片-背面</label>
            <input id="doc-ipt-idCardImgBack-1" name="idCardImgBack" type="text" class="am-u-md-10 form-control" value="${user.idCardImgBack}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-idCardImgBack-2" style="width: 18%;">&nbsp;</label>
            <a href="${user.idCardImgBack}" class="img_class_a">
                <img id="doc-ipt-idCardImgBack-2" class="am-u-md-10 form-control" src="${user.idCardImgBack}" style="width: 100px; height: 100px;"/>
            </a>
        </div>
    </div>

</div>

<div class="am-u-md-6">
    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-deviceId-1" style="width: 18%;">设备号</label>
            <input id="doc-ipt-deviceId-1" name="deviceId" type="text" class="am-u-md-10 form-control" value="${user.deviceId}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-deviceType-1" style="width: 18%;">设备类型</label>
            <input id="doc-ipt-deviceType-1" name="deviceType" type="text" class="am-u-md-10 form-control" value="<c:if test='${user.deviceType == 0}'>安卓</c:if><c:if test='${user.deviceType == 1}'>IOS</c:if>" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-registrationId-1" style="width: 18%;">注册号</label>
            <input id="doc-ipt-registrationId-1" name="registrationId" type="text" class="am-u-md-10 form-control" value="${user.registrationId}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-hxUuid-1" style="width: 18%;">环信ID</label>
            <input id="doc-ipt-hxUuid-1" name="hxUuid" type="text" class="am-u-md-10 form-control" value="${user.hxUuid}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-hxUsername-1" style="width: 18%;">环信用户名</label>
            <input id="doc-ipt-hxUsername-1" name="hxUsername" type="text" class="am-u-md-10 form-control" value="${user.hxUsername}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-streamName-1" style="width: 18%;">金山流名</label>
            <input id="doc-ipt-streamName-1" name="streamName" type="text" class="am-u-md-10 form-control" value="${user.streamName}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-roomId-1" style="width: 18%;">聊天室ID</label>
            <input id="doc-ipt-roomId-1" name="roomId" type="text" class="am-u-md-10 form-control" value="${user.roomId}" style="width: 80%;" readonly/>
        </div>
    </div>
    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-playerId-1" style="width: 18%;">直播间ID</label>
            <input id="doc-ipt-playerId-1" name="playerId" type="text" class="am-u-md-10 form-control" value="${user.playerId}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-invitationCode-1" style="width: 18%;">邀请码</label>
            <input id="doc-ipt-invitationCode-1" name="invitationCode" type="text" class="am-u-md-10 form-control" value="${user.invitationCode}" style="width: 80%;" readonly/>
        </div>
    </div>
    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-apiToken-1" style="width: 18%;">Token</label>
            <input id="doc-ipt-apiToken-1" name="apiToken" type="text" class="am-u-md-10 form-control" value="${user.apiToken}" style="width: 80%;" readonly/>
        </div>
    </div>
    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-lastLoginIp-1" style="width: 18%;">登录IP</label>
            <input id="doc-ipt-lastLoginIp-1" name="lastLoginIp" type="text" class="am-u-md-10 form-control" value="${user.lastLoginIp}" style="width: 80%;" readonly/>
        </div>
    </div>
    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-lastLoginTime-1" style="width: 18%;">登录时间</label>
            <input id="doc-ipt-lastLoginTime-1" name="lastLoginTime" type="text" class="am-u-md-10 form-control" value="${user.lastLoginTime}" style="width: 80%;" readonly/>
        </div>
    </div>
    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-createTime-1" style="width: 18%;">注册时间</label>
            <input id="doc-ipt-createTime-1" name="createTime" type="text" class="am-u-md-10 form-control" value="${user.createTime}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-status-1" style="width: 18%;">用户状态</label>
            <input id="doc-ipt-status-1" name="status" type="text" class="am-u-md-10 form-control" value="<c:if test='${user.status == 0}'>已删除</c:if><c:if test='${user.status == 1}'>正常</c:if><c:if test='${user.status == 4}'>封号</c:if>" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-applyCheckResult-1" style="width: 18%;">审核结果</label>
            <input id="doc-ipt-applyCheckResult-1" name="applyCheckResult" type="text" class="am-u-md-10 form-control" value="${user.applyCheckResult}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-frozenAccount-1" style="width: 18%;">是否冻结</label>
            <input id="doc-ipt-frozenAccount-1" name="frozenAccount" type="text" class="am-u-md-10 form-control" value="<c:if test='${user.frozenAccount == 0}'>否</c:if><c:if test='${user.frozenAccount == 1}'>是</c:if>" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-idCardName-1" style="width: 18%;">身份证姓名</label>
            <input id="doc-ipt-idCardName-1" name="idCardName" type="text" class="am-u-md-10 form-control" value="${user.idCardName}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-idCardImg-1" style="width: 18%;">身份证照片</label>
            <input id="doc-ipt-idCardImg-1" name="idCardImg" type="text" class="am-u-md-10 form-control" value="${user.idCardImg}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-idCardImg-2" style="width: 18%;">&nbsp;</label>
            <a href="${user.idCardImg}" class="img_class_a">
                <img id="doc-ipt-idCardImg-2" class="am-u-md-10 form-control" src="${user.idCardImg}" style="width: 100px; height: 100px;"/>
            </a>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-idCardImgHand-1" style="width: 18%;">身份证照片-手持</label>
            <input id="doc-ipt-idCardImgHand-1" name="idCardImgHand" type="text" class="am-u-md-10 form-control" value="${user.idCardImgHand}" style="width: 80%;" readonly/>
        </div>
    </div>

    <div class="am-form-group">
        <div class="am-g">
            <label class="am-u-md-2 am-md-text-right am-padding-left-0" for="doc-ipt-idCardImgHand-2" style="width: 18%;">&nbsp;</label>
            <a href="${user.idCardImgHand}" class="img_class_a">
                <img id="doc-ipt-idCardImgHand-2" class="am-u-md-10 form-control" src="${user.idCardImgHand}" style="width: 100px; height: 100px;"/>
            </a>
        </div>
    </div>
</div>
</form>
<div class="am-form-group">
    <div class="am-g" style="text-align: center;">
        <c:if test="${user.certification == 1}">
            <button id="btn_auth_success" class="am-btn am-btn-primary" onclick="authSuccess();">主播认证成功</button>
            <button id="btn_auth_failed" class="am-btn am-btn-primary" onclick="authFailed();">主播认证失败</button>
        </c:if>
        <c:if test="${user.status != 4}">
            <button id="btn_close_account" class="am-btn am-btn-primary" onclick="closeAccount();">封号</button>
        </c:if>
        <c:if test="${user.status == 4}">
            <button id="btn_close_account" class="am-btn am-btn-primary" onclick="unCloseAccount();">解除封号</button>
        </c:if>
        <c:if test="${user.frozenAccount == 0}">
            <button id="btn_frozen" class="am-btn am-btn-primary" onclick="frozenAccount();">冻结</button>
        </c:if>
        <c:if test="${user.frozenAccount == 1}">
            <button id="btn_un_frozen" class="am-btn am-btn-primary" onclick="unFrozenAccount();">账号解除冻结</button>
        </c:if>
        <c:if test="${user.houseClose == 0}">
            <button id="btn_house_close" class="am-btn am-btn-primary" onclick="closeHouse();">封房</button>
        </c:if>
        <c:if test="${user.houseClose == 1}">
            <button id="btn_house_un_close" class="am-btn am-btn-primary" onclick="unCloseHouse();">账号解除封房</button>
        </c:if>

        <c:if test="${user.certification == 2}">
            <button id="btn_house_cooperation" class="am-btn am-btn-primary" onclick="cooperation();">合作</button>
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

<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>

<script type="text/javascript" src="../assets/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="${baseUrl}/assets/js/jquery.colorbox.js"></script>
<script type="text/javascript" src="../assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript" src="../assets/js/blockUI.js"></script>
</body>

</html>
