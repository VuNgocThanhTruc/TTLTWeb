<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <%@include file="../../common/web/head.jsp" %>
    <link rel="stylesheet" href="././css/sign.css">
    <title>Đăng nhập | Phone Care</title>
    <meta name="google-signin-scope" content="profile email">

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
                        <a href="https://www.facebook.com/v16.0/dialog/oauth?scope=email&client_id=5842543845823968&redirect_uri=http://localhost:8080/TTLTWeb_war/login-facebook">
                            <button type="button" class="btn btn-sm btn-outline-primary">Đăng nhập với Facebook <i
                                    class="fa fa-facebook-square"></i></button>
                        </a>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&&redirect_uri=http://localhost:8080/TTLTWeb_war/login-google&response_type=code
		&client_id=429868613240-b7ij0n2762it03pj9r5623l0a3qjlmnp.apps.googleusercontent.com&approval_prompt=force">
                            <button type="button" class="btn btn-sm btn-outline-danger">Đăng nhập với Google <i
                                    class="fa fa-google-plus-square"></i>
                            </button>
                        </a>

                    </div>

                </form>
            </div>


        </div>
    </section>


</div>

<script>

</script>

<%@include file="../../common/web/footer.jsp" %>

</body>

</html>