<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 19/02/2023
  Time: 11:06 SA
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.AccountService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý quyền | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>
</head>
<!-- Role CSS -->
<link rel="stylesheet" type="text/css" href="../css/role.css">

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
    String idComp = (String) request.getAttribute("id-component");
    Boolean isGrantAdd = false;
    Boolean isGrantEdit = false;
    Boolean isGrantDel = false;
    for(FunctionModel function : functions){
        if(function.getName().equals("Add")){
            isGrantAdd = auth.getDecentralizeFuncOfRole(idRole,"10",function.getId());
        }else if(function.getName().equals("Edit")){
            isGrantEdit = auth.getDecentralizeFuncOfRole(idRole,"10",function.getId());
        }else if(function.getName().equals("Delete")){
            isGrantDel = auth.getDecentralizeFuncOfRole(idRole,"10",function.getId());
        }
    }
%>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="manage-blog.jsp"><b>Quản lý quyền</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div style="justify-content: space-between;" class="row element-button">
                        <div class="col-sm-2">
                            <%if(isGrantAdd == true) {%>
                            <a class="btn btn-add btn-sm" href="manage-authorities?action=add-authorities" title="Thêm nhóm quyền"> <i
                                    class="fas fa-plus"></i>
                                Tạo nhóm quyền</a>
                            <%} else {%>
                            <button
                                    class="btn btn-add btn-sm"
                                    type="button"
                                    title="Không có quyền này!"
                                    style="opacity: 0.5; cursor: not-allowed;"
                                    disabled
                            >
                                <i class="fas fa-plus"></i> Tạo nhóm quyền
                            </button>
                            <%}%>
                        </div>
                    <!--  thông báo  -->
                        <div>
                            <div class="notify">
                                <% if(request.getAttribute("notify") != null) {%>
                                    <%=request.getAttribute("notify")%>
                                <%}%>
                            </div>
                        </div>
                    </div>
                    <!--  danh sách quyền  -->

                    <c:if test="${roles == null}">
                        <div>Chưa thiết lập quyền nào</div>
                    </c:if>

                    <c:if test="${roles != null}">
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>STT</th>
                            <th>Tên quyền</th>
                            <th>Mô tả</th>
                            <th>Quản lý</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${roles}" var="role" varStatus="loop">
                        <tr>
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td width="30" style="text-align: center">${loop.count}</td>
                            <td>${role.name}</td>
                            <td>${role.describe}</td>
                            <td>
                                <%--Nút xóa nhóm quyền--%>
                                <%if(isGrantDel == true) {%>
                                <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                   href="manage-authorities?action=delete-authorities&id-role=${role.id}"><i class="fas fa-trash-alt"></i></a>
                                <%} else {%>
                                    <button
                                    class="btn btn-primary btn-sm trash"
                                    type="button"
                                    title="Không có quyền này!"
                                    style="opacity: 0.5; cursor: not-allowed;"
                                    disabled
                                    >
                                    <i class="fas fa-trash-alt"></i>
                                    </button>
                                <%}%>
                                <%-- Nút chỉnh sửa nhóm quyền --%>
                                <%if(isGrantEdit == true) {%>
                                <a href="manage-authorities?action=edit-authorities&id-role=${role.id}">
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Chỉnh sửa"
                                            id="show-confirm"
                                            data-toggle="modal" data-target="#ModalConfirm"><i class="fas fa-edit"></i>
                                    </button>
                                </a>
                                <%} else {%>
                                    <button
                                            class="btn btn-primary btn-sm edit"
                                            type="button"
                                            title="Không có quyền này!"
                                            style="opacity: 0.5; cursor: not-allowed;"
                                    >
                                        <i class="fas fa-edit"></i>
                                    </button>
                                <%}%>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</main>

<!--
<%@include file="../../common/admin/script.jsp" %>
-->

<!-- Essential javascripts for application to work-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="../../admin/doc/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
<script>
    // function deleteRow(r) {
    //     var i = r.parentNode.parentNode.rowIndex;
    //     document.getElementById("myTable").deleteRow(i);
    // }
    //
    // oTable = $('#sampleTable').dataTable();
    // $('#all').click(function (e) {
    //     $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
    //     e.stopImmediatePropagation();
    // });

</script>

</body>

</html>