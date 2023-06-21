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
<%@ page import="vn.edu.hcmuaf.fit.dao.DiscountDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Quản lý Giảm Giá | ADMIN</title>
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

    List<DiscountModel> discountList = (List<DiscountModel>) DiscountDAO.getDiscountManage();

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
            <li class="breadcrumb-item active"><a href="manage-discount"><b>Quản lý giảm giá</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <%-- Tabs --%>
                        <div class="col-sm-5" style="padding-left: 10px">

                            <div class="tabs"
                                 style="display: flex; min-width: 346px; max-width: 342px;padding: 3px; border-radius: 5px; background-color: #ededef">
                                <div class="tab-item active"
                                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                                    <b>Sản phẩm đang giảm giá</b>
                                </div>

                                <div class="tab-item"
                                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                                    <b>Sản phẩm đang chờ hoặc hết giảm giá</b>
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
                                    <a class="btn btn-add btn-sm" href="manage-discount?type=add"
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

                                <% if (discountList == null) {
                                %>
                                <div>Chưa có dữ liệu</div>
                                <%
                                } else { %>

                                <table class="display table table-hover table-bordered" id="adminTable">
                                    <thead>
                                    <tr>
<%--                                        <th width="10"><input type="checkbox" id="all"></th>--%>
                                        <th>ID</th>
                                        <th>Loại sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Giá tiền</th>
                                        <th>Giảm giá</th>`
                                        <th>Giá tiền giảm</th>`
                                        <th>Ngày giờ bắt đầu</th>
                                        <th>Ngày giờ kết thúc</th>
                                        <th>Chức năng</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%

                                        for (DiscountModel list : discountList) {
                                            Date serverTime = new Date();
                                            Timestamp timestamp = new Timestamp(serverTime.getTime());
                                            Timestamp dateStart = Timestamp.valueOf(list.getDateStart());
                                            Timestamp dateEnd = Timestamp.valueOf(list.getDateEnd());
                                            if(dateEnd.getTime() > timestamp.getTime() && dateStart.getTime() <timestamp.getTime()){
                                            int priceDiscount= (int) Math.ceil(list.getPrice()*(100-list.getPercentDiscount())/100);
                                    %>
                                    <tr>
<%--                                        <td width="10"><input type="checkbox" name="check1" value="1"></td>--%>
                                        <td><%=list.getIdDiscount()%>
                                        </td>
                                        <td><%=list.getNameTypeProduct()%>
                                        </td>
                                        <td><%=list.getNameProduct()%>
                                        </td>
                                        <td>
                                            <img src="<% out.print("../images/product/"+list.getAvatar());%>"
                                                 alt="" width="100px;" class="avatar">
                                        </td>
                                        <td><%=list.getPrice()%>₫
                                        </td>
                                        <td><%=list.getPercentDiscount()%>%
                                        </td>

                                        <td><%= priceDiscount %>₫
                                        </td>
                                        <td><%=list.getDateStart()%>
                                        </td>
                                        <td><%=list.getDateEnd()%>
                                        </td>




                                        <td>
                                            <%--Xóa--%>
                                            <%if (isGrantDel == true) {%>
                                            <a href="manage-discount?type=del&id=<%=list.getIdDiscount()%>">
                                                <button class="btn btn-primary btn-sm trash" type="button" title="Xóa">
                                                    <i class="fas fa-trash-alt"> </i>
                                                </button>
                                            </a>
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
                                            <%--Sửa--%>
                                            <%if (isGrantEdit == true) {%>
                                            <a href="manage-discount?type=edit&id-product=<%=list.getIdProduct()%>">
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                                        id="show-emp" data-toggle="modal" data-target="#ModalUP">
                                                    <i class="fas fa-edit"></i>
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
                                    <%}}%>
                                    </tbody>
                                </table>
                                <%}%>
                        </div>

                        <div class="tab-pane">
                            <%--  Content User --%>

                            <%--Panel Button--%>
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <%if (isGrantAdd == true) {%>
                                    <a class="btn btn-add btn-sm" href="manage-discount?type=add"
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

                                <%-- in ra tin tức--%>
                                <% if (discountList == null) {
                                %>
                                <div>Chưa có dữ liệu</div>
                                <%
                                } else {%>
                                <table class="display table table-hover table-bordered" id="">
                                    <thead>
                                    <tr>
<%--                                        <th width="10"><input type="checkbox" id="all"></th>--%>
                                        <th>ID</th>
                                        <th>Loại sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Giá tiền</th>
                                        <th>Giảm giá</th>`
                                        <th>Giá tiền giảm</th>`
                                        <th>Ngày giờ bắt đầu</th>
                                        <th>Ngày giờ kết thúc</th>
                                        <th>Chức năng</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for (DiscountModel list : discountList) {
                                            Date serverTime = new Date();
                                            Timestamp timestamp = new Timestamp(serverTime.getTime());
                                            Timestamp dateStart = Timestamp.valueOf(list.getDateStart());
                                            Timestamp dateEnd = Timestamp.valueOf(list.getDateEnd());
                                            if(dateEnd.getTime() < timestamp.getTime() || dateStart.getTime() >timestamp.getTime()){
                                            int priceDiscount= (int) Math.ceil(list.getPrice()*(100-list.getPercentDiscount())/100);
                                    %>
                                    <tr>
<%--                                        <td width="10"><input type="checkbox" name="check1" value="1"></td>--%>
                                        <td><%=list.getIdDiscount()%>
                                        </td>
                                        <td><%=list.getNameTypeProduct()%>
                                        </td>
                                        <td><%=list.getNameProduct()%>
                                        </td>
                                        <td>
                                            <img src="<% out.print("../images/product/"+list.getAvatar());%>"
                                                 alt="" width="100px;" class="avatar">
                                        </td>
                                        <td><%=list.getPrice()%>₫
                                        </td>
                                        <td><%=list.getPercentDiscount()%>%
                                        </td>

                                        <td><%= priceDiscount %>₫
                                        </td>
                                        <td><%=list.getDateStart()%>
                                        </td>
                                        <td><%=list.getDateEnd()%>
                                        </td>




                                        <td>
                                            <%--Xóa--%>
                                            <%if (isGrantDel == true) {%>
                                            <a href="manage-discount?type=del&id=<%=list.getIdDiscount()%>">
                                                <button class="btn btn-primary btn-sm trash" type="button" title="Xóa">
                                                    <i class="fas fa-trash-alt"> </i>
                                                </button>
                                            </a>
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
                                            <%--Sửa--%>
                                            <%if (isGrantEdit == true) {%>
                                            <a href="manage-discount?type=edit&id-product=<%=list.getIdProduct()%>">
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                                        id="show-emp" data-toggle="modal" data-target="#ModalUP">
                                                    <i class="fas fa-edit"></i>
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
                                    <%}}%>
                                    </tbody>
                                </table>
                                <%}%>
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
</script>
</html>