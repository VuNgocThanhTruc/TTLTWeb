<%@ page import="vn.edu.hcmuaf.fit.util.AuthoritiesUtil" %><%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 20/06/2023
  Time: 6:52 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm tài khoản | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>
    <link rel="stylesheet" href="../css/sign.css">
</head>
<body onload="time()"  class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<% String mess = (String) session.getAttribute("mess"); %>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="manage-account?action=manager-account"><b>Quản lý tài khoản</b></a></li>
            <li class="breadcrumb-item active"><b style="color: #000000">Thêm tài khoản</b></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">

                    <div class="row element-button">
                        <div class="col-sm-5" style="padding-left: 10px">
                            <a href="<%=request.getContextPath()%>/admin/manage-account?action=manager-account" style="background: none; color: #808990;" class="btn"><i class="fas fa-angle-left"></i> Quay lại</a>
                        </div>
                    </div>

                    <div class="content">
                        <section class="signup">
                            <div class="container">
                                <div class="signin-left">
                                    <div class="sign-title">
                                        <h1>Tạo tài khoản</h1>
                                    </div>
                                </div>
                                <div class="signin-right ">
                                    <form action="manage-account?action=add-account" method="post">
                                        <div class="firstname form-control1 ">
                                            <%if (mess =="success") { %>
                                            <div class="alert alert-success">
                                                <strong>Đã tạo tài khoản thành công</strong>
                                            </div>
                                            <%}%>
                                            <%if (mess =="errorsignup") { %>
                                            <div class="alert alert-danger">
                                                <strong>Tài khoản hoặc email</strong> đã tồn tại. Vui lòng nhập  <strong>tài khoản hoặc email</strong> khác
                                            </div>
                                            <%}%>
                                            <%if (mess =="errornull") { %>
                                            <div class="alert alert-danger">
                                                Vui lòng<strong> nhập đầy đủ</strong>.
                                            </div>
                                            <%}%>
                                            <input type="text" id="firstname" name="hovaten" placeholder="Họ và Tên" required>
                                        </div>

                                        <div class="sex form-control1">
                                            <div class="female">
                                                <input type="radio" id="female" checked name="sex" value="0">
                                                <label for="female">Nữ</label>
                                            </div>
                                            <div class="male">
                                                <input type="radio" id="male" name="sex" value="1">
                                                <label for="male">Nam</label>
                                            </div>
                                        </div>
                                        <div class="birthday form-control1">
                                            <input type="date" id="birthday" name="dob" placeholder="mm/dd/yyyy" required>
                                        </div>
                                        <div class="username form-control1">
                                            <input type="email" id="email" name="email" placeholder="Email" >
                                        </div>

                                        <div class="username form-control1">
                                            <input type="text" id="username" name="username" placeholder="Tài khoản" required>
                                        </div>
                                        <div class="password form-control1">
                                            <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
                                        </div>
                                        <select style="width: 100%; height: 50px" name="role" class="form-control1">
                                            <option value="<%=AuthoritiesUtil.idRoleUser%>" selected>Nhóm quyền: User</option>
                                        <%
                                            for(RoleModel roleModel : auth.getAllRole()){
                                                if(!roleModel.getName().equals("Administrator")){
                                        %>
                                            <option value="<%=roleModel.getId()%>">Nhóm quyền: <%=roleModel.getName()%></option>

                                        <%}}%>
                                        </select>
                                        <div>
                                            <input class="submit" type="submit" value="Tạo" id="submit" style="color: whitesmoke"/>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
