<%@ page import="vn.edu.hcmuaf.fit.model.BookingModel" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.APIConstants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý lịch đặt | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>
<%    List<CategoryModel> listTypeStatusBook = (List<CategoryModel>) request.getAttribute("listTypeStatusBook");
%>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
    List<BookingModel> listBooking = (List<BookingModel>) request.getAttribute("listBooking");
    Boolean isGrantAdd = false;
    Boolean isGrantEdit = false;
    Boolean isGrantDel = false;
    for (FunctionModel function : functions) {
        if (function.getName().equals("Add")) {
            isGrantAdd = auth.getDecentralizeFuncOfRole(idRole, "10", function.getId());
        } else if (function.getName().equals("Edit")) {
            isGrantEdit = auth.getDecentralizeFuncOfRole(idRole, "10", function.getId());
        } else if (function.getName().equals("Delete")) {
            isGrantDel = auth.getDecentralizeFuncOfRole(idRole, "10", function.getId());
        }
    }
%>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a href="manage-order">Quản lý đơn hàng</a></li>
            <li class="breadcrumb-item"><a href="#">Danh sách đơn hàng</a></li>
        </ul>
        <div id="clock"></div>
    </div>


    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <%--Tạo đơn hàng--%>
                            <%if (isGrantAdd == true) {%>
                            <a class="btn btn-add btn-sm" href="manage-order?type=add" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới đơn hàng</a>
                            <%} else {%>
                            <button
                                    class="btn btn-add btn-sm"
                                    type="button"
                                    title="Không có quyền này!"
                                    style="opacity: 0.5; cursor: not-allowed;"
                                    disabled
                            >
                                <i class="fas fa-plus"></i> Tạo mới đơn hàng
                            </button>
                            <%}%>
                        </div>


                        <%--                        <div class="col-sm-2">--%>
                        <%--                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"--%>
                        <%--                               onclick="myApp.printTable()"><i--%>
                        <%--                                    class="fas fa-print"></i> In dữ liệu</a>--%>
                        <%--                        </div>--%>


                        <div class="col-sm-2">
                            <a href="manage-order?type=delete-all" class="btn btn-delete btn-sm" type="button"
                               title="Xóa"
                               onclick="myFunction(this)"><i
                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="manage-order?type=exportExcel" class="btn" type="button" title="Xuất dữ liệu"
                               style="line-height: 0px;border: 1px solid #000000; font-size: 13px; padding: 5px 10px"
                            ><i class='bx bxs-file-export'></i> Xuất Excel</a>
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
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (BookingModel booking : listBooking) {%>
                        <tr>
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td name="id"><%=booking.getId()%>
                            </td>
                            <td name="name"><%=booking.getUsername()%>
                            </td>
                            <td name="phone"><%=booking.getTel()%>
                            </td>
                            <td name="date_booking"><%=booking.getDate_booking()%>
                            </td>
                            <td>
                                <select class="form-control" id="status" name="status" onchange="changeStatusBooking(<%=booking.getId()%>)">
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
                                <%--view transport --%>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Thông tin vận chuyển" id="show-emp"
                                        data-toggle="modal" data-target="#ModalViewTransport"
                                        onclick="handleClickViewTransport(`<%=booking.getIdTransport()%>`)"
                                ><i class="fa fa-eye"></i>
                                </button>
                                <%--                    xóa sửa--%>
                                <a class="btn btn-primary btn-sm warning" type="button" title="Danh sách"
                                   href="manage-order?type=list&id-booking=<%=booking.getId()%>"><i
                                        class="fas fa-folder"></i></a>
                                <%-- Xóa đơn hàng  --%>
                                <%if (isGrantDel == true) {%>
                                <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                   href="manage-order?type=delete&id-booking=<%=booking.getId()%>"><i
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
                                <%--  Sửa đơn hàng  --%>
                                <%if (isGrantEdit == true) {%>
                                <a class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                   href="manage-order?type=edit&id-booking=<%=booking.getId()%>"><i
                                        class="fas fa-edit"></i>
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
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- MODAL EDIT BASIC -->
<div class="modal fade" id="ModalViewTransport" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form method="POST">
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
                          <span class="thong-tin-thanh-toan">
                            <h5>Thông tin vận chuyển đơn hàng</h5>
                          </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="control-label" for="idModal">Mã vận chuyển </label>
                            <input class="form-control" type="text" value="" id="idModal" name="idModal" disabled>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label" for="fromAddress">Địa chỉ từ</label>
                            <input class="form-control" type="text" required
                                   value="" id="fromAddress" name="fromAddress" disabled>
                        </div>
                        <div class="form-group  col-md-6">
                            <label class="control-label" for="toAddress">Địa chỉ đến</label>
                            <input class="form-control" type="text" required
                                   value="" id="toAddress" name="toAddress" disabled>
                        </div>
                        <div class="form-group col-md-6 ">
                            <label for="statusModal" class="control-label" for="statusModal">Tình trạng đơn hàng</label>
                            <select class="form-control" id="statusModal" name="statusModal">
                                    <%for (CategoryModel statusBook : listTypeStatusBook) {%>
                                    <option value="<%=statusBook.getId()%>" >
                                        <%=statusBook.getName()%>
                                    </option>
                                    <%}%>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label" for="feeModal">Chi phí vận chuyển</label>
                            <input class="form-control" type="text" id="feeModal" name="feeModal" value="" disabled>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="leadTimeModal" class="control-label">Thời gian dự kiến đến</label>
                            <input class="form-control" type="text" id="leadTimeModal" name="leadTimeModal" value="" disabled>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="createAtModal" class="control-label">Ngày tạo</label>
                            <input class="form-control" type="text" id="createAtModal" name="createAtModal" value="" disabled>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="updateAtModal" class="control-label">Ngày cập nhật</label>
                            <input class="form-control" type="text" id="updateAtModal" name="updateAtModal" value="" disabled>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="modal-footer">
                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Đóng</a>
                </div>
            </form>
        </div>
    </div>
</div>


<%@include file="../../common/admin/script.jsp" %>
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
    let logisticIDToken = null;
    async function autoLoginLogisticAPI() {
        await fetch(`<%=request.getContextPath()%>/api/logistic?action=login`, {
            method: 'POST'
        })
            .then(response => response.json())
            .then(data => {
                logisticIDToken = data
            })
            .catch(error => {
                console.log(error)
            });
    }
    async function handleClickViewTransport(idTransport){
        await autoLoginLogisticAPI()
        await $.ajax({
            type: 'POST',
            data: {
                'logisticIDToken': logisticIDToken,
                'id': idTransport,
            },
            url: `<%=request.getContextPath()%>/api/logistic?action=getInfoTransport`,
            success: function (response) {
                if (response.message === 'Success') {
                    let convertLeadTime = new Date(response.data[0].leadTime);
                    convertLeadTime = convertLeadTime.toLocaleDateString('vi-VN');
                    $('#ModalViewTransport #idModal').val(response.data[0].id);
                    $('#ModalViewTransport #feeModal').val(response.data[0].fee);
                    $('#ModalViewTransport #leadTimeModal').val(convertLeadTime);
                    $('#ModalViewTransport #statusModal').val(response.data[0].active);
                    $('#ModalViewTransport #createAtModal').val(response.data[0].created_at);
                    $('#ModalViewTransport #updateAtModal').val(response.data[0].updated_at);


                    fetch(`<%=APIConstants.LOGISTIC_HOST_API%>/ward?districtID=${response.data[0].fromDistrictId}`, {
                        method: 'GET',
                        headers: {
                            'Authorization': 'Bearer ' + logisticIDToken
                        }
                    })
                        .then(response => response.json())
                        .then(data => {
                            $('#ModalViewTransport #fromAddress').val(data.original.data[0].WardName)
                        })
                        .catch(error => {
                            console.log(error)
                        });

                    fetch(`<%=APIConstants.LOGISTIC_HOST_API%>/ward?districtID=${response.data[0].toDistrictId}`, {
                        method: 'GET',
                        headers: {
                            'Authorization': 'Bearer ' + logisticIDToken
                        }
                    })
                        .then(response => response.json())
                        .then(data => {
                            $('#ModalViewTransport #toAddress').val(data.original.data[0].WardName)
                        })
                        .catch(error => {
                            console.log(error)
                        });
                }
            }
        });
    }
</script>

</body>

</html>