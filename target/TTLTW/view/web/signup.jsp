<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="../../common/web/head.jsp" %>
    <link rel="stylesheet" href="././css/sign.css">

    <title>Đăng ký | Phone Care</title>
    <link href="../../images/logo/logo_PhoneCare.png" rel="shortcut icon" type="image/x-icon">

</head>

<body>
<% String mess = (String) session.getAttribute("mess"); %>
<%@include file="../../common/web/header.jsp" %>


<!--Content-->
<div class="content">
    <section class="signup">
        <div class="container">
            <div class="signin-left">
                <div class="sign-title">
                    <h1>Tạo tài khoản</h1>
                </div>
            </div>
            <div class="signin-right ">
                <form action="login?action=logout" method="post">
                    <div class="firstname form-control1 ">
                        <%if (mess =="errorsignup") { %>
                        <div class="alert alert-danger">
                            <strong>Tài khoản hoặc email</strong> đã tồn tại. Vui lòng nhập  <strong>tài khoản hoặc email</strong> khác
                        </div>
                        <%}%>
                        <%if (mess =="errornull") { %>
                        <div class="alert alert-danger">
                            Vui lòng<strong> nhập đầy đủ</strong>.
                        </div>
                        <%}%>
                        <input type="text" id="firstname" name="hovaten" placeholder="Họ và Tên" required>
                    </div>

                    <div class="sex form-control1">
                        <div class="female">
                            <input type="radio" id="female" checked name="sex" value="0">
                            <label for="female">Nữ</label>
                        </div>
                        <div class="male">
                            <input type="radio" id="male" name="sex" value="1">
                            <label for="male">Nam</label>
                        </div>
                    </div>
                    <div class="birthday form-control1">
                        <input type="date" id="birthday" name="dob" placeholder="mm/dd/yyyy" required>
                    </div>
                    <div class="username form-control1">
                        <input type="email" id="email" name="email" placeholder="Email" >
                    </div>

                    <div class="username form-control1">
                        <input type="text" id="username" name="username" placeholder="Tài khoản" required>
                    </div>
                    <div class="password form-control1">
                        <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
                    </div>
                    <div >
                        <input class="submit" type="submit" value="Đăng ký" id="submit" style="color: whitesmoke"/>
                    </div>
                    <div class="backto">
                        <a href="signin"><i class="fa fa-long-arrow-alt-left"></i> Quay lại đăng nhập</a>
                    </div>
                </form>
            </div>
        </div>
    </section>

</div>


<%@include file="../../common/web/footer.jsp" %>

</body>

</html>