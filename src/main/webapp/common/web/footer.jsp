<%--
  Created by IntelliJ IDEA.
  User: vutru
  Date: 12/8/2022
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ImageDAO" %>
<html>
<head>

</head>

<body>
<% List<ImageModel> imageFooter = (List<ImageModel>) ImageDAO.loadImageFooter();%>
<!--gallery-->
<section class="section section-gallery">
    <div class="">
        <div class="hot_sp" style="padding-top: 70px;padding-bottom: 50px;">
            <h2 style="text-align:center;padding-top: 10px">
                <a style="font-size: 28px;color: black;text-decoration: none" href="">Khách hàng và Phone Care</a>
            </h2>
        </div>
        <div class="list-gallery clearfix">
            <ul class="shoes-gp">
                <%
                    for (ImageModel listImage : imageFooter) {
                %>
                <li>
                    <div class="gallery_item">
                        <img class="img-resize" src="images/footer/<% out.print(listImage.getPhoto());%>" alt="">
                    </div>
                </li>
                <% }%>
            </ul>
        </div>
    </div>
</section>
<footer class="main-footer">
    <div class="container">
        <div class="">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <div class="footer-col footer-block">
                        <h4 class="footer-title">
                            GIỚI THIỆU
                        </h4>
                        <div class="footer-content">
                            <p>Phone Care là cửa hàng sửa chữa và chăm sóc điện thoại, đây là trang web của Phone
                                Care giúp khách hàng đặt lịch sửa chữa điện thoại.</p>
                            <div class="logo-footer">
                                <img src="images/logo-bct.png" alt="Bộ Công Thương">
                            </div>
                            <div class="social-list">
                                <a href="https://www.facebook.com/phonecareweb" class="fab fa-facebook"></a>
                                <a href="https://www.facebook.com/phonecareweb" class="fab fa-google"></a>
                                <a href="https://www.facebook.com/phonecareweb" class="fab fa-twitter"></a>
                                <a href="https://www.facebook.com/phonecareweb" class="fab fa-youtube"></a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <div class="footer-col footer-link">
                        <h4 class="footer-title">
                            PHÁP LÝ &amp; CÂU HỎI
                        </h4>
                        <div class="footer-content toggle-footer">
                            <ul>
                                <li class="item">
                                    <a href="#" title="Tìm kiếm">Tìm kiếm</a>
                                </li>
                                <li class="item">
                                    <a href="introducel" title="Giới thiệu">Giới thiệu</a>
                                </li>
                                <li class="item">
                                    <a href="introducel" title="Chính sách đổi trả">Chính sách đổi trả</a>
                                </li>
                                <li class="item">
                                    <a href="introducel" title="Chính sách bảo mật">Chính sách bảo mật</a>
                                </li>
                                <li class="item">
                                    <a href="introducel" title="Điều khoản dịch vụ">Điều khoản dịch vụ</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <div class="footer-col footer-block">
                        <h4 class="footer-title">
                            Thông tin liên hệ
                        </h4>
                        <div class="footer-content toggle-footer">
                            <ul>
                                <li><span>Địa chỉ:</span> Linh Trung, Tp Thủ Đức, Tp Hồ Chí Minh, Việt Nam</li>
                                <li><span>Điện thoại:</span> 1800 2057 (Miễn phí)</li>
                                <li><span>Zalo:</span> 1800 2057</li>
                                <li><span>Mail:</span> phoneCare@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <div class="footer-col footer-block">
                        <h4 class="footer-title">
                            Bản quyền Phone Care thuộc
                        </h4>
                        <div class="footer-content">
                            <div id="fb-root1">
                                <div class="footer-static-content">
                                    <div class="fb-page" data-href="#" data-tabs="timeline" data-width=""
                                         data-height="215"
                                         data-small-header="false" data-adapt-container-width="true"
                                         data-hide-cover="false"
                                         data-show-facepile="true">
                                        <blockquote cite="#" class="fb-xfbml-parse-ignore"><a
                                                href="https://project-personal-mine.web.app/">Nguyễn Đăng
                                            Phước </a>
                                        </blockquote>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="footer-content">
                            <div id="fb-root2">
                                <div class="footer-static-content">
                                    <div class="fb-page" data-href="#" data-tabs="timeline" data-width=""
                                         data-height="215"
                                         data-small-header="false" data-adapt-container-width="true"
                                         data-hide-cover="false"
                                         data-show-facepile="true">
                                        <blockquote cite="#" class="fb-xfbml-parse-ignore"><a
                                                href="mailTo:20130450@st.hcmuaf.edu.vn">Vũ
                                            Ngọc Thanh
                                            Trúc </a>
                                        </blockquote>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="footer-content">
                            <div id="fb-root3">
                                <div class="footer-static-content">
                                    <div class="fb-page" data-href="#" data-tabs="timeline" data-width=""
                                         data-height="215"
                                         data-small-header="false" data-adapt-container-width="true"
                                         data-hide-cover="false"
                                         data-show-facepile="true">
                                        <blockquote cite="#" class="fb-xfbml-parse-ignore"><a
                                                href="mailTo:20130479@st.hcmuaf.edu.vn">Nguyễn Mạnh
                                            Quyền </a>
                                        </blockquote>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-footer--copyright">
        <div class="container">
            <hr>
            <div class="main-footer--border" style="text-align:center;padding-bottom: 15px;">
                <p>© 2022 - Bản quyền thuộc về <a href="#">Phone Care</a></p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script async defer crossorigin="anonymous" src="plugins/sdk.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="plugins/bootstrap/popper.min.js"></script>
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<script src="plugins/owl.carousel/owl.carousel.min.js"></script>
<script src="js/home.js"></script>
<script src="js/script.js"></script>
<script src="plugins/uikit/uikit.min.js"></script>
<script src="plugins/uikit/uikit-icons.min.js"></script>

<script src="plugins/uikit-3.13.7/uikit-3.13.7/src/js/uikit.js"></script>
<script src="plugins/uikit-3.13.7/uikit-3.13.7/src/js/uikit-core.js"></script>

<!-- Mini Cart -->
<%--<script src="js/minicart.min.js"></script>--%>
<%--<script src="js/validationUser.js"></script>--%>
<script>
    paypal.minicart.render({
        action: '#'
    });

    if (~window.location.search.indexOf('reset=true')) {
        paypal.minicart.reset();
    }

</script>

</body>
</html>
