<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 17/02/2023
  Time: 7:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.model.UserModel" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.AccountService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Quản lý tài khoản | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>
    <style>
        .tabs .tab-item.active {
            background-color: #ffffff;
        }
    </style>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
    List<UserModel> listAccountUser = (List<UserModel>) request.getAttribute("listAccUser");

    List<UserModel> listAccountAdmin = (List<UserModel>) request.getAttribute("listAccAdmin");

    List<UserModel> listAccountLocked = (List<UserModel>) request.getAttribute("listAccLocked");

    Boolean isGrantAdd = false;
    Boolean isGrantEdit = false;
    Boolean isGrantDel = false;
    for (FunctionModel function : functions) {
        if (function.getName().equals("Add")) {
            isGrantAdd = auth.getDecentralizeFuncOfRole(idRole, "2", function.getId());
        } else if (function.getName().equals("Edit")) {
            isGrantEdit = auth.getDecentralizeFuncOfRole(idRole, "2", function.getId());
        } else if (function.getName().equals("Delete")) {
            isGrantDel = auth.getDecentralizeFuncOfRole(idRole, "2", function.getId());
        }
    }
%>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="manage-blog.jsp"><b>Quản lý tài khoản</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <!-- Tài khoản Admin -->
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <%-- Tabs --%>
                        <div class="col-sm-5" style="padding-left: 10px">

                            <div class="tabs"
                                 style="display: flex; min-width: 170px; padding: 3px; border-radius: 5px; background-color: #ededef">
                                <div class="tab-item active"
                                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                                    <b>Tài khoản admin</b>
                                </div>

                                <div class="tab-item"
                                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                                    <b>Tài khoản người dùng</b>
                                </div>

                                <div class="tab-item"
                                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                                    <b>Tài khoản bị khóa</b>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%--  Tab Content --%>
                    <div class="tab-content">
                        <div class="tab-pane active">
                            <%--Panel Button--%>
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <%if (isGrantAdd == true) {%>
                                    <a class="btn btn-add btn-sm" href="manage-account.jsp?action=add"
                                       title="Thêm"><i
                                            class="fas fa-plus"></i>
                                        Tạo mới
                                    </a>
                                    <%} else {%>
                                    <button
                                            class="btn btn-add btn-sm"
                                            type="button"
                                            title="Không có quyền này!"
                                            style="opacity: 0.5; cursor: not-allowed;"
                                            disabled
                                    >
                                        <i class="fas fa-plus"></i> Tạo mới
                                    </button>
                                    <%}%>

                                </div>

                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm" type="button" title="Xóa"
                                       onclick="myFunction(this)"><i
                                            class="fas fa-trash-alt"></i> Xóa tất cả </a>
                                </div>
                            </div>

                            <%--  Content Admin --%>
                            <% if (listAccountAdmin == null) {
                            %>
                            <div>Chưa có tài khoản nào</div>
                            <%
                            } else {%>
                            <table class="display table table-hover table-bordered" id="adminTable">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Username</th>
                                    <th width="10%">Email</th>
                                    <th>Tel</th>
                                    <th>Sex</th>
                                    <th>Address</th>
                                    <th>Nhóm quyền</th>
                                    <th>Chi tiết</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if(listAccountAdmin != null) for (UserModel acc :
                                            listAccountAdmin) {%>
                                <tr>
                                    <td><%=acc.getId()%>
                                    </td>
                                    <td><%=acc.getName()%>
                                    </td>
                                    <td><%=acc.getUsername()%>
                                    </td>
                                    <td><%=acc.getEmail()%>
                                    </td>
                                    <td><%=acc.getTel()%>
                                    </td>
                                    <td><%=acc.getSex()%>
                                    </td>
                                    <td><%=acc.getAddress()%>
                                    </td>
                                    <td><%=acc.getNameRole()%>
                                    </td>
                                    <td>
                                        <a href="manage-account?action=profile-user&id-user=<%=acc.getId()%>" style="display: flex; align-items: center;">
                                            <p title="Xem chi tiết" style="margin: 0; padding-left: 20px; font-size: 17px"><i style="width: 100%;height: 100%" class="fas fa-angle-right"></i></p>
                                        </a>
                                    </td>
                                </tr>
                                <%
                                    }%>
                                </tbody>
                            </table>
                            <%
                                }%>
                        </div>

                        <div class="tab-pane">
                            <%--  Content User --%>

                            <%--Panel Button--%>
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <%if (isGrantAdd == true) {%>
                                    <a class="btn btn-add btn-sm" href="manage-account.jsp?action=add"
                                       title="Thêm"><i
                                            class="fas fa-plus"></i>
                                        Tạo mới
                                    </a>
                                    <%} else {%>
                                    <button
                                            class="btn btn-add btn-sm"
                                            type="button"
                                            title="Không có quyền này!"
                                            style="opacity: 0.5; cursor: not-allowed;"
                                            disabled
                                    >
                                        <i class="fas fa-plus"></i> Tạo mới
                                    </button>
                                    <%}%>

                                </div>

                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm" type="button" title="Xóa"
                                       onclick="myFunction(this)"><i
                                            class="fas fa-trash-alt"></i> Xóa tất cả </a>
                                </div>
                            </div>

                            <%--  danh sách người dùng --%>
                            <% if (listAccountUser == null) {
                            %>
                            <div>Chưa có tài khoản nào</div>
                            <%
                            } else {%>
                            <table class="display table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Tel</th>
                                    <th>Sex</th>
                                    <th>Address</th>
                                    <th>Nhóm quyền</th>
                                    <th>Chi tiết</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (UserModel acc :
                                            listAccountUser) {%>
                                <tr>
                                    <td><%=acc.getId()%>
                                    </td>
                                    <td><%=acc.getName()%>
                                    </td>
                                    <td><%=acc.getUsername()%>
                                    </td>
                                    <td><%=acc.getEmail()%>
                                    </td>
                                    <td><%=acc.getTel()%>
                                    </td>
                                    <td><%=acc.getSex()%>
                                    </td>
                                    <td><%=acc.getAddress()%>
                                    </td>
                                    <td><%=acc.getNameRole()%>
                                    </td>
                                    <td>
                                        <a href="manage-account?action=profile-user&id-user=<%=acc.getId()%>" style="display: flex; align-items: center;">
                                            <p title="Xem chi tiết" style="margin: 0; padding-left: 20px; font-size: 17px"><i style="width: 100%;height: 100%" class="fas fa-angle-right"></i></p>
                                        </a>
                                    </td>
                                </tr>
                                <%
                                    }%>
                                </tbody>
                            </table>
                            <%
                                }%>
                        </div>

                        <div class="tab-pane">
                            <table class="display table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Tel</th>
                                    <th>Sex</th>
                                    <th>Address</th>
                                    <th>Nhóm quyền</th>
                                    <th>Chi tiết</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if(listAccountLocked != null) for (UserModel acc :
                                            listAccountLocked) {%>
                                <tr>
                                    <td><%=acc.getId()%>
                                    </td>
                                    <td><%=acc.getName()%>
                                    </td>
                                    <td><%=acc.getUsername()%>
                                    </td>
                                    <td><%=acc.getEmail()%>
                                    </td>
                                    <td><%=acc.getTel()%>
                                    </td>
                                    <td><%=acc.getSex()%>
                                    </td>
                                    <td><%=acc.getAddress()%>
                                    </td>
                                    <td><%=acc.getNameRole()%>
                                    </td>
                                    <td>
                                        <a href="manage-account?action=profile-user&id-user=<%=acc.getId()%>" style="display: flex; align-items: center;">
                                            <p title="Xem chi tiết" style="margin: 0; padding-left: 20px; font-size: 17px"><i style="width: 100%;height: 100%" class="fas fa-angle-right"></i></p>
                                        </a>
                                    </td>
                                </tr>
                                <%
                                    }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Essential javascripts for application to work-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    $('table.display').DataTable();
</script>

</body>
<script type="text/javascript">


    const tabs = document.querySelectorAll('.tab-item');
    const panes = document.querySelectorAll('.tab-pane');


    tabs.forEach((tab, index) => {
        const pane = panes[index];
        tab.onclick = function () {
            document.querySelector('.tab-item.active').classList.remove('active')
            document.querySelector('.tab-pane.active').classList.remove('active')

            this.classList.add('active')
            pane.classList.add('active')
        }
    })

    const tab_menu = document.querySelector('.tabs')
    const length_tab = tabs.length;
    var width_tab = 170 * length_tab + 7;
    tab_menu.style.width = width_tab + 'px';
</script>
</html>