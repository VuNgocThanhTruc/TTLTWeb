<%--
  Created by IntelliJ IDEA.
  User: vutru
  Date: 12/8/2022
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en"><head>
</head>
<body>
<% User user = (User) session.getAttribute("userlogin"); %>
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images/admin.png" width="50px"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-name"><b><%=user.getName()%></b></p>
            <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item active " href="index"><i class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Bảng điều khiển</span></a></li>
        <li><a class="app-menu__item" href="manage-customer"><i class='app-menu__icon bx bx-user-voice'></i><span
                class="app-menu__label">Quản lý khách hàng</span></a></li>
        <li><a class="app-menu__item" href="manage-product"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a></li>
        <li><a class="app-menu__item" href="manage-order"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Quản lý đơn hàng</span></a></li>
        <li><a class="app-menu__item" href="manage-booking?status=accepted"><i class='app-menu__icon bx bx-calendar-check'></i><span
                class="app-menu__label">Quản lý đặt lịch sửa chữa </span></a></li>
        <li><a class="app-menu__item" href="manage-booking?status=wait-accept"><i class='app-menu__icon bx bx-calendar-check'></i><span
                class="app-menu__label">Chờ xác nhận </span></a></li>
        <li><a class="app-menu__item" href="manage-blog"><i class='app-menu__icon bx bx-news'></i><span
                class="app-menu__label">Quản lý tin tức </span></a></li>
        <li><a class="app-menu__item" href="manage-image"><i class='app-menu__icon bx bx-image'></i><span
                class="app-menu__label">Quản lý ảnh </span></a></li>
        <li><a class="app-menu__item" href="manage-contact"><i class='app-menu__icon bx bx-image'></i><span
                class="app-menu__label">Quản lý liên hệ </span></a></li>
    </ul>
</aside>
</body>
</html>