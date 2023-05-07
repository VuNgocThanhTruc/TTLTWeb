<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 17/02/2023
  Time: 7:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.AccountService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Thêm giảm giá | ADMIN</title>
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
    List<DiscountModel> discountList1 = (List<DiscountModel>) DiscountDAO.getProductNoDiscount();
    List<DiscountModel> discountList2 = (List<DiscountModel>) DiscountDAO.getTypeProduct();
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
            <li class="breadcrumb-item active"><a href="manage-discount.jsp"><b>Quản lý giảm giá</b></a></li>
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
                                 style="display: flex; min-width: 346px; max-width: 342px;padding: 3px; border-radius: 5px; background-color: #ededef">
                                <div class="tab-item active"
                                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                                    <b>Theo từng sản phẩm</b>
                                </div>

                                <div class="tab-item"
                                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                                    <b>Theo loại sản phẩm</b>
                                </div>

                            </div>

                        </div>
                    </div>
                    <%--  Tab Content --%>
                    <div class="tab-content">
                        <div class="tab-pane active">

                            <%--  Content Admin --%>
                            <% if (discountList1 == null) {
                            %>
                            <div>Sản phẩm nào cũng đã có mã giảm giá</div>
                            <%
                            } else {%>
                            <table class="display table table-hover table-bordered" id="adminTable">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Loại sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Ảnh</th>
                                    <th>Giá tiền</th>
                                    <th>Giảm giá</th>
                                    `
                                    <th>Ngày giờ bắt đầu</th>
                                    <th>Ngày giờ kết thúc</th>
                                    <th>Chức năng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (DiscountModel list : discountList1) {%>
                                <tr>
                                    <td><%=list.getIdProduct()%>
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
                                    <td>
                                        <input class="form-control" type="number" placeholder="" name="name_photo"
                                               value="">
                                    </td>
                                    <td><input class="form-control" type="datetime" placeholder="" name="name_photo"
                                               value="">
                                    </td>
                                    <td><input class="form-control" type="date" placeholder="" name="name_photo"
                                               value="">
                                    </td>
                                    <td>
                                        <%--chức năng xóa người dùng--%>
                                        <%if (isGrantDel == true) {%>
                                        <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                           href="manage-blog?action=delete&id=<%=list.getIdProduct()%>"><i
                                                class="fas fa-trash-alt"></i></a>
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
                                        <%-- chức năng sửa thông tin người dùng--%>
                                        <%if (isGrantEdit == true) {%>
                                        <a href="manage-blog?action=edit-blog&id-blog=<%=list.getIdProduct()%>               ">
                                            <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                                    id="show-confirm-admin"
                                                    data-toggle="modal" data-target="#ModalConfirm"><i
                                                    class="fas fa-edit"></i>
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
                                <%
                                    }%>
                                </tbody>
                            </table>
                            <%
                                }%>
                        </div>

                        <div class="tab-pane">
                            <%--  Content User --%>


                            <%--  danh sách người dùng --%>
                            <% if (discountList2 == null) {
                            %>
                            <div>Chưa có loại sản phẩm</div>
                            <%
                            } else {%>
                            <div class="tile-body">
                                <form action="manage-discount?type=addByTypeProduct" method="post">


                                    <div class="form-group col-md-3 ">
                                        <label for="statusProduct" class="control-label">Loại sản phẩm</label>
                                        <select class="form-control" id="statusProduct" name="typeProduct">
                                            <%
                                                for (DiscountModel list : discountList2) {%>
                                            <option value="<%=list.getIdTypeProduct()%>" name="typeProduct"
                                                    selected><%=list.getNameTypeProduct()%>
                                            </option>
                                            <%}%>

                                        </select>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label class="control-label">Giảm giá(%)</label>
                                        <input class="form-control" type="number" placeholder="" name="numberDiscount"
                                               value="" min="1" max="100">
                                    </div>

                                    <div class="form-group col-md-3">
                                        <label class="control-label">Ngày bắt đầu bắt đầu</label>
                                        <input class="form-control" type="datetime-local" placeholder=""
                                               name="dateStart"
                                               value="" step="1">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label class="control-label">Ngày giờ kết thúc</label>
                                        <input class="form-control" type="datetime-local" placeholder="" name="dateEnd" step="1">
                                    </div>

                                    <input class="btn btn-save" type="submit" value="lưu lại"/>
                                    <a href="manage-discount">
                                        <button class="btn btn-cancel" data-dismiss="modal" type="reset">Hủy bỏ</button>
                                    </a>
                                </form>


                            </div>
                            <%
                                }%>
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

    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);
    const tabs = $$('.tab-item');
    const panes = $$('.tab-pane');

    tabs.forEach((tab, index) => {
        const pane = panes[index];
        tab.onclick = function () {
            $('.tab-item.active').classList.remove('active')
            $('.tab-pane.active').classList.remove('active')

            this.classList.add('active')
            pane.classList.add('active')
        }
    })
</script>
</html>