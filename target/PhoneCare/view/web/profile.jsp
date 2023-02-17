<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../common/web/head.jsp" %>
    <link rel="stylesheet" href="././css/profile.css">
    <title>Thông tin cá nhân | Phone Care</title>

</head>

<body>
<%--<% User user = (User) session.getAttribute("userlogin"); %>--%>
<%@include file="../../common/web/header.jsp" %>

<!--Content-->
<!-- profile -->
<main id="profile">
    <div class="breadcrumbs">
        <div class="container">
            <ul class="animated wow slideInLeft" data-wow-delay=".5s">
                <li>
                    <a href="/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Trang chủ /
                    </a>
                </li>
                <li class="active"><span class="breadcrumb-item active">Thông tin cá nhân</span></li>
            </ul>
        </div>
    </div>
    <div class="container px-4 mt-4">
        <nav class="nav nav-borders">
            <a class="nav-link active ms-0" href="profile" target="__blank">Thông tin cá nhân</a>
            <a class="nav-link" href="booked">Lịch sử hẹn</a>
        </nav>
        <hr class="mt-0 mb-4"/>
        <div class="row">
            <div class="col-xl-3 left">
                <div class="card mb-4 mb-xl-0">
                    <h3 class="card-header text-white">Thông tin cá nhân</h3>
                    <div class="card-body">

                        <div class="avatar text-center">
                            <img class="img-account-profile rounded-circle mb-2"
                                 src="images/user/<% out.print( user.getAvatar());%>"
                                 alt=""/>
                        </div>

                        <div class="username  text-center"><% out.print(user.getName());%></div>
                        <div class="email"><i class="fas fa-envelope"></i><% out.print(user.getEmail());%></div>
                        <div class="phone"><i class="fas fa-phone-square-alt"></i><% if (user.getTel() != null) {
                            out.print(user.getTel());
                        } else {
                            out.print("Bạn chưa nhập");
                        }%></div>
                        <div class="dob"><i class="fas fa-birthday-cake"></i><% if (user.getDob() != null) {
                            out.print(user.getDob());
                        } else {
                            out.print("Bạn chưa nhập");
                        }%></div>
                        <div class="sex"><i class="fas fa-venus-mars"></i><% if (user.getSex() == 1) {
                            out.print("Nam");
                        } else {
                            out.print("Nữ");
                        }%></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 right">
                <div class="card mb-4">
                    <h3 class="card-header">Thay đổi thông tin</h3>
                    <div class="card-body p-5">
                        <div class="mb-3 avatar">
                            <div class="row">
                                <div class="col-md-4 left">
                                    <img class="img-account-profile mb-2"
                                         src="images/user/<% out.print( user.getAvatar());%>"
                                         alt=""/>

                                </div>
                                <div class="col-md-8 right">
                                    <form action="AddImage" method="post" enctype="multipart/form-data">
                                        <input type="file" name="image" accept="image/png, image/jpeg">
                                        <input type="submit" value="Add Image">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <form action="profile?action=update" method="post">
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6 ">
                                    <label class="mb-1">Họ tên</label>
                                    <input class="form-control" name="name" type="text"
                                           value="<% out.print(user.getName());%>"/>

                                </div>
                                <div class="col-md-6">
                                    <label class="mb-1" for="sex">Giới tính</label>

                                    <select id="sex" name="sex" class="form-control">
                                        <option value="<%out.print(user.getSex());%>" name="sex"
                                                selected><% if (user.getSex() == 1) {
                                            out.print("Nam");
                                        } else if (user.getSex() == 0) {
                                            out.print("Nữ");
                                        } else {
                                            out.print("Chưa chọn");
                                        }%></option>
                                        <option value="<% if(user.getSex()==1) {out.print("0");}else{out.print("1");}%>"
                                                name="sex"><% if (user.getSex() == 1) {
                                            out.print("Nữ");
                                        } else {
                                            out.print("Nam");
                                        }%></option>

                                    </select>

                                </div>


                            </div>
                            <div class="mb-3">
                                <label class="mb-1">Email</label>
                                <input class="form-control" name="email" type="email"
                                       value="<% out.print(user.getEmail() );%>"/>
                            </div>
                            <div class="mb-3 d-none">
                                <label class="mb-1 ">ID</label>
                                <input class="form-control" name="id" type="text"
                                       value="<% out.print(user.getId());%>"/>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label class="mb-1">Số điện thoại</label>
                                    <input class="form-control" name="tel" type="tel"
                                           value="<% if(user.getTel()!=null) {out.print(user.getTel());}%>"
                                           placeholder="<% if(user.getTel()==null||user.getTel()=="") {out.print("Nhập số điện thoại");}%>"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="mb-1" for="age">Ngày sinh</label>
                                    <input class="form-control" id="age" type="date" name="dob"
                                           value="<% out.print(user.getDob());%>"/>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="mb-1">Địa chỉ</label>
                                <input class="form-control" name="address" type="text"
                                       value="<% if(user.getAddress()!=null) {out.print(user.getAddress());}%>"
                                       placeholder="<% if(user.getAddress()==null||user.getAddress()=="") {out.print("số nhà, đường, phường/xã, huyện/tp, tỉnh ");}%>"/>
                            </div>
                            <div>
                                <input class="btn  save_change" type="submit" value="Lưu thay đổi" id="btnSave"/>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="../../common/web/footer.jsp" %>
<script>
    function redirectPage(e) {
        e.preventDefault();
        location.replace('checkout.html')
    }

    $('#btnSave').click(function () {
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