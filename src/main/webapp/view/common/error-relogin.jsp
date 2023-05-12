<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 10/05/2023
  Time: 8:40 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../../plugins/bootstrap/bootstrap.min.css">

    <link rel="stylesheet" href="../../plugins/animate/animate.min.css">

    <link rel="stylesheet" href="../../plugins/fontawesome/all.css">

    <link href="plugins/webfonts/font.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../css/owl.theme.default.min.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="plugins/uikit/uikit.min.css" />
    <title>Error | Phone Care</title>
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
            <div class="col-md-6 align-self-center">
                <h1 style="font-size: 150px; font-weight: bold; font-family: monospace;">401</h1>
                <h2>Sorry! Bạn cần đăng nhập lại.</h2>
                <p>Một yêu cầu đến từ máy chủ yêu cầu bạn cần đăng nhập lại. Vui lòng bấm vào nút bên dưới để đăng nhập.
                </p>
                <a href="<%=request.getContextPath()+"/signin"%>">
                    <button style="border: 4px solid #00a929;border-radius: 30px;padding: 5px 40px;">Đăng nhập</button>
                </a>
            </div>
        </div>
    </div>
</main>
</body>
</html>
