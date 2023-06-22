<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 25/05/2023
  Time: 10:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../css/style.css">
  <link rel="stylesheet" href="../plugins/bootstrap/bootstrap.min.css">
  <title>Error | Phone Care</title>
</head>
<body>
<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">

  <div class="container" style="justify-content: flex-start">
    <a>
      <img src="../images/logo/logo_PhoneCare.png" class="logo-top" alt="">
    </a>
    <a class="navbar-brand" href="home">

      <img src="../images/logo/phoneCare.png" class="logoWord-top" alt="">
    </a>
  </div>
  </div>

</nav>

<main>
  <div class="container" style="display: flex; justify-content: flex-end; align-items: center; margin-top: 100px;">
    <div style="flex-wrap: nowrap" class="row">
      <div>
        <img src="../images/logo/phonecare2.png" alt="phonecare">
      </div>
      <div class="col-md-6 align-self-center">
        <h1 style="font-size: 150px; font-weight: bold; font-family: monospace;">404</h1>
        <h2>Sorry! Not found.</h2>
        <p>Trang bạn yêu cầu không được tìm thấy! Vui lòng thử lại.
        </p>
          <button onclick="goBack()" style="border: 4px solid #00a929;border-radius: 30px;padding: 5px 40px;">Quay lại</button>
      </div>
    </div>
  </div>
</main>

<script src="../js/common.js">
</script>
</body>
</html>
