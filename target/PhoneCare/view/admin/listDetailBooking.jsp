<%@ page import="vn.edu.hcmuaf.fit.model.DetailBookingModal" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách sản phẩm đặt lịch | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>

</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<%
    List<DetailBookingModal> listDetailBooking = (List<DetailBookingModal>) request.getAttribute("listDetailBooking");
%>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a href="manage-order">Quản lý lịch đặt</a></li>
            <li class="breadcrumb-item"><a href="#">Danh sách sản phẩm được đặt</a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="add-order.jsp" title="Thêm"><i class="fas fa-plus"></i>
                                Thêm mới </a>
                        </div>

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
                            <th>Đơn hàng</th>
                            <th>Tên sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng đặt</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (DetailBookingModal detail : listDetailBooking) {%>
                        <tr class="booking-<%=detail.getId()%>">
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td name="id" class="id"><%=detail.getId()%>
                            </td>
                            <td name="id_booking"><%=detail.getId_booking()%>
                            </td>
                            <td name="name" class="name"><%=detail.getName()%>
                            </td>
                            <td name="price" class="price"><%=detail.getPrice()%>
                            </td>
                            <td name="quantity" class="quantity"><%=detail.getQuantity()%>
                            </td>
                            <td>
                                <%--                    xóa sửa--%>
                                <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                   href="manage-order?type=list&action=delete&id=<%=detail.getId()%>"><i
                                        class="fas fa-trash-alt"></i></a>

                                <button class="btn btn-primary btn-sm trash" type="button" title="Sửa"
                                        data-toggle="modal" data-target="#ModalUP"><i
                                        class="fas fa-edit" onclick="editModal(<%=detail.getId()%>)">></i></button>

                                <a class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                   href="manage-order?type=list&action=edit&id=<%=detail.getId()%>"><i
                                        class="fas fa-edit"></i>
                                </a>
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
                <h5>Chỉnh sửa thông tin</h5>
              </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">ID lịch đặt</label>
                        <input class="form-control" type="text" required value="" class="id" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên sản phẩm</label>
                        <input class="form-control" type="text" required value="" class="name" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Đơn giá</label>
                        <input class="form-control" type="text" required value="" class="price" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Số lượng đặt</label>
                        <input class="form-control" type="number" required value="" class="quantity">
                    </div>
                </div>
                <BR>
                <a href="edit-order.jsp" style="    float: right;
        font-weight: 600;
        color: #ea0000;">Chỉnh sửa nâng cao</a>
                <BR>
                <BR>
                <a class="btn btn-save urlEditBasic" type="button" onclick="save()">Lưu lại</a>
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

    function editModal(idBooking) {

        let id = document.querySelector(`.booking-${idBooking} .id`).innerText
        let quantity = document.querySelector(`.booking-${idProduct} .quantity`).innerText
        <%--let status = document.querySelector(`.booking-${idProduct} .status`).innerText--%>
        let price = document.querySelector(`.booking-${idProduct} .price`).innerText
        let name = document.querySelector(`.booking-${idProduct} .name`).innerText

        $('#ModalUP .id').val(id);
        $('#ModalUP .name').val(name);
        $('#ModalUP .quantity').val(quantity);
        $('#ModalUP .price').val(price);
        $('#ModalUP .urlEditBasic').attr('href', `manage-order?type=edit&id-booking=${idProduct}`);

        let listCategory = document.querySelectorAll('#ModalEditProduct #categoryModal option')
        for (let i = 0; i < listCategory.length; i++) {
            listCategory[i].value == category ? listCategory[i].selected = true : listCategory[i].selected = false
        }
        <%--$.ajax({--%>
        <%--    type: 'GET',--%>
        <%--    url: '<%=pageContextPath%>/admin/manage-product',--%>
        <%--    data: {action: 'find', id: idProduct},--%>
        <%--    success: (result) => {--%>
        <%--        $('#ModalEditProduct #idModal').val(result.id);--%>
        <%--        $('#ModalEditProduct #nameModal').val(result.name);--%>
        <%--        $('#ModalEditProduct #quantityModal').val(result.quantity);--%>
        <%--        $('#ModalEditProduct #statusModal').val(result.status);--%>
        <%--        $('#ModalEditProduct #priceModal').val(result.price);--%>
        <%--        $('#ModalEditProduct #categoryModal').val(result.category);--%>
        <%--    }--%>
        <%--})--%>
    }
</script>
</body>

</html>
