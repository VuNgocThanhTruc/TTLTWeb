<%@ page import="vn.edu.hcmuaf.fit.model.BookingModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý lịch đặt | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>

</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
    List<BookingModel> listBooking = (List<BookingModel>) request.getAttribute("listBooking1");
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
                            <%if(isGrantAdd == true) {%>
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
                            <a href="manage-order?type=delete-all" class="btn btn-delete btn-sm" type="button" title="Xóa"
                               onclick="myFunction(this)"><i
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
                                <select class="form-control" id="status" name="status">
                                    <option value="1" <%=listBooking == null ? "" : (booking.getStatus_booking() == 1 ? "selected" : "") %>>
                                        Đã xác nhận
                                    </option>
                                    <option value="0" <%=listBooking == null ? "" : (booking.getStatus_booking() == 0 ? "selected" : "") %>>
                                        Chờ xác nhận
                                    </option>
                                    <option value="-1" <%=listBooking == null ? "" : (booking.getStatus_booking() == -1 ? "selected" : "") %>>
                                        Đã hủy
                                    </option>
                                </select>
                            </td>
                            <td name="description"><%=booking.getDescription()%>
                            </td>
                            <td>
                                <%--                    xóa sửa--%>
                                <a class="btn btn-primary btn-sm warning" type="button" title="Danh sách"
                                   href="manage-order?type=list&id-booking=<%=booking.getId()%>"><i
                                        class="fas fa-folder"></i></a>
                                <%-- Xóa đơn hàng  --%>
                                <%if(isGrantDel == true) {%>
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
                                <%if(isGrantEdit == true) {%>
                                    <a class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                       href="manage-order?type=edit&id-booking=<%=booking.getId()%>"><i class="fas fa-edit"></i>
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
<!--
MODAL
-->
<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Chỉnh sửa thông tin đơn hàng cơ bản</h5>
              </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">ID đơn hàng</label>
                        <input class="form-control" type="text" required value="MD0837" disabled>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Khách hàng</label>
                        <input class="form-control" type="text" required value="Triệu Thanh Phú">
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Đơn hàng</label>
                        <input class="form-control" type="text" required value="Ép cổ cáp màn hình Samsung S8">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Số lượng</label>
                        <input class="form-control" type="number" required value="2">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Tổng tiền</label>
                        <input class="form-control" type="text" value="3.180.000 đ">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleSelect1" class="control-label">Tình trạng</label>
                        <select class="form-control" id="exampleSelect1">
                            <option>Đã xử lý</option>
                            <option>Đang chờ</option>
                            <option>Đã hủy</option>
                        </select>
                    </div>
                </div>
                <BR>
                <a href="edit-order" style="    float: right;
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
    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
    }

    jQuery(function () {
        jQuery(".trash").click(function () {
            swal({
                title: "Cảnh báo",

                text: "Bạn có chắc chắn là muốn xóa đơn hàng này?",
                buttons: ["Hủy bỏ", "Đồng ý"],
            })
                .then((willDelete) => {
                    if (willDelete) {
                        swal("Đã xóa thành công.!", {});
                    }
                });
        });
    });
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });

    //EXCEL
    // $(document).ready(function () {
    //   $('#').DataTable({

    //     dom: 'Bfrtip',
    //     "buttons": [
    //       'excel'
    //     ]
    //   });
    // });


    //Thời Gian
    function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
            '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    }

    //In dữ liệu
    var myApp = new function () {
        this.printTable = function () {
            var tab = document.getElementById('sampleTable');
            var win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }
    //     //Sao chép dữ liệu
    //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

    // copyTextareaBtn.addEventListener('click', function(event) {
    //   var copyTextarea = document.querySelector('.js-copytextarea');
    //   copyTextarea.focus();
    //   copyTextarea.select();

    //   try {
    //     var successful = document.execCommand('copy');
    //     var msg = successful ? 'successful' : 'unsuccessful';
    //     console.log('Copying text command was ' + msg);
    //   } catch (err) {
    //     console.log('Oops, unable to copy');
    //   }
    // });


    //Modal
    $("#show-emp").on("click", function () {
        $("#ModalUP").modal({backdrop: false, keyboard: false})
    });

    function save() {

        swal("Đã lưu thành công.!", {});

    }
</script>
</body>

</html>