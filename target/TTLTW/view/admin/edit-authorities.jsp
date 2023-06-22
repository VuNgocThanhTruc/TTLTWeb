<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 19/02/2023
  Time: 9:01 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.service.AuthoritiesService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.ComponentModel" %>
<%@ page import="vn.edu.hcmuaf.fit.model.FunctionModel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Sửa nhóm quyền | ADMIN</title>
    <!-- Role CSS -->
    <link rel="stylesheet" type="text/css" href="../css/role.css">
    <!-- Font-icon css-->
    <!-- or -->
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
    <%@include file="../../common/admin/head.jsp" %>
</head>

<body class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<%
    AuthoritiesService authoritiesService = new AuthoritiesService();
    String idRoleEdit = request.getParameter("id-role");
    Boolean isAdminitrator = idRoleEdit.equals("1");
    String pageContextPath = (String) request.getContextPath();
%>

<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="manage-authorities?action=manage-authorities">Quản lý nhóm quyền</a></li>
            <li class="breadcrumb-item">Chỉnh sửa nhóm quyền</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Chỉnh sửa nhóm quyền</h3>
                <div class="tile-body">
                    <form action="<%=pageContextPath%>/admin/manage-authorities?action=edit-authorities" method="post">
                        <div class="row">
                            <div class="form-group col-md-10">
                                <label class="control-label">Nhóm quyền chỉnh sửa:
                                    <span style="color: var(--info)"><%=request.getAttribute("name-role")%></span>
                                </label>
                            </div>
                            <!-- id nhóm quyền -->
                            <input type="hidden" name="id-role" value="<%=request.getAttribute("id-role")%>">

                            <!-- Tên nhóm quyền -->
                            <input id="name-role" type="text" name="name-role" title="Tên nhóm quyền" required autofocus
                                   value="<%=request.getAttribute("name-role")%>">

                            <!-- Cài đặt quyền -->
                            <label  style="width: 100%; padding: 0 15px;" class="control-label">Cài đặt quyền</label>
                            <div style="width: 100%; padding:  0 15px">
                            <table style="font-size: 14px" class="table table-hover table-bordered" id="decTable">
                                <thead>
                                    <tr>
                                        <th width="70">Thành phần\Chức năng</th>
                                        <% for(FunctionModel function : functions) { %>
                                            <th style="text-align: center"><%=function.getName()%></th>
                                        <%}%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(ComponentModel component : components) { %>
                                        <tr>
                                            <td width="40"><%= component.getName() %></td>
                                            <% for(FunctionModel function : functions) { %>

                                                <td class="td-role" width="40" style="text-align: center">
                                                    <%
                                                        String idComponent = component.getId();
                                                        String idFunction = function.getId();
                                                        Boolean isGrant = authoritiesService.getDecentralizeFuncOfRole(idRoleEdit, idComponent, idFunction);
                                                    %>
                                                    <input
                                                        <% if(isGrant == true) {%> checked <%}%>
                                                        <% if(isAdminitrator == true) {%>
                                                        disabled
                                                        title="Không thể chỉnh sửa quyền này"
                                                        <%}%>
                                                        type="checkbox"
                                                        class="cb-role"
                                                        value="<%=component.getId()%>-<%=function.getId()%>"
                                                        name="cb_decentralize"
                                                    >
                                                </td>
                                            <%}%>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            </div>
                            <%--   end cài đặt quyền   --%>
                            <div class="form-group col-md-12">
                                <label class="control-label">Mô tả quyền</label>
                                <textarea class="form-control" name="describe-role"
                                          id="description" required="required" ><%=request.getAttribute("describe-role")%></textarea>
                                <script>CKEDITOR.replace('description');</script>
                            </div>
                            <button style="margin-left: 15px" class="btn btn-save" type="submit" onclick="return confirmNotify('Bạn chắc chắn muốn sửa nhóm quyền ?')">Lưu lại</button>
                            <a style="margin-left: 15px" class="btn btn-cancel" onclick="return confirmNotify('Bạn chắc chắn muốn hủy bỏ?')" href="manage-authorities?action=manage-authorities">Hủy bỏ</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<script type="text/javascript" src="../js/role.js"></script>
</body>
</html>
