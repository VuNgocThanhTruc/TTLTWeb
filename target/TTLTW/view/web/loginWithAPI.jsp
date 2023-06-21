<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <%@include file="../../common/web/head.jsp" %>
  <title>Đăng nhập | PhoneCare</title>
  <link
          href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
          rel='stylesheet'>
  <link
          href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
          rel='stylesheet'>
  <script type='text/javascript'
          src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
  <style>
    .placeicon {
      font-family: fontawesome
    }

    .custom-control-label::before {
      background-color: #dee2e6;
      border: #dee2e6
    }
  </style>
</head>
<%
    String login = request.getAttribute("login").toString();
%>
<body oncontextmenu='return false' class='snippet-body bg-info'>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
<div>
  <!-- Container containing all contents -->
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
        <!-- White Container -->
        <div class="container bg-white rounded mt-2 mb-2 px-0">
          <!-- Main Heading -->
          <div class="row justify-content-center align-items-center pt-3">
            <h1>
                <%if (login == "facebook") { %>
                <strong>Đăng nhập với Facebook</strong>
                <%} if(login =="google"){%>
                <strong>Đăng nhập với Google</strong>
                <%}%>

            </h1>
          </div>
          <div class="pt-3 pb-3">
              <%if (login == "facebook") { %>
              <% String idFB = request.getAttribute("id-fb").toString();
              String nameFB = request.getAttribute("name-fb").toString();%>
            <form class="form-horizontal" action="login-facebook?action=signupFB" method="POST">

                <div class="form-group row justify-content-center px-3 d-none">
                    <div class="col-9 px-0">
                        <input type="text" name="id" value="<% out.print(idFB);%>"
                               class="form-control border-info placeicon">
                    </div>
                </div>

              <div class="form-group row justify-content-center px-3">
                <div class="col-9 px-0">
                  <input type="text" name="name" value="<% out.print(nameFB);%>"
                         class="form-control border-info placeicon" required>
                </div>
              </div>

              <div class="form-group row justify-content-center px-3">
                <div class="col-9 px-0">
                  <input type="email" name="email"
                         placeholder="Nhập email"
                         class="form-control border-info placeicon" required>
                </div>
              </div>
              <div class="form-group row justify-content-center px-3">
                <div class="col-9 px-0">
                  <input type="tel" name="tel"
                         placeholder="Nhập số điện thoại"
                         class="form-control border-info placeicon" required>
                </div>
              </div>
                <div class="form-group row justify-content-center px-3">
                    <div class="col-9 px-0" style="display: flex"  >
                            <div class="female" style="margin-right: 30px">
                                <input type="radio" id="female" checked name="sex" value="1">
                                <label for="female">Nữ</label>
                            </div>
                            <div class="male">
                                <input type="radio" id="male" name="sex" value="0">
                                <label for="male">Nam</label>
                            </div>
                    </div>
                </div>
                <div class="form-group row justify-content-center px-3">
                    <div class="col-9 px-0">
                        <input type="date" name="dob"
                               placeholder="mm/dd/yyyy"
                               class="form-control border-info placeicon" required>
                    </div>
                </div>
              <div class="form-group row justify-content-center">
                <div class="col-3 px-3 mt-3">
                  <input type="submit" value="Đăng ký"
                         class="btn btn-block btn-info">
                </div>
              </div>
            </form>
              <%} if(login =="google"){%>
              <%  String idGG = request.getAttribute("id-gg").toString();
                  String nameGG = request.getAttribute("name-gg").toString();
                  String emailGG = request.getAttribute("email-gg").toString();
                  String avatarGG = request.getAttribute("avatar-gg").toString();%>
              <form class="form-horizontal" action="login-google?action=signupGG" method="POST">
                  <div class="form-group row justify-content-center px-3 d-none">
                      <div class="col-9 px-0">
                          <input type="text" name="id"
                                 value="<% out.print(idGG);%>"
                                 class="form-control border-info placeicon" required>
                      </div>
                  </div>

                  <div class="form-group row justify-content-center px-3">
                      <div class="col-9 px-0">
                          <input type="text" name="name" value="<% out.print(nameGG);%>"
                                 class="form-control border-info placeicon" required>
                      </div>
                  </div>

                  <div class="form-group row justify-content-center px-3">
                      <div class="col-9 px-0">
                          <input type="email" name="email"
                                 value="<% out.print(emailGG);%>"
                                 class="form-control border-info placeicon" required>
                      </div>
                  </div>
                  <div class="form-group row justify-content-center px-3">
                      <div class="col-9 px-0">
                          <input type="tel" name="tel"
                                 placeholder="Nhập số điện thoại"
                                 class="form-control border-info placeicon" required>
                      </div>
                  </div>
                  <div class="form-group row justify-content-center px-3">
                      <div class="col-9 px-0" style="display: flex"  >
                          <div class="female" style="margin-right: 30px">
                              <input type="radio"  checked name="sex" value="1">
                              <label for="female">Nữ</label>
                          </div>
                          <div class="male">
                              <input type="radio"  name="sex" value="0">
                              <label for="male">Nam</label>
                          </div>
                      </div>
                  </div>
                  <div class="form-group row justify-content-center px-3">
                      <div class="col-9 px-0">
                          <input type="date" name="dob"
                                 placeholder="mm/dd/yyyy"
                                 class="form-control border-info placeicon" required>
                      </div>
                  </div>


                  <div class="form-group row justify-content-center">
                      <div class="col-3 px-3 mt-3">
                          <input type="submit" value="Đăng ký"
                                 class="btn btn-block btn-info">
                      </div>
                  </div>
              </form>
              <%}%>
          </div>
                              <!-- Alternative Login -->
                              <div class="mx-0 px-0 bg-light">

                                  <!-- Horizontal Line -->
                                  <div class="px-4 pt-5">
                                      <hr>
                                  </div>
                                  <!-- Register Now -->
                                  <div class="pt-2">
                                      <div class="row justify-content-center">
                                          <h5>
                                              <span><a href="signin"class="text-danger"> Quay lại đăng nhập</a></span>
                                          </h5>
                                      </div>
                                      <div
                                              class="row justify-content-center align-items-center pt-4 pb-5">
                                          <div class="col-4">

                                          </div>
                                      </div>
                                  </div>
                              </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

</body>
</html>
