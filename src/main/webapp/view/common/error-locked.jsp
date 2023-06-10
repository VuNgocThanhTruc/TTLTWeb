<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 06/06/2023
  Time: 1:59 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Phone Care</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" href="../../plugins/bootstrap/bootstrap.min.css">
    <style>
        .btn-error{
            border: 4px solid #00a929;
            border-radius: 30px;
            padding: 5px 40px;
            margin-left: 13px;
        }
        .text-feedback{
            background-color: transparent;
            border-radius: 10px;
            display: block;
            font-size: 16px;
            outline: none;
            padding: 6px 20px;
            width: 70%;
            margin: 20px 0px;
            height: 100px;
        }

    </style>
</head>
<body>
<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">

    <div class="container" style="justify-content: flex-start">
        <a>
            <img src="../../images/logo/logo_PhoneCare.png" class="logo-top" alt="">
        </a>
        <a class="navbar-brand" href="home">

            <img src="../../images/logo/phoneCare.png" class="logoWord-top" alt="">
        </a>
    </div>
    </div>

</nav>

<main>
    <div class="container" style="display: flex; justify-content: flex-end; align-items: center; margin-top: 100px;">
        <div class="row">
            <div>
                <img src="../../images/logo/phonecare2.png" alt="phonecare">
            </div>
            <div style="min-height: 500px" class="col-md-6 align-self-center">
                <button style="background: none; color: #808990; margin-bottom: 20px; border: none" onclick="goBack()"><i class="fas fa-angle-left"></i> Quay lại</button>
                <h2>Sorry! Tài khoản của bạn tạm thời bị khóa.</h2>
                <p>Để mở khóa tài khoản vui lòng gửi về phản hồi của bạn cho hệ thống. Vui lòng viết phản hồi của bạn dưới đây!</p>
                <form action="" method="POST">
                    <textarea class="text-feedback" type="text" name="feedback-lock" placeholder="Viết phản hồi của bạn tại đây"></textarea>
                    <div class="row">
                        <input class="btn-error" type="submit" value="Gửi phản hồi">
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>

<script>
    function goBack() {
        window.history.back();
    }

</script>
</body>
</html>
