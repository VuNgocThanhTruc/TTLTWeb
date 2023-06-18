<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 25/05/2023
  Time: 8:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.model.UserModel" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.AccountService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        #heading {
            display: flex;
            justify-content: space-between;
            flex-grow: 1;
            flex-grow: 1;
        }
        .row-info{
            margin-right: 10px;
        }
        #button-lock{
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
        .switch {
            position: relative;
            width: 150px;
            height: 40px;
            border-radius: 25px;
            cursor: pointer;
        }
        .switch input{
            appearance: none;
            width: 128px;
            height: 40px;
            border-radius: 25px;
            background: #000;
            outline: none;
            cursor: pointer;
        }
        .switch input::before,
        .switch input::after{
            z-index: 2;
            position: absolute;
            top: 56%;
            transform: translateY(-50%);
            font-weight: bolder;
            cursor: pointer;
        }
        .switch input::before{
            content: "Khóa";
            left: 20px;
        }
        .switch input::after{
            content: "Mở";
            right: 50px;
        }
        .switch input:checked{
            background: #ffd43b;
        }
        .switch label{
            z-index: 1;
            position: absolute;
            top: 5px;
            bottom: -3px;
            border-radius: 20px;
        }
        .switch input {
            transition: 0.25s;
        }
        .switch input:checked::after,
        .switch input:checked::before{
            color: #FFFFFF;
            transition: color 5s;
        }
        .switch input:checked+label{
            left: 5px;
            right: 80px;
            background: #000000;
            transition: left .5s, right .4s .2s;
        }
        .switch input:not(:checked){
            background: #000;
            transition: background .4s;
        }
        .switch input:not(:checked)::before{
            color: #fff;
            transition: color .5s;
        }
        .switch input:not(:checked)::after{
            color: #000;
            transition: color .5s .2s;
        }
        .switch input:not(:checked) + label{
            left: 60px;
            right: 27px;
            background: #ffd43b;
            transition: left .4s .2s , right .5s , background .35s;
        }
        .mb-3{
            font-size: 16px;
        }

    </style>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
    UserModel userLog = (UserModel) request.getAttribute("userLog");
    String idUser = userLog == null ? "Chưa có thông tin" : userLog.getId();
    String nameUser = userLog == null ? "Chưa có thông tin" : userLog.getName();
    String emailUser = userLog == null ? "Chưa có thông tin" : userLog.getEmail();
    String phoneUser = userLog == null ? "Chưa có thông tin" : userLog.getTel();
    String dobUser = userLog == null ? "Chưa có thông tin" : userLog.getDob();
    String addressUser = userLog == null ? "Chưa có thông tin" : userLog.getAddress();
    boolean isLocked = userLog.getLocked();
    String statusUser = "Trạng thái";

%>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="manage-blog.jsp"><b>Profile</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div id="heading" class="tile-title">
                    <div onclick="goBack()" style="background: none; color: #808990;" class="btn"><i
                            class="fas fa-angle-left"></i> Quay lại
                    </div>
                </div>
                <div class="tile-body">
                    <div style="margin: 0; padding: 0;max-width: 100%;" class="container">
                        <div class="row">
                            <%-- Profile left--%>
                            <div class="col-xl-4 left">
                                <div class="card mb-4 mb-xl-0">
                                    <h3 class="card-header">Thông tin tài khoản</h3>
                                    <div style="padding: 30px" class="card-body">
                                        <div style="align-items: center;justify-content: center;margin-bottom: 28px;" class="row">
                                            <img style="width: 70px; height: 70px; border-radius: 100%;" src="../images/user/no-avatar.png" alt="avatar">
                                            <div style="margin-left: 15px; font-size: 18px;">
                                                <div><%=nameUser%></div>
                                            </div>
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <label class="mb-1 row-info"><i class="fas fa-envelope"></i> </label>
                                            <div><%=emailUser%></div>
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <label class="mb-1 row-info"><i class="fas fa-phone"></i> </label>
                                            <div><%=phoneUser%></div>
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <label class="mb-1 row-info"><i class="fas fa-birthday-cake"></i> </label>
                                            <div><%=dobUser%></div>
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <label class="mb-1 row-info"><i class="fas fa-map-marker-alt"></i> </label>
                                            <div><%=addressUser%></div>
                                        </div>

                                        <div style="display: flex;flex-direction: row; align-items: center" class="row gx-3">
                                            <label id="lock-info" class="mb-1 row-info">
                                                <% if (isLocked) { %>
                                                    <i class="fas fa-lock"></i>
                                                <% } else { %>
                                                    <i class="fas fa-lock-open"></i>
                                                <% } %>
                                            </label>
                                            <span style="margin-right: 10px;"><%=statusUser%></span>
                                            <div id="button-lock">
                                                <span class="switch">
                                                    <input type="checkbox" id="switcher" <%if(isLocked == true){%>checked<%}%>>
                                                    <label for="switcher"></label>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- Profile right--%>
                            <div class="col-xl-8 right">
                                <div class="card mb-4">
                                    <h3 class="card-header">Hoạt động gần đây</h3>
                                    <div class="card-body p-5">
                                        <div>Chưa có hoạt động gần đây!!</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="../../common/admin/script.jsp" %>
</body>

<script>
    function goBack() {
        window.history.back();
    }

    // Xử lý khi thay đổi trạng thái tài khoản người dùng
    $(document).ready(function() {
        $('#switcher').change(function() {
            var isChecked = $(this).is(':checked');
            var userId = <%=idUser%>;

            if (isChecked) {
                $('#lock-info').html('<i class="fas fa-lock"></i>');
            } else {
                $('#lock-info').html('<i class="fas fa-lock-open"></i>');
            };

            $.ajax({
                url: 'manage-account',
                method: 'GET',
                data: { userId: userId, statusUser: isChecked ? 'lock' : 'unlock', action: 'changeStatusUser' }
            });

        });
    });
</script>

</html>