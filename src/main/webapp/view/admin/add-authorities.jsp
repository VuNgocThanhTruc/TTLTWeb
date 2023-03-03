<%@ page import="java.util.List" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 19/02/2023
  Time: 2:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<html>
<head>
    <title>Thêm nhóm quyền | ADMIN</title>
    <!-- Role CSS -->
    <link rel="stylesheet" type="text/css" href="../css/role.css">
    <!-- Font-icon css-->
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
    <%@include file="../../common/admin/head.jsp" %>
</head>

<body class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<%
    String pageContextPath = (String) request.getContextPath();
%>

<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="manage-authorities?action=manage-authorities">Quản lý nhóm quyền</a></li>
            <li class="breadcrumb-item">Thêm nhóm quyền</li>
        </ul>
    </div>
    <div class="row" id="change_product">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo nhóm quyền</h3>
                <div class="tile-body">
                    <form action="<%=pageContextPath%>/admin/manage-authorities?action=add-authorities" method="post">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label">Tên nhóm quyền </label>
                                <input class="form-control" type="text" placeholder="" name="name-role"
                                       value="">
                            </div>
                        <!-- Cài đặt quyền -->

                            <label  style="width: 100%; padding: 0 15px;" class="control-label">Cài đặt quyền</label>
                            <div style="width: 100%; padding:  0 15px">
                            <c:if test="${components == null}" >
                                 <div>Chưa có thành phần nào để thiết lập quyền</div>
                            </c:if>

                            <c:if test="${components != null}" >
                                <table style="font-size: 14px" class="table table-hover table-bordered" id="sampleTable">
                                    <thead>
                                    <tr>
                                        <th>Thành phần</th>
                                        <c:forEach  items="${functions}" var="function">
                                            <th style="text-align: center">${function.name}</th>
                                        </c:forEach>
                                    </tr>
                                    </thead>
                                    <tbody>
                                <%-- vòng lặp --%>
                                <c:forEach items="${components}" var="component">
                                    <tr>
                                        <td width="100px">${component.name}</td>
                                        <c:forEach var="function" items="${functions}" >
                                            <td width="40px" style="text-align: center"><input type="checkbox" name="cb_decentralize" value="${component.id}-${function.id}"></td>
                                        </c:forEach>
                                    </tr>
                                </c:forEach>
                                <%-- end vòng lặp --%>
                                    </tbody>
                                </table>
                            </c:if>
                            </div>
                        <%--   end cài đặt quyền   --%>
                            <div class="form-group col-md-12">
                                <label class="control-label">Mô tả quyền</label>
                                <textarea class="form-control" name="describe-role"
                                          id="description"></textarea>
                                <script>CKEDITOR.replace('description');</script>
                            </div>
                            <button style="margin-left: 15px" class="btn btn-save" type="submit" onclick="save()">Lưu lại</button>
                            <button style="margin-left: 15px" class="btn btn-cancel" data-dismiss="modal" type="reset">Hủy bỏ</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="../../common/admin/script.jsp" %>

</body>
</html>