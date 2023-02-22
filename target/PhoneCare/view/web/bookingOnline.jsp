<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/13/2022
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
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
<% String mess = (String) session.getAttribute("mess"); %>
<!-- content -->
<main id="booking" class="my-5">
    <div class="container">
        <h2 class="title my-3">
            ĐẶT LỊCH SỬA CHỮA
        </h2>
        <div class="col-md-7 col-lg-7 info-booking">
            <div class="info-user">

                <form action="bookingOnline?action=booking" method="post">
                    <h3>Thông tin khách hàng</h3>
                    <%if (mess == "success") { %>
                    <div class="alert alert-success">
                        Bạn đã <strong>đặt lịch thành công </strong>
                    </div>
                    <%}%>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="username">Họ và Tên</label>
                                <input type="text" value="<% if(user!=null) {out.print(user.getName());}%>"
                                       placeholder="<% if(user==null) {out.print("Nhập họ và tên");}%>"
                                       class="form-control"
                                       name="username" id="username" required>
                            </div>
                            <div class="col-md-6">
                                <label for="tel">Số điện thoại</label>
                                <input type="tel" value="<% if(user!=null) {out.print(user.getTel());}%>"
                                       placeholder="<% if(user==null) {out.print("Nhập số điện thoại");}%>"
                                       class="form-control"
                                       name="tel" id="tel" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control"
                               value="<% if(user!=null) {out.print(user.getEmail());}%>"
                               placeholder="<% if(user==null) {out.print("Nhập email");}%>" name="email" id="email">
                    </div>
                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input type="text" class="form-control"
                               value="<% if(user!=null) {out.print(user.getAddress());}%>"
                               placeholder="<% if(user==null) {out.print("Nhập địa chỉ");}%>" name="address"
                               id="address">
                    </div>

                    <div class="form-group">
                        <label for="time">Thời gian</label>
                        <div class="row">
                            <div class="col-md-6">
                                <input type="time" class="form-control" name="time" id="time">
                            </div>
                            <div class="col-md-6">
                                <input type="date" class="form-control" name="date" id="date">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Ghi chú</label>
                        <textarea name="description" class="form-control" rows="5"
                                  placeholder="Ghi chú thêm thông tin như mô tả về điện thoại (màu sắc, các lỗi hiện có)..."></textarea>
                    </div>
                    <div class="form-group">
                        <label>Phương thức thanh toán</label>

                        <div class="female">
                            <input type="radio" id="cod" checked name="payment" value="1">
                            <label for="cod">Thanh toán khi nhận hàng (COD)</label>
                        </div>
                        <%--                        <div class="male">--%>
                        <%--                            <input type="radio" id="male" name="sex" value="1">--%>
                        <%--                            <label for="male">Nam</label>--%>
                        <%--                        </div>--%>
                    </div>

                    <div class="text-center">
                        <%--                            <button type="submit" class="btn btn-primary btn-booking">Đặt hẹn</button>--%>
                        <%--                            </button>--%>
                        <input class="btn btn-primary btn-booking" type="submit" value="Đặt hẹn" id="btnSave"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    </div>
</main>

<%@include file="../../common/web/footer.jsp" %>

<script>
    // function redirectPage(e) {
    //     e.preventDefault();
    //     location.replace('checkout.html')
    // }
    //
    //
    // $('.btn-booking').click(function () {
    //     swal({
    //         title: "",
    //         text: "Đặt lịch thành công",
    //         icon: "success",
    //         close: true,
    //         button: false,
    //     });
    // });

</script>
</body>

</html>
