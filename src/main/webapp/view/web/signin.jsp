
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <%@include file="../../common/web/head.jsp" %>
    <link rel="stylesheet" href="././css/sign.css">
    <title>Đăng nhập | Phone Care</title>

</head>

<body>
<%@include file="../../common/web/header.jsp" %>
<% String mess = (String) session.getAttribute("mess"); %>

<!--Content-->
<div class="content">
    <section class="signin ">
        <div class="container">
            <div class="signin-left">
                <div class="sign-title">
                    <h1>Đăng nhập</h1>
                </div>
            </div>
            <div class="signin-right " id="a-sign">
                <form action="login?action=login" method="post">
                    <%if (mess == "errorsignin") { %>
                    <div class="alert alert-danger">
                        <strong>Tài khoản hoặc Email</strong> hoặc <strong>mật khẩu </strong>không chính xác
                    </div>
                    <%}%>
                    <div class="username form-control1 ">
                        <input type="text" id="username" name="username" placeholder="Tài khoản hoặc Email">
                    </div>
                    <div class="password form-control1">
                        <input type="password" id="password" name="password" placeholder="Mật khẩu">
                        <!--                        <div class="error" style="position: absolute; bottom: 0;background: #fff; padding:10px; border:1px solid #ccc; color: red">Please fill out this field </div>-->
                    </div>
                    <div class="submit">
                        <input type="submit" value="Đăng nhập" id="submit"/>

                        <div class="forgetpassword">
                            <a href="getPassword">Quên mật khẩu?</a> hoặc <a href="signup">Đăng ký</a>
                        </div>
                    </div>
                    <br>
                    <div>
                        <button type="button" class="btn btn-sm btn-outline-primary">Login with Facebook <i class="fa fa-facebook-square"></i></button>
                        <button type="button" class="btn btn-sm btn-outline-danger">Login with với Google <i class="fa fa-google-plus-square"></i></button>
                    </div>
                </form>
            </div>


        </div>
    </section>


</div>

<%@include file="../../common/web/footer.jsp" %>

</body>

</html>