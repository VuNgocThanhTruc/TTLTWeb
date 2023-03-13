<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 19/02/2023
  Time: 11:06 SA
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="vn.edu.hcmuaf.fit.model.UserModel" %>
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
    // Lấy ra quyền của từng chức năng
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

    // Lấy ra toàn bộ quyền
    List<RoleModel> roles =  auth.getAllRole();

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
                                <%--Nút xem phân quyền--%>
                                    <button style="font-size: 12px;padding: 4px 7px;"
                                            type="button"
                                            class="btn btn-info btn-sm"
                                            title="Xem phân quyền"
                                            onclick="viewDecentralize(${role.id})">
                                        <i class="fas fa-eye"></i>
                                    </button>

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
                                            disabled
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

<%-- Modal View Decentralize--%>
<%for(RoleModel roleModel : roles) { %>
<div class="modal-decentralize" id="modal-<%=roleModel.getId()%>" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="header">
                <div style="padding: 16px">Phân quyền cho nhóm quyền: <span style="color: var(--info)"><%=roleModel.getName()%></span></div>
            </div>
            <div class="modal-body">
                <%--table role--%>
                <table style="font-size: 14px" class="table table-hover table-bordered" id="sampleTable">
                    <thead>
                    <tr>
                        <th width="70" style="min-width: 100px">Thành phần\Chức năng</th>
                        <% for(FunctionModel function : functions) { %>
                        <th style="text-align: center;width: 50px;max-width: 50px"><%=function.getName()%></th>
                        <%}%>
                    </tr>
                    </thead>
                    <tbody>
                    <% for(ComponentModel component : components) { %>
                    <tr>
                        <td><%= component.getName() %></td>
                        <% for(FunctionModel function : functions) { %>

                        <td class="td-role" width="50" style="text-align: center;max-width: 50px">
                            <%
                                String idComponent = component.getId();
                                String idFunction = function.getId();
                                Boolean isGrant = auth.getDecentralizeFuncOfRole(roleModel.getId(), idComponent, idFunction);
                            %>
                            <input
                                <% if(isGrant == true) {%> checked <%}%>
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
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="closeViewDecentralize(<%=roleModel.getId()%>)">Close</button>
            </div>
        </div>

    </div>
</div>
<%}%>


<%-- end modal--%>

<%@include file="../../common/admin/script.jsp" %>
<!-- Essential javascripts for application to work-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
<script type="text/javascript" src="../js/role.js"></script>
<script>
    function viewDecentralize(idRole){
        const modal = document.getElementById("modal-"+idRole);
        modal.style.display = "block";
    }

    function closeViewDecentralize(idRole){
        const modal = document.getElementById("modal-"+idRole);
        modal.style.display = "none";
    }
</script>
</body>

</html>