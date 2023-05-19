<%@ page import="vn.edu.hcmuaf.fit.model.CustomerModel" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.BookingModel" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.APIConstants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Chờ xác nhận| ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>

</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
    List<BookingModel> listBooking = (List<BookingModel>) request.getAttribute("listBooking");
//    String checkMess = request.getAttribute("message") != null ? (String) request.getAttribute("message") : "";
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
            <li class="breadcrumb-item">Chờ xác nhận đơn hàng</li>
            <li class="breadcrumb-item"><a href="#">Danh sách chờ xác nhận</a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <%--                        <div class="col-sm-2">--%>

                        <%--                            <a class="btn btn-add btn-sm" href="admin/manage-booking" title="Thêm"><i--%>
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
                                <span class="badge bg-info">Chờ xác nhận</span>
                            </td>
                            <td name="description"><%=booking.getDescription()%>
                            </td>
                            <td>
                                <button class="btn btn-success btn-sm edit" type="button" title="Xác nhận"
                                        id="accept-booking" data-toggle="modal" data-target=""
                                        href="manage-booking?status=wait-accept&type-status=1&id-booking=<%=booking.getId()%>"
                                        onclick="handleClickRegisterTransport(<%=booking.getId()%>,<%=booking.getToDistrictId()%>,<%=booking.getToWardId()%>,<%=booking.getHeight()%>,<%=booking.getLength()%>,<%=booking.getWidth()%>,<%=booking.getWeight()%>)"
                                ><i
                                        class="fas fa-check-square"></i></button>
                                <%-- sua don hang--%>
                                <%if (isGrantEdit == true) {%>
                                <a href="manage-confirm?type=edit-confirm&id-confirm=<%=booking.getId()%>">
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                            id="show-confirm"
                                            data-toggle="modal" data-target="#ModalConfirm">
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
                                <%--                                xóa đơn hàng--%>
                                <%if (isGrantDel == true) {%>
                                <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                   href="manage-booking?status=wait-accept&action=delete&id=<%=booking.getId()%>"
                                >
                                    <i class="fas fa-trash-alt"></i>
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

<!--
MODAL
-->
<div class="modal fade" id="ModalConfirm" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Chỉnh sửa thông tin cơ bản</h5>
              </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">ID </label>
                        <input class="form-control" type="number" value="71309005">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên khách hàng</label>
                        <input class="form-control" type="text" required
                               value="Thay dây nút nguồn Xiaomi Redmi Note 11 Pro	">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleSelect1" class="control-label">Trình trạng</label>
                        <select class="form-control" id="exampleSelect1">
                            <option>Chờ xác nhận</option>
                            <option>Đã xác nhận</option>
                            <option>Đã hủy</option>
                        </select>
                    </div>
                </div>
                <BR>
                <a href="edit-booked.jsp" style="float: right;font-weight: 600;color: #ea0000;">Chỉnh sửa sản phẩm nâng
                    cao</a>
                <BR>
                <BR>
                <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>


<!--
MODAL
-->
<div class="modal fade" id="ModalConfirm" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Chỉnh sửa thông tin khách hàng cơ bản</h5>
              </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">ID khách hàng</label>
                        <input class="form-control" type="text" required value="#CD2187" disabled>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Họ và tên</label>
                        <input class="form-control" type="text" required value="Hồ Thị Thanh Ngân">
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Số điện thoại</label>
                        <input class="form-control" type="number" required value="09267312388">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Địa chỉ email</label>
                        <input class="form-control" type="text" required value="thanhngan@gmail.com">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Ngày sinh</label>
                        <input class="form-control" type="date" value="1999-02-12">
                    </div>

                </div>
                <BR>
                <a href="edit-customer.jsp" style="    float: right;
        font-weight: 600;
        color: #ea0000;">Chỉnh sửa nâng cao</a>
                <BR>
                <BR>
                <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--
MODAL
-->


<!--
<%@include file="../../common/admin/script.jsp" %>
-->
<script>
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
    async function handleClickRegisterTransport(idBooking, toDistrictID, toWardID, height, length, width, weight) {
        await autoLoginLogisticAPI()
        $.ajax({
            type: 'GET',
            url: `<%=request.getContextPath()%>/admin/manage-booking?status=wait-accept&type-status=1&id-booking=${idBooking}`
        });

        await $.ajax({
            type: 'POST',
            data: {
                'idBooking': idBooking,
                'logisticIDToken': logisticIDToken,
                'from_district_id': <%=APIConstants.ID_DISTRICT_STORE%>,
                'from_ward_id': <%=APIConstants.ID_WARD_STORE%>,
                'to_district_id': toDistrictID,
                'to_ward_id': toWardID,
                'height': height,
                'length': length,
                'width': width,
                'weight': weight,
            },
            url: `<%=request.getContextPath()%>/api/logistic?action=registerTransport`,
            success: function (data) {
                console.log(data)
            }
        });
    }

</script>
</body>
