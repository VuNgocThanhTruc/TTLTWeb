<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý đặt lịch sửa chữa| ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>

</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
    List<BookingModel> listBooking = (List<BookingModel>) request.getAttribute("listBooking");
    List<CategoryModel> listTypeStatusBook = (List<CategoryModel>) request.getAttribute("listTypeStatusBook");

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
            <li class="breadcrumb-item">Quản lý đặt lịch Online</li>
            <li class="breadcrumb-item"><a href="#">Danh sách đặt lịch Online</a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <%--                        <div class="col-sm-2">--%>

                        <%--                            <a class="btn btn-add btn-sm" href="add-booked.jsp" title="Thêm"><i--%>
                        <%--                                    class="fas fa-plus"></i>--%>
                        <%--                                Tạo mới </a>--%>
                        <%--                        </div>--%>
                        <%--                        <div class="col-sm-2">--%>
                        <%--                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"--%>
                        <%--                               onclick="myApp.printTable()"><i--%>
                        <%--                                    class="fas fa-print"></i> In dữ liệu</a>--%>
                        <%--                        </div>--%>

                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>ID</th>
                            <th>Tên người đặt</th>
                            <th>Điện thoại</th>
                            <th>Ngày đặt</th>
                            <th>Tình trạng</th>
                            <th>Mô tả</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (BookingModel booking : listBooking) {%>
                        <tr>
                            <td width="10"><input type="checkbox" name="checkbox" value="1"></td>
                            <td name="id"><%=booking.getId()%>
                            </td>
                            <td name="name"><%=booking.getUsername()%>
                            </td>
                            <td name="phone"><%=booking.getTel()%>
                            </td>
                            <td name="date_booking"><%=booking.getDate_booking()%>
                            </td>
                            <td>
                                <select class="select-type-booking form-control" id="status" name="status"
                                        onchange="changeStatusBooking(<%=booking.getId()%>)">
                                    <%for (CategoryModel statusBook : listTypeStatusBook) {%>
                                    <option value="<%=statusBook.getId()%>" <%=statusBook.getId() == booking.getStatusBooking().getId() ? "selected" : ""%>>
                                        <%=statusBook.getName()%>
                                    </option>
                                    <%}%>
                                </select>
                            </td>
                            <td name="description"><%=booking.getDescription()%>
                            </td>
                            <td>
                                <%--view booking--%>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Xem"
                                        onclick="openModalLogistic()">
                                    <i class="fa fa-eye"></i>
                                </button>
                                <%--sua booking--%>
                                <%if (isGrantEdit == true) {%>
                                <a href="manage-confirm?type=edit-confirm&id-confirm=<%=booking.getId()%>">
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
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
                                <%--                                    xóa--%>
                                <%if (isGrantDel == true) {%>
                                <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                   href="manage-booking?status=wait-accept&action=delete&id=<%=booking.getId()%>"><i
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
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- MODAL EDIT BASIC -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
    Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="modalLogistic" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form method="POST">
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
                          <span class="thong-tin-thanh-toan">
                            <h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>
                          </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="control-label" for="idModal">Mã sản phẩm </label>
                            <input class="form-control" type="number" value="" id="idModal" name="idModal" disabled>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label" for="nameModal">Tên sản phẩm</label>
                            <input class="form-control" type="text" required
                                   value="" id="nameModal" name="nameModal">
                        </div>
                        <div class="form-group  col-md-6">
                            <label class="control-label" for="brandModal">Thương hiệu</label>
                            <select class="form-control" id="brandModal" name="brandModal">
                            </select>

                        </div>
                        <div class="form-group col-md-6 ">
                            <label for="statusModal" class="control-label" for="statusModal">Tình trạng sản phẩm</label>
                            <select class="form-control" id="statusModal" name="statusModal">
                                <option value="1">Còn hàng</option>
                                <option value="0">Hết hàng</option>
                                <option value="-1">Ngưng hoạt động</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label" for="priceModal">Giá bán</label>
                            <input class="form-control" type="text" id="priceModal" name="priceModal" value="300.000đ">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="categoryModal" class="control-label">Danh mục</label>
                            <select class="form-control" id="categoryModal" name="categoryModal">
                            </select>
                        </div>
                    </div>
                    <br>
                    <a class="urlEditBasic"
                       style="float: right;font-weight: 600;color: #ea0000;">Chỉnh sửa sản phẩm nâng cao</a>
                    <BR>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                    <span class="close" onclick="closeModal()">Đóng</span>
                </div>
            </form>
        </div>
    </div>
</div>
<!--
<%@include file="../../common/admin/script.jsp" %>
-->

<script>
    async function changeStatusBooking(idBooking) {
        let value = $('#status').val()
        await $.ajax({
            type: 'GET',
            url: `<%=request.getContextPath()%>/admin/manage-booking?status=wait-accept&type-status=${value}&id-booking=${idBooking}`,
            success: function () {
                swal("Thay đổi trạng thái đơn hàng thành công!", {
                    title: "Thông báo",
                    buttons: false,
                    timer: 3000,
                    icon: "success",
                });
            }
        });
        location.reload()
    }
</script>

</body>