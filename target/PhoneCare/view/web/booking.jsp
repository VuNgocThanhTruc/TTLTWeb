<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <%@include file="../../common/web/head.jsp" %>

    <title>Booking | Phone Care</title>
    <link rel="stylesheet" href="../../css/booking.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</head>

<body>
<%@include file="../../common/web/header.jsp" %>

<!-- content -->
<main id="booking" class="my-5">
    <div class="container">
        <h2 class="title my-3">
            ĐẶT LỊCH THAY MÀN HÌNH IPHONE X
        </h2>

        <div class="row">
            <div class="col-md-5 col-lg-5 order">
                <div class="image">
                    <img src="../../images/product/thay-man-hinh-iphone-x-fc.jpg" alt="" class="img-fluid w-100">
                </div>

                <table class="table table-hover info-product">
                    <thead>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Tạm tính</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            Thay màn hình iPhone X
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            2.250.000 ₫
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="2">Tổng</td>
                        <td class="text-danger">2.250.000 ₫</td>
                    </tr>
                    </tfoot>
                </table>

            </div>
            <div class="col-md-7 col-lg-7 info-booking">
                <div class="info-user">

                    <form method="POST" role="form" onsubmit="">
                        <h3>Thông tin khách hàng</h3>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="username">Họ và Tên *</label>
                                    <input type="text" placeholder="Nhập họ và tên..." class="form-control"
                                           name="username" id="username" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="phone">Số điện thoại *</label>
                                    <input type="tel" placeholder="Số điện thoại..." class="form-control"
                                           name="phone" id="phone" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" placeholder="Email..." name="email" id="email">
                        </div>


                        <h3>Thông tin lịch hẹn</h3>

                        <div class="form-group">
                            <label for="address_shop_1">Vui lòng chọn cửa hàng gần nhất</label>

                            <div class="radio">
                                <label>
                                    <input type="radio" name="address_shop" id="address_shop_1" value="1"
                                           checked="checked">
                                    <label for="address_shop_1">35 Trần Não, P. Bình An, Quận 2</label>
                                    <br>
                                    <input type="radio" name="address_shop" id="address_shop_2" value="2">
                                    <label for="address_shop_2"> 132 Nguyễn Thị Tú, P. Bình Hưng Hoà B, Quận Bình
                                        Tân
                                    </label>
                                    <br>
                                    <input type="radio" name="address_shop" id="address_shop_3" value="3">
                                    <label for="address_shop_3"> 34 Võ Văn Ngân, P. Trường Thọ, Quận Thủ Đức
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="color">Loại</label>

                            <select name="color" id="color" class="form-control" required="required">
                                <option value="Cũ">Cũ</option>
                                <option value="Mới">Mới</option>
                                <option value="Zin">Zin</option>

                            </select>
                        </div>

                        <div class="form-group">
                            <label for="time">Thời gian</label>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="time" class="form-control" name="time" id="time">
                                </div>
                                <div class="col-md-6">
                                    <input type="date" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="note">Ghi chú</label>
                            <textarea name="note" class="form-control" rows="5"
                                      placeholder="Ghi chú thêm thông tin như mô tả về điện thoại (màu sắc, các lỗi hiện có)..."></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-booking">Đặt hẹn</button>
                            <a href="checkout" type="button" class="btn btn-checkout"
                               style="display: block;">Thanh toán
<%--                            <button  type="submit" class="btn btn-checkout" onclick="redirectPage(event)">Thanh--%>
<%--                                toán--%>
<%--                            </button>--%>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</main>

<%@include file="../../common/web/footer.jsp"%>

<script>
    function redirectPage(e) {
        e.preventDefault();
        location.replace('checkout.html')
    }


    $('.btn-booking').click(function () {
        swal({
            title: "",
            text: "Đặt lịch thành công",
            icon: "success",
            close: true,
            button: false,
        });
    });

</script>
</body>

</html>