<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.CategoryModel" %>
<%@ page import="vn.edu.hcmuaf.fit.model.ProductModel" %>
<%@ page import="vn.edu.hcmuaf.fit.model.BookingModel" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CustomerDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.model.CustomerModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Chỉnh sửa lịch đặt | ADMIN</title>
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <!-- or -->
    <%@include file="../../common/admin/head.jsp" %>

    <link rel="stylesheet" href="css/manage-product.css">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
    <script>

        function readURL(input, thumbimage) {
            if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#thumbimage").attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            } else { // Sử dụng cho IE
                $("#thumbimage").attr('src', input.value);

            }
            $("#thumbimage").show();
            $('.filename').text($("#uploadfile").val());
            $('.Choicefile').css('background', '#14142B');
            $('.Choicefile').css('cursor', 'default');
            $(".removeimg").show();
            $(".Choicefile").unbind('click');

        }

        $(document).ready(function () {
            $(".Choicefile").bind('click', function () {
                $("#uploadfile").click();

            });
            $(".removeimg").click(function () {
                $("#thumbimage").attr('src', '').hide();
                $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                $(".removeimg").hide();
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();
                });
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'pointer');
                $(".filename").text("");
            });
        })
    </script>
</head>

<body class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<%
    BookingModel booking = (BookingModel) request.getAttribute("bookingCurrent");
    String pageContextPath = (String) request.getContextPath();
%>

<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="manage-product">Quản lý lịch đặt</a></li>
            <li class="breadcrumb-item">Chỉnh sửa lịch đặt</li>
        </ul>
    </div>
    <div class="row" id="change_product">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Chỉnh sửa lịch đặt</h3>
                <div class="tile-body">
                    <form action="<%=pageContextPath%>/admin/manage-order?type=edit&id-booking=<%=booking==null?"":booking.getId()%>"
                          method="post">
                        <%--            <div class="row element-button">--%>
                        <%--              <div class="col-sm-2">--%>
                        <%--                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#exampleModalCenter"><i--%>
                        <%--                        class="fas fa-folder-plus"></i> Thêm thương hiệu</a>--%>
                        <%--              </div>--%>
                        <%--              <div class="col-sm-2">--%>
                        <%--                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#adddanhmuc"><i--%>
                        <%--                        class="fas fa-folder-plus"></i> Thêm danh mục</a>--%>
                        <%--              </div>--%>
                        <%--              <div class="col-sm-2">--%>
                        <%--                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#addtinhtrang"><i--%>
                        <%--                        class="fas fa-folder-plus"></i> Thêm tình trạng</a>--%>
                        <%--              </div>--%>
                        <%--            </div>--%>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label">Mã đơn hàng </label>
                                <input class="form-control" type="number" placeholder="" name="id-booking"
                                       value="<%=booking==null?"":booking.getId()%>" disabled>
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Ngày đặt</label>
                                <input class="form-control" type="datetime-local" name="date"
                                       value="<%=booking==null?"":booking.getDate_booking()%>">
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Tình trạng</label>
                                <select class="form-control" name="status">
                                    <option value="1" <%=booking.getStatus_booking() == 1 ? "selected" : ""%>>
                                        Đã xác nhận
                                    </option>
                                    <option value="0" <%=booking.getStatus_booking() == 0 ? "selected" : ""%>>
                                        Chờ xác nhận
                                    </option>
                                    <option value="-1" <%=booking.getStatus_booking() == -1 ? "selected" : ""%>>
                                        Đã hủy
                                    </option>
                                </select>
                            </div>

                            <div class="form-group  col-md-3">
                                <label class="control-label">Tên người đặt</label>
                                <input class="form-control" type="text" name="username"
                                       value="<%=booking==null?"":booking.getUsername()%>">
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Email</label>
                                <input class="form-control" type="email" name="email"
                                       value="<%=booking.getEmail()%>">
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Tel</label>
                                <input class="form-control" type="tel" name="tel"
                                       value="<%=booking==null?"":booking.getTel()%>">
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Address</label>
                                <textarea class="form-control"
                                          name="address"><%=booking == null ? "" : booking.getAddress()%></textarea>
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Mô tả sản phẩm</label>

                            <textarea class="form-control" name="description"
                                      id="description"><%=booking
                                    ==
                                    null
                                    ?
                                    ""
                                    :
                                    booking.getDescription()%></textarea>

                            <script>CKEDITOR.replace('description');</script>
                        </div>
                        <input class="btn btn-save" type="submit" value="Lưu lại" onclick="save()"></input>
                        <button class="btn btn-cancel" data-dismiss="modal" type="reset">Hủy bỏ</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
</main>

<%@include file="../../common/admin/script.jsp" %>

<script>
    const inpFile = document.getElementById("inpFile");
    const loadFile = document.getElementById("loadFile");
    const previewContainer = document.getElementById("imagePreview");
    const previewImage = previewContainer.querySelector(".image-preview__image");
    const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
    inpFile.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            previewDefaultText.style.display = "none";
            previewImage.style.display = "block";
            reader.addEventListener("load", function () {
                previewImage.setAttribute("src", this.result);
            });
            reader.readAsDataURL(file);
        }
    });

    function save() {

        swal("Đã lưu thành công.!", {});

    }

</script>
</body>

</html>